import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? trailingText;
  final IconData? trailingIcon;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.text,
    this.trailingText,
    this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 17,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          Icon(
            trailingIcon,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
