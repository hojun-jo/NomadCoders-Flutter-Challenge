import 'package:flutter/material.dart';

class SmallIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SmallIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
