import 'package:flutter/material.dart';

class WorkSuitabilityItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final int level;

  const WorkSuitabilityItem({
    super.key,
    required this.imagePath,
    required this.text,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withAlpha(70)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        spacing: 8,
        children: [
          Image.asset(imagePath),
          Text(
            text,
            style: TextStyle(
              color: level > 0 ? Colors.white : Colors.grey.withAlpha(180),
            ),
          ),
          Spacer(),
          if (level > 0)
            Text("Lv.$level", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
