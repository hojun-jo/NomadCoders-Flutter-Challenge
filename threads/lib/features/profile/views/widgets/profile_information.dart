import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/profile/avatar.dart';
import 'package:threads/features/profile/views/widgets/expanded_round_button.dart';

class ProfileInformation extends StatelessWidget {
  final String name;
  final String userName;
  final String? avatarUrl;
  final String bio;
  final int followers;

  const ProfileInformation({
    super.key,
    required this.name,
    required this.userName,
    this.avatarUrl,
    required this.bio,
    required this.followers,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 15,
                        ),
                      ),
                      Gaps.h4,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "threads.net",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.v10,
                  Text(
                    bio,
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                  Gaps.v16,
                  Row(
                    children: [
                      //TODO: Stack Positioned Transform.scale Avatar
                      const Icon(Icons.star),
                      Text(
                        "$followers followers",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.translate(
                offset: const Offset(-10, 15),
                child: Transform.scale(
                  scale: 1.5,
                  child: Avatar(imageUrl: avatarUrl),
                ),
              ),
            ],
          ),
          Gaps.v20,
          Row(
            children: [
              ExpandedRoundButton(
                text: "Edit profile",
                onTap: () {},
              ),
              Gaps.h10,
              ExpandedRoundButton(
                text: "Share profile",
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
