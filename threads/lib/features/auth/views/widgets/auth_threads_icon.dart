import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthThreadsIcon extends StatelessWidget {
  const AuthThreadsIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        FontAwesomeIcons.threads,
        size: 60,
        color: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
