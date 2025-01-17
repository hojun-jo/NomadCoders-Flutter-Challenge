import 'package:assignment9/model/my_color.dart';
import 'package:flutter/material.dart';

// TODO: - isSelected를 뷰모델이든 외부에서 판단할 수 있도록
class IntervalCard extends StatelessWidget {
  final int _interval;
  final int _selectedInterval;
  final VoidCallback _onTap;

  const IntervalCard({
    super.key,
    required int interval,
    required int selectedInterval,
    required VoidCallback onTap,
  })  : _selectedInterval = selectedInterval,
        _interval = interval,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected() ? MyColor.mainWhite : MyColor.mainRed,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isSelected() ? MyColor.mainWhite : MyColor.pinkRed,
            width: 4,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        margin: const EdgeInsets.only(right: 15),
        child: Text(
          "$_interval",
          style: TextStyle(
            color: _isSelected() ? MyColor.mainRed : MyColor.pinkRed,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  bool _isSelected() {
    return _interval == _selectedInterval / 60;
  }
}
