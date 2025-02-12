import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';

class CameraInitializingIndicator extends StatelessWidget {
  const CameraInitializingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Initializing...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Gaps.v20,
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
