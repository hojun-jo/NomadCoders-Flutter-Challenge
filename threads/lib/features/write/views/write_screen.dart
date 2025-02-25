import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/camera/views/camera_screen.dart';
import 'package:threads/features/write/view_models/write_view_model.dart';
import 'package:threads/features/write/views/widgets/write_avatar_column.dart';
import 'package:threads/features/write/views/widgets/write_bottom_row.dart';
import 'package:threads/features/write/views/widgets/write_content_column.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = ref.watch(writeProvider);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 16,
            ),
          ),
        ),
        title: Text(
          "New thread",
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: viewModel.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const WriteAvatarColumn(),
                          Gaps.h10,
                          WriteContentColumn(
                            userName: "user name",
                            images: Future.value(viewModel.value?.images),
                            deleteImage: _deleteImage,
                            onTextFieldChanged: _onTextFieldChanged,
                            onClipTap: () => _onClipTap(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  WriteBottomRow(
                    isPostable: ref.read(writeProvider.notifier).isPostable,
                    onPostTap: () => _uploadThread(),
                  ),
                ],
              ),
      ),
    );
  }

  void _deleteImage(int index) {
    ref.read(writeProvider.notifier).deleteImage(index);
  }

  void _onTextFieldChanged(String text) {
    ref.read(writeProvider.notifier).updateDescription(text);
  }

  Future<void> _onClipTap() async {
    final imagePaths = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );

    ref.read(writeProvider.notifier).addImages(imagePaths);
  }

  Future<void> _uploadThread() async {
    await ref.read(writeProvider.notifier).uploadThread();
    context.pop();
  }
}
