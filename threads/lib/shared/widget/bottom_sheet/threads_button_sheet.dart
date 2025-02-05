import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/shared/widget/bottom_sheet/threads_sheet.dart';
import 'package:threads/shared/widget/bottom_sheet/threads_sheet_section.dart';

class ThreadsButtonSheet extends StatelessWidget {
  final List<ThreadsSheetSection> sections;

  const ThreadsButtonSheet({
    super.key,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final length = sections.length;
    return IntrinsicHeight(
      child: ThreadsSheet(
        children: [
          if (length > 1)
            for (int i = 0; i < length - 1; i++) ...[
              sections[i],
              Gaps.v20,
            ],
          sections.last,
        ],
      ),
    );
  }
}
