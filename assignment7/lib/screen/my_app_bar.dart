import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              "assets/images/profile.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
          const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
