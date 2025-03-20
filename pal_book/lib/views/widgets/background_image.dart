import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String path;

  const BackgroundImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(path, fit: BoxFit.cover),
        ),
        Container(color: Colors.black.withAlpha(100)),
      ],
    );
  }
}
