import 'package:flutter/material.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const TwitterScaffold(
      child: Placeholder(),
    );
  }
}
