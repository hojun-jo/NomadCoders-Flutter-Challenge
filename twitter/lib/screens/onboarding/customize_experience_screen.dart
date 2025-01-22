import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';

class CustomizeExperienceScreen extends StatelessWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TwitterScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const BoldTitle(text: "Customize your experience"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CupertinoSwitch(value: false, onChanged: (value) {}),
              ],
            ),
            const Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
