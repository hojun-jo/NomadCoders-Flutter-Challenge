import 'package:flutter/material.dart';
import 'package:twitter/features/onboarding/widgets/round_button.dart';

class BottomBar extends StatelessWidget {
  final Widget leading;
  final bool isNextEnabled;
  final VoidCallback onNextTap;

  const BottomBar({
    super.key,
    this.leading = const Spacer(),
    required this.isNextEnabled,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      padding: const EdgeInsets.only(
        top: 10,
        left: 40,
        right: 40,
        bottom: 40,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          RoundButton(
            text: "Next",
            isSmall: true,
            backgroundColor: Colors.black,
            isEnabled: isNextEnabled,
            onTap: onNextTap,
          ),
        ],
      ),
    );
  }
}
