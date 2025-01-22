import 'package:flutter/material.dart';
import 'package:twitter/constants/icons.dart';

class TwitterScaffold extends StatelessWidget {
  final Widget child;

  const TwitterScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: twitterIcon,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
