import 'package:flutter/material.dart';

class TintContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;

  const TintContainer({
    super.key,
    this.width,
    this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(120),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
