import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final IconData? decoration;
  final Color? decorationColor;

  const Avatar({
    super.key,
    required this.imageUrl,
    this.decoration,
    this.decorationColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        ),
        if (decoration != null)
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: decorationColor,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  decoration,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
