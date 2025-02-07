import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  // TODO: Icon enum으로 만들고 넣어야할 듯
  final bool isShowAdd;

  const Avatar({
    super.key,
    required this.imageUrl,
    this.isShowAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          foregroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        ),
        if (isShowAdd)
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
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
