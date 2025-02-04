import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/features/home/views/widgets/post_content_row.dart';
import 'package:threads/features/home/views/widgets/post_replies_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Icon(
            FontAwesomeIcons.threads,
            size: 36,
          ),
        ),
        SliverList.separated(
          separatorBuilder: (context, index) => const Divider(
            thickness: 0.5,
          ),
          itemBuilder: (context, index) {
            return const PostItem();
          },
        ),
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.yellow,
      child: const Column(
        children: [
          PostContentRow(),
          PostRepliesRow(
            replies: 36,
            likes: 391,
          ),
        ],
      ),
    );
  }
}
