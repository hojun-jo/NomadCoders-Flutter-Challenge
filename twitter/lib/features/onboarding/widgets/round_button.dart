import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isEnabled;
  final VoidCallback onTap;
  final bool isSmall;

  const RoundButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.isEnabled,
    required this.onTap,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : () {},
      child: Container(
        width: isSmall ? null : MediaQuery.of(context).size.width,
        padding: isSmall
            ? const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              )
            : const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isEnabled ? backgroundColor : Colors.grey,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isEnabled ? Colors.white : Colors.grey.shade400,
              fontSize: isSmall ? null : 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
