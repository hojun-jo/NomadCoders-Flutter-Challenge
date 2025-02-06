import 'package:flutter/material.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/shared/widget/profile/avatar.dart';

class WriteAvatarColumn extends StatelessWidget {
  const WriteAvatarColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Avatar(imageUrl: dummyAvatarUrl),
        Gaps.v10,
        Container(
          color: Colors.grey.shade200,
          width: 2,
          height: 50,
        ),
        AnimatedOpacity(
          opacity: 0.5,
          duration: Duration.zero,
          child: Transform.scale(
            scale: 0.5,
            child: const Avatar(imageUrl: dummyAvatarUrl),
          ),
        ),
      ],
    );
  }
}
