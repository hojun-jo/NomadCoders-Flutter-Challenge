import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/home/views/widgets/small_icon_button.dart';
import 'package:threads/shared/widget/bottom_sheet/report_sheet.dart';
import 'package:threads/shared/widget/bottom_sheet/threads_button_sheet.dart';
import 'package:threads/shared/widget/bottom_sheet/threads_sheet_button.dart';
import 'package:threads/shared/widget/bottom_sheet/threads_sheet_section.dart';

class PostContentUserRow extends StatelessWidget {
  final String userName;
  final String postTime;

  const PostContentUserRow({
    super.key,
    required this.userName,
    required this.postTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.h4,
            const Icon(
              Icons.check_circle,
              size: 14,
              color: Colors.blue,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              postTime,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            Gaps.h14,
            SmallIconButton(
              icon: FontAwesomeIcons.ellipsis,
              onTap: () => _showBottomSheet(context),
            ),
          ],
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
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
      },
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
