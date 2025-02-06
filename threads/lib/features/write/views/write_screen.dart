import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/write/views/widgets/write_avatar_column.dart';
import 'package:threads/features/write/views/widgets/write_bottom_row.dart';
import 'package:threads/features/write/views/widgets/write_content_column.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  bool isPostable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        title: const Text(
          "New thread",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WriteAvatarColumn(),
                    Gaps.h10,
                    WriteContentColumn(
                      userName: "user name",
                      onTextFieldChanged: _onTextFieldChanged,
                      onClipTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            WriteBottomRow(
              isPostable: isPostable,
              onPostTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _onTextFieldChanged(String text) {
    if (text.isNotEmpty) {
      isPostable = true;
    } else {
      isPostable = false;
    }
    setState(() {});
  }
}
