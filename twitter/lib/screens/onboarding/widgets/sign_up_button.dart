import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/models/oauth.dart';

class SignUpButton extends StatelessWidget {
  final OAuth? oauth;
  final VoidCallback onTap;

  const SignUpButton({
    super.key,
    this.oauth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: oauth != null ? null : Colors.black,
          border: oauth != null ? Border.all(color: Colors.grey) : null,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
        margin: const EdgeInsets.only(bottom: 15),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (oauth != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FaIcon(oauth!.toIcon()),
          Text(
            "Continue with ${oauth.toString()}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: Text(
          "Create account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    }
  }
}
