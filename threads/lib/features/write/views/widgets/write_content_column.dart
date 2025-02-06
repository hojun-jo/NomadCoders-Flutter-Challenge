import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/shared/widget/small_icon_button.dart';

class WriteContentColumn extends StatelessWidget {
  final String userName;
  final Function(String) onTextFieldChanged;
  final VoidCallback onClipTap;

  const WriteContentColumn({
    super.key,
    required this.userName,
    required this.onTextFieldChanged,
    required this.onClipTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            onChanged: (value) => onTextFieldChanged(value),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Start a thread...",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
            maxLines: null,
          ),
          Gaps.v10,
          SmallIconButton(
            icon: FontAwesomeIcons.paperclip,
            color: Colors.grey,
            onTap: onClipTap,
          ),
        ],
      ),
    );
  }
}
