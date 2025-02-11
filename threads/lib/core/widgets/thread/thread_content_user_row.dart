import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/home/views/widgets/home_bottom_sheet.dart';
import 'package:threads/core/widgets/profile/user_name_check_icon_row.dart';
import 'package:threads/core/widgets/small_icon_button.dart';

class ThreadContentUserRow extends StatelessWidget {
  final String userName;
  final bool userIsVerified;
  final String postTime;

  const ThreadContentUserRow({
    super.key,
    required this.userName,
    required this.userIsVerified,
    required this.postTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        UserNameCheckIconRow(
          userName: userName,
          isVerified: userIsVerified,
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
        return const HomeBottomSheet();
      },
    );
  }
}
