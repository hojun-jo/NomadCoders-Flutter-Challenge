import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/thread_separator.dart';
import 'package:threads/core/widgets/center_error_text.dart';
import 'package:threads/core/widgets/center_progress_indicator.dart';
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
    final threads = ref.watch(homeProvider);

    return threads.when(
      loading: () => const CenterProgressIndicator(),
      error: (error, stackTrace) => CenterErrorText(text: error.toString()),
      data: (data) {
        return CustomScrollView(
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
                  data: data[index],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
