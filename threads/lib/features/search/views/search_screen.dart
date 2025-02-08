import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/shared/widget/screen_title.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ScreenTitle(text: "Search"),
              Gaps.v10,
              CupertinoSearchTextField(),
            ],
          ),
        ),
        Gaps.v10,
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Container(
              color: Colors.grey.shade200,
              height: 1,
              margin: const EdgeInsets.only(left: 72, top: 10),
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
