import 'package:flutter/material.dart';
import 'package:threads/core/widgets/bottom_sheet/report_sheet.dart';
import 'package:threads/core/widgets/bottom_sheet/threads_button_sheet.dart';
import 'package:threads/core/widgets/bottom_sheet/threads_sheet_button.dart';
import 'package:threads/core/widgets/bottom_sheet/threads_sheet_section.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ThreadsButtonSheet(
      sections: [
        ThreadsSheetSection(
          buttons: [
            ThreadsSheetButton(text: "Unfollow", onTap: () {}),
            ThreadsSheetButton(text: "Mute", onTap: () {}),
          ],
        ),
        ThreadsSheetSection(
          buttons: [
            ThreadsSheetButton(text: "Hide", onTap: () {}),
            ThreadsSheetButton(
              text: "Report",
              isDestructive: true,
              onTap: () => _showReportSheet(context),
            ),
          ],
        ),
      ],
    );
  }

  void _showReportSheet(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ReportSheet();
      },
    );
  }
}
