import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/search/views/widgets/search_list_item.dart';

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
              Text(
                "Search",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              CupertinoSearchTextField(),
            ],
          ),
        ),
        Gaps.v10,
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              indent: 54,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const SearchListItem(
                isShowIcon: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
