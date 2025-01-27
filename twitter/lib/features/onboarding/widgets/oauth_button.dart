import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/models/oauth.dart';

class OAuthButton extends StatelessWidget {
  final OAuth oauth;
  final VoidCallback onTap;

  const OAuthButton({
    super.key,
    required this.oauth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FaIcon(oauth.toIcon()),
            Text(
              "Continue with ${oauth.toString()}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
