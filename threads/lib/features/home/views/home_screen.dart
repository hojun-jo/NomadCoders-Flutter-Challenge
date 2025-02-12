import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/thread_separator.dart';
import 'package:threads/features/home/view_models/home_view_model.dart';
import 'package:threads/core/widgets/thread/thread_item.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Center(
            child: Icon(
              FontAwesomeIcons.threads,
              size: 36,
            ),
          ),
        ),
        // TODO: 데이터 바인딩
        SliverList.separated(
          itemCount: viewModel.itemCount,
          separatorBuilder: (context, index) => threadSeparator,
          itemBuilder: (context, index) {
            return ThreadItem(
              userName: viewModel.getUserName(index),
              avatarUrl: viewModel.getUserAvatarUrl(index),
              avatarDecoration: viewModel.getAvatarDecoration(index),
              userIsVerified: viewModel.getUserIsVerified(index),
              description: viewModel.getDescription(index),
              images: viewModel.getImages(index),
              postTime: viewModel.getPostTime(index),
              replies: viewModel.getReplies(index),
              likes: viewModel.getLikes(index),
            );
          },
        ),
      ],
    );
  }
}
