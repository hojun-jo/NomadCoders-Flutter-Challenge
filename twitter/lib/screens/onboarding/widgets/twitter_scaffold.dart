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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        //TODO - leading 3종류
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
