import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.orange,
        ),
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
