import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/core/constants/namespace/app_routes.dart';
import 'package:threads/core/constants/thread_divider.dart';
import 'package:threads/features/settings/views/widgets/settings_scaffold.dart';
import 'package:threads/features/settings/views/widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isShowIndicator = false;

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Settings",
      onBackTap: () => _onBackTap(),
      child: Column(
        children: [
          SettingsTile(
            icon: FontAwesomeIcons.userPlus,
            text: "Follow and invite friends",
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.bell,
            text: "Notifications",
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.lock,
            text: "Privacy",
            onTap: () => _onPrivacyTap(),
          ),
          SettingsTile(
            icon: FontAwesomeIcons.circleUser,
            text: "Account",
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.circleQuestion,
            text: "Help",
            onTap: () {},
          ),
          SettingsTile(
            icon: FontAwesomeIcons.circleInfo,
            text: "About",
            onTap: () {},
          ),
          threadDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => _showLogoutDialog(),
                child: const Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ),
              if (_isShowIndicator)
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: CircularProgressIndicator.adaptive(),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _onBackTap() {
    context.go(AppRoutes.profile);
  }

  void _onPrivacyTap() {
    context.push(AppRoutes.privacy);
  }

  Future<void> _showLogoutDialog() async {
    setState(() {
      _isShowIndicator = true;
    });
    await showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text("Log out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Log out",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
    setState(() {
      _isShowIndicator = false;
    });
  }
}
