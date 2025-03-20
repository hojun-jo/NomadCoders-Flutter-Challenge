import 'package:flutter/material.dart';
import 'package:pal_book/models/pal_elements.dart';

class ElementsBox extends StatelessWidget {
  final PalElements elements;

  const ElementsBox({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: elements.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(elements.icon, color: Colors.white),
          Text(elements.text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
