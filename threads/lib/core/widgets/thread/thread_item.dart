import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:threads/core/widgets/center_error_text.dart';
import 'package:threads/core/widgets/thread/thread_content.dart';
import 'package:threads/core/widgets/thread/thread_replies_row.dart';
import 'package:threads/features/home/view_models/home_view_model.dart';

class ThreadItem extends ConsumerWidget {
  final ThreadModel data;

  const ThreadItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeProvider.notifier);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          data.hasImage
              ? FutureBuilder(
                  future: viewModel.fetchThreadImages(data.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return CenterErrorText(text: snapshot.error.toString());
                    }
                    return ThreadContent(
                      userName: "anonymous",
                      avatarUrl: null,
                      avatarDecoration: null,
                      userIsVerified: false,
                      description: data.description,
                      images: snapshot.data,
                      postTime: viewModel.formmatPostTime(data.postTime),
                    );
                  })
              : ThreadContent(
                  userName: "anonymous",
                  avatarUrl: null,
                  avatarDecoration: null,
                  userIsVerified: false,
                  description: data.description,
                  images: null,
                  postTime: viewModel.formmatPostTime(data.postTime),
                ),
          ThreadRepliesRow(
            replies: data.replies,
            likes: data.likes,
          ),
        ],
      ),
    );
  }
}
