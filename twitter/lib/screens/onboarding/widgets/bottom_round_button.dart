import 'package:flutter/material.dart';

class BottomRoundButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isEnabled;
  final VoidCallback onTap;

  const BottomRoundButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isEnabled ? backgroundColor : Colors.grey,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
