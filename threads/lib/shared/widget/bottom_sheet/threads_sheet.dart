import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/shared/widget/bottom_sheet/threads_sheet_section.dart';

class ThreadsSheet extends StatelessWidget {
  final List<ThreadsSheetSection> sections;

  const ThreadsSheet({
    super.key,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final length = sections.length;
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          top: 14,
          left: 20,
          right: 20,
          bottom: 60,
        ),
        child: Column(
          children: [
            Container(
              width: 36,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Gaps.v16,
            if (length > 1)
              for (int i = 0; i < length - 1; i++) ...[
                sections[i],
                Gaps.v20,
              ],
            sections.last,
          ],
        ),
      ),
    );
  }
}
