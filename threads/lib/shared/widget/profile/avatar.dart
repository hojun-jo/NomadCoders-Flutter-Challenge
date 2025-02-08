import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final IconData? avatarDecoration;
  final Color avatarDecorationColor;

  const Avatar({
    super.key,
    required this.imageUrl,
    this.avatarDecoration,
    this.avatarDecorationColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          foregroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        ),
        if (avatarDecoration != null)
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: avatarDecorationColor,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  avatarDecoration,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
