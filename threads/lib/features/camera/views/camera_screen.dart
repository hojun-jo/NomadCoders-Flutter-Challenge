import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:threads/core/constants/gaps.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late final bool _noCamera = kDebugMode && Platform.isIOS;
  late CameraController _cameraController;
  late FlashMode _flashMode;
  bool _hasPermission = false;
  final bool _isSelfieMode = false;

  @override
  void initState() {
    super.initState();
    if (!_noCamera) {
      initPermissions();
    } else {
      setState(() {
        _hasPermission = true;
      });
    }
  }

  @override
  void dispose() {
    if (!_noCamera) {
      _cameraController.dispose();
    }
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

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 0 : 1],
      ResolutionPreset.ultraHigh,
    );

    await _cameraController.initialize();

    _flashMode = _cameraController.value.flashMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: !_hasPermission
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Initializing...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Gaps.v20,
                CircularProgressIndicator.adaptive(),
              ],
            )
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
                      const BackButton(),
                      Positioned(
                        bottom: 40,
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CameraButton(
                              icon: Icons.flash_off,
                              onTap: () {},
                            ),
                            Shutter(
                              onTap: () {},
                            ),
                            CameraButton(
                              icon: FontAwesomeIcons.arrowsRotate,
                              onTap: () {},
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
                        onPressed: () {},
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
}

class Shutter extends StatelessWidget {
  final VoidCallback onTap;

  const Shutter({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: 1,
              color: Colors.white,
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class CameraButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CameraButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 10,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.chevronLeft,
          color: Colors.white,
        ),
      ),
    );
  }
}
