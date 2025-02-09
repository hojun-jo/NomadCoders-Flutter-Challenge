import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  const ListSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      height: 1,
      margin: const EdgeInsets.only(left: 72, top: 10),
    );
  }
}
