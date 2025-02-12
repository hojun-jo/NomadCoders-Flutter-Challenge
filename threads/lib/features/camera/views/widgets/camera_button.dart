import 'package:flutter/material.dart';

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
