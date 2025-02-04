import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/constants/dummy.dart';
import 'package:threads/features/home/models/post_model.dart';
import 'package:threads/features/home/views/widgets/post_content.dart';
import 'package:threads/features/home/views/widgets/post_replies_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = dummyPosts.toList();

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Icon(
            FontAwesomeIcons.threads,
            size: 36,
          ),
        ),
        SliverList.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(
            thickness: 0.5,
          ),
          itemBuilder: (context, index) {
            return PostItem(
              item: items[index],
            );
          },
        ),
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  final PostModel item;

  const PostItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          PostContent(
            userName: item.userName,
            userAvatarUrl: item.userAvatarUrl,
            description: item.description,
            images: item.images,
            postTime: item.postTime,
          ),
          PostRepliesRow(
            replies: item.replies,
            likes: item.likes,
          ),
        ],
      ),
    );
  }
}
