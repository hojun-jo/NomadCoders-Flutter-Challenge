import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  final VoidCallback onTap;

  const BackIconButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 10,
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
