import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final Color? borderColor;
  final double borderRadius;
  final double? width;
  final double? height;

  const RoundButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    required this.color,
    this.borderColor,
    required this.borderRadius,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
