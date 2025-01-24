import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
  final double? size;

  const CheckIcon({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle,
      color: Colors.green,
      size: size,
    );
  }
}
