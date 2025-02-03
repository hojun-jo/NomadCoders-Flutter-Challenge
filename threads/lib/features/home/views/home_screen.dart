import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/features/home/views/widgets/small_icon_button.dart';

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

class PostContentRow extends StatelessWidget {
  const PostContentRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange,
            ),
            // Expanded(
            //   child: Container(
            //     color: Colors.grey,
            //     width: 1,
            //   ),
            // ),
          ],
        ),
        Gaps.h10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "data",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.h4,
                      Icon(
                        Icons.check_circle,
                        size: 14,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "2m",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Gaps.h14,
                      SmallIconButton(
                        icon: FontAwesomeIcons.ellipsis,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const Text("asdlfkj oiasdjf okasdjflkjwel aowejoij sadfl"),
              Gaps.v10,
              Container(
                color: Colors.green,
                width: 200,
                height: 160,
              ),
              Gaps.v10,
              Row(
                children: [
                  SmallIconButton(
                    icon: FontAwesomeIcons.heart,
                    onTap: () {},
                  ),
                  Gaps.h14,
                  SmallIconButton(
                    icon: FontAwesomeIcons.comment,
                    onTap: () {},
                  ),
                  Gaps.h14,
                  SmallIconButton(
                    icon: FontAwesomeIcons.arrowsRotate,
                    onTap: () {},
                  ),
                  Gaps.h14,
                  SmallIconButton(
                    icon: FontAwesomeIcons.paperPlane,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PostRepliesRow extends StatelessWidget {
  final int replies;
  final int likes;

  const PostRepliesRow({
    super.key,
    required this.replies,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.orange,
        ),
        Gaps.h10,
        Text(
          "$replies replies · $likes likes",
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
