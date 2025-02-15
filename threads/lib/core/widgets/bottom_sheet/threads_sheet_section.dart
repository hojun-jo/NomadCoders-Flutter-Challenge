import 'package:flutter/material.dart';
import 'package:threads/core/widgets/bottom_sheet/threads_sheet_button.dart';

class ThreadsSheetSection extends StatelessWidget {
  final List<ThreadsSheetButton> buttons;

  const ThreadsSheetSection({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    final length = buttons.length;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          if (length > 1)
            for (int i = 0; i < length - 1; i++) ...[
              buttons[i],
              const Divider(),
            ],
          buttons.last,
        ],
      ),
    );
  }
}
