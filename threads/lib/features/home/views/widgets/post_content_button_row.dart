import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/home/views/widgets/small_icon_button.dart';

class PostContentButtonRow extends StatelessWidget {
  const PostContentButtonRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallIconButton(
          icon: FontAwesomeIcons.heart,
          onTap: () {},
        ),
        Gaps.h14,
        SmallIconButton(
          icon: FontAwesomeIcons.comment,
          onTap: () {},
        ),
        Gaps.h14,
        SmallIconButton(
          icon: FontAwesomeIcons.arrowsRotate,
          onTap: () {},
        ),
        Gaps.h14,
        SmallIconButton(
          icon: FontAwesomeIcons.paperPlane,
          onTap: () {},
        ),
      ],
    );
  }
}
