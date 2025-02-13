import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/camera/views/widgets/back_icon_button.dart';
import 'package:threads/features/camera/views/widgets/camera_button.dart';
import 'package:threads/features/camera/views/widgets/camera_initializing_indicator.dart';
import 'package:threads/features/camera/views/widgets/shutter.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  late final bool _noCamera = kDebugMode && Platform.isIOS;
  late CameraController _cameraController;
  late FlashMode _flashMode;

  bool _hasPermission = false;
  bool _isSelfieMode = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();

    if (!_noCamera) {
      initPermissions();
    } else {
      _hasPermission = true;
      setState(() {});
    }

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _isDisposed = true;
    if (!_noCamera) {
      _cameraController.dispose();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_noCamera) return;
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera();
    }
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    } else {
      // TODO: 권한 없을 경우
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 0 : 1],
      ResolutionPreset.ultraHigh,
    );

    if (_isDisposed) return;
    await _cameraController.initialize();
    if (_isDisposed) return;

    _flashMode = _cameraController.value.flashMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: !_hasPermission
          ? const CameraInitializingIndicator()
          : Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (!_noCamera && _cameraController.value.isInitialized)
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          child: CameraPreview(
                            _cameraController,
                          ),
                        ),
                      const BackIconButton(),
                      Positioned(
                        bottom: 40,
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CameraButton(
                              icon: _flashMode == FlashMode.off
                                  ? Icons.flash_off
                                  : Icons.flash_on,
                              onTap: _onFlashTap,
                            ),
                            Shutter(
                              onTap: () => _onShutterTap(),
                            ),
                            CameraButton(
                              icon: FontAwesomeIcons.arrowsRotate,
                              onTap: _onSelfieTap,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v20,
                Row(
                  children: [
                    const Spacer(),
                    const Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: _onLibraryTap,
                        child: const Text(
                          "Library",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }

  void _onFlashTap() {
    if (_flashMode == FlashMode.off) {
      _flashMode = FlashMode.always;
    } else {
      _flashMode = FlashMode.off;
    }
    setState(() {});
  }

  Future<void> _onShutterTap() async {
    try {
      final xfile = await _cameraController.takePicture();

      if (_isDisposed) return;

      Navigator.pop(context, [xfile.path]);
    } catch (e) {
      print(e);
    }
  }

  void _onSelfieTap() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  void _onLibraryTap() async {
    try {
      final imageXFiles = await ImagePicker().pickMultiImage(limit: 10);

      if (imageXFiles.isEmpty) return;

      final imagePaths = imageXFiles.map((xFile) {
        return xFile.path;
      }).toList();

      if (_isDisposed) return;

      Navigator.pop(context, imagePaths);
    } catch (e) {
      print(e);
    }
  }
}
