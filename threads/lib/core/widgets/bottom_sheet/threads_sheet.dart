import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';

class ThreadsSheet extends StatelessWidget {
  final List<Widget> children;
  final bool isVerticalPadding;

  const ThreadsSheet({
    super.key,
    required this.children,
    this.isVerticalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: MediaQuery.of(context).size.width,
      padding: isVerticalPadding
          ? const EdgeInsets.only(bottom: 60)
          : const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 60,
            ),
      child: Column(
        children: [
          Gaps.v14,
          Container(
            width: 36,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Gaps.v16,
          ...children,
        ],
      ),
    );
  }
}
