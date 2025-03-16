import 'package:custom_painter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? radius;
  final Color? backgroundColor;
  final VoidCallback onTap;

  const CircleIconButton({
    super.key,
    required this.icon,
    this.iconColor = Colors.grey,
    this.iconSize,
    this.radius = 25,
    this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? AppColors.lightGrey,
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
