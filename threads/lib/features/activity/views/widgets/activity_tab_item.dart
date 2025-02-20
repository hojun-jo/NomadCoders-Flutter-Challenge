import 'package:flutter/material.dart';

class ActivityTabItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ActivityTabItem({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tab(
      child: Container(
        width: 100,
        height: 36,
        decoration: BoxDecoration(
          color:
              isSelected ? theme.primaryColor : theme.scaffoldBackgroundColor,
          border: Border.all(
            color: isSelected ? theme.primaryColor : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? theme.scaffoldBackgroundColor
                  : theme.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
