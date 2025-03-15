import 'package:flutter/material.dart';

class WriteBottomRow extends StatelessWidget {
  final bool isPostable;
  final VoidCallback onPostTap;

  const WriteBottomRow({
    super.key,
    required this.isPostable,
    required this.onPostTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Anyone can reply",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: onPostTap,
          child: Text(
            "Post",
            style: TextStyle(
              color:
                  isPostable ? Colors.blue : Colors.blue.withValues(alpha: 0.5),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
