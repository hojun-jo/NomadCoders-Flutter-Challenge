import 'package:flutter/material.dart';
import 'package:twitter/constants/icons.dart';

class TwitterScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomSheet;

  const TwitterScaffold({
    super.key,
    required this.body,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: twitterIcon,
        leading: Navigator.of(context).canPop()
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: backIcon,
              )
            : null,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          child: body,
        ),
      ),
      bottomSheet: bottomSheet,
    );
  }
}
