import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/small_icon_button.dart';

class WriteContentColumn extends StatelessWidget {
  final String userName;
  final Function(String) onTextFieldChanged;
  final Future<List<String>> images;
  final VoidCallback onClipTap;

  const WriteContentColumn({
    super.key,
    required this.userName,
    required this.onTextFieldChanged,
    required this.images,
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
          FutureBuilder(
            future: images,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final images = snapshot.data!;
                return SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      separatorBuilder: (context, index) => Gaps.h10,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              // height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.file(File(images[index])),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.x,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                );
              }
              return Container();
            },
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
