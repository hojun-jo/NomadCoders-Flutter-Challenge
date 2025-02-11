import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/constants/thread_divider.dart';
import 'package:threads/features/settings/views/widgets/settings_scaffold.dart';
import 'package:threads/features/settings/views/widgets/settings_tile.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfile = true;

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Privacy",
      child: Column(
        children: [
          SwitchListTile.adaptive(
            activeColor: Colors.black,
            title: const Row(
              children: [
                Icon(FontAwesomeIcons.lock),
                Gaps.h16,
                Text(
                  "Private profile",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            value: _isPrivateProfile,
            onChanged: (value) {
              _isPrivateProfile = value;
              setState(() {});
            },
          ),
          SettingsTile(
            icon: FontAwesomeIcons.at,
            text: "Mentions",
            trailingText: "Everyone",
            trailingIcon: FontAwesomeIcons.chevronRight,
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.bellSlash,
            text: "Muted",
            trailingIcon: FontAwesomeIcons.chevronRight,
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.eyeSlash,
            text: "Hidden Words",
            trailingIcon: FontAwesomeIcons.chevronRight,
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.userGroup,
            text: "Profiles you follow",
            trailingIcon: FontAwesomeIcons.chevronRight,
            onTap: () {},
          ),
          threadDivider,
          const ListTile(
            title: Text(
              "Ohter privacy settings",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  color: Colors.grey,
                  size: 16,
                ),
              ],
            ),
          ),
          SettingsTile(
            icon: FontAwesomeIcons.circleXmark,
            text: "Blocked profiles",
            trailingIcon: FontAwesomeIcons.arrowUpRightFromSquare,
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.heartCircleXmark,
            text: "Hide likes",
            trailingIcon: FontAwesomeIcons.arrowUpRightFromSquare,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
