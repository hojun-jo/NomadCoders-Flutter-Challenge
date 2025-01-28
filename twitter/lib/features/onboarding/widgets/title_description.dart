import 'package:flutter/material.dart';
import 'package:twitter/common/common.dart';
import 'package:twitter/constants/gaps.dart';

class TitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleDescription({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldTitle(
          text: title,
        ),
        Gaps.v20,
        PolicyText(
          text: description,
          size: 14,
        ),
      ],
    );
  }
}
