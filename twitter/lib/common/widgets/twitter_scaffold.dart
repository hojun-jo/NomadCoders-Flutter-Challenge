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
                onPressed: () => _onBackButtonTap(context),
                icon: backIcon,
              )
            : null,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 36,
            right: 36,
          ),
          child: body,
        ),
      ),
      bottomSheet: bottomSheet,
    );
  }

  void _onBackButtonTap(BuildContext context) {
    Navigator.of(context).pop();
  }
}
