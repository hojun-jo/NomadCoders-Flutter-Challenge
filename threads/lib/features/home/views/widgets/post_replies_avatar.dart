import 'package:flutter/material.dart';
import 'package:threads/features/home/views/widgets/avatar.dart';

class PostRepliesAvatar extends StatelessWidget {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double size;

  const PostRepliesAvatar({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: const Avatar(),
      ),
    );
  }
}
