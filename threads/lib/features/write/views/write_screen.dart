import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/write/views/widgets/write_bottom_row.dart';
import 'package:threads/shared/widget/profile/avatar.dart';
import 'package:threads/shared/widget/small_icon_button.dart';

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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Avatar(imageUrl: dummyAvatarUrl),
                        Gaps.v10,
                        Container(
                          color: Colors.grey.shade200,
                          width: 2,
                          height: 50,
                        ),
                        AnimatedOpacity(
                          opacity: 0.5,
                          duration: Duration.zero,
                          child: Transform.scale(
                            scale: 0.5,
                            child: const Avatar(imageUrl: dummyAvatarUrl),
                          ),
                        ),
                      ],
                    ),
                    Gaps.h10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "user name",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextField(
                            onChanged: (value) => _onTextFieldChanged(value),
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
                            onTap: () {},
                          ),
                        ],
                      ),
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
