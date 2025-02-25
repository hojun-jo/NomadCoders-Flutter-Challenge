import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/thread_separator.dart';
import 'package:threads/features/home/view_models/home_view_model.dart';
import 'package:threads/core/widgets/thread/thread_item.dart';

class HomeScreen extends ConsumerWidget {
  final HomeViewModel viewModel;

  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeProvider.notifier);

    return ref.watch(homeProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          data: (data) => RefreshIndicator(
            onRefresh: () => _onRefresh(ref),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  centerTitle: true,
                  title: Icon(
                    FontAwesomeIcons.threads,
                    size: 36,
                  ),
                ),
                SliverList.separated(
                  itemCount: data.length,
                  separatorBuilder: (context, index) => threadSeparator,
                  itemBuilder: (context, index) {
                    return ThreadItem(
                      userName: "anonymous",
                      avatarUrl: null,
                      avatarDecoration: null,
                      userIsVerified: false,
                      description: data[index].description,
                      images: data[index].images,
                      postTime: viewModel.formmatPostTime(data[index].postTime),
                      replies: data[index].replies,
                      likes: data[index].likes,
                    );
                  },
                ),
              ],
            ),
          ),
        );
  }

  Future<void> _onRefresh(WidgetRef ref) async {
    await ref.read(homeProvider.notifier).refreshThreads();
  }
}
