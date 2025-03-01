import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/constants/thread_separator.dart';
import 'package:threads/core/widgets/center_error_text.dart';
import 'package:threads/core/widgets/center_progress_indicator.dart';
import 'package:threads/core/widgets/list_item.dart';
import 'package:threads/core/widgets/list_separator.dart';
import 'package:threads/core/widgets/screen_title.dart';
import 'package:threads/core/widgets/thread/thread_item.dart';
import 'package:threads/features/search/view_models/search_view_model.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      ref.read(searchProvider.notifier).search(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(searchProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const ScreenTitle(text: "Search"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CupertinoSearchTextField(
              controller: _controller,
            ),
          ),
          Gaps.v10,
          Expanded(
            child: ref.watch(searchProvider).when(
                  loading: () => const CenterProgressIndicator(),
                  error: (error, stackTrace) =>
                      CenterErrorText(text: error.toString()),
                  data: (data) {
                    final isSearching = viewModel.isSearching;
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          isSearching ? threadSeparator : const ListSeparator(),
                      itemCount: isSearching ? data.length : dummyUsers.length,
                      itemBuilder: (context, index) {
                        return isSearching
                            ? ThreadItem(
                                data: data[index],
                              )
                            : ListItem(
                                avatarUrl: dummyUsers[index].avatarUrl,
                                userName: dummyUsers[index].name,
                                userIsVerified: dummyUsers[index].isVerified,
                                subtitle: dummyUsers[index].bio,
                                isShowFollowButton: true,
                                description:
                                    "${viewModel.formmatFollowers(dummyUsers[index].followers)} followers",
                                isShowStar: true,
                              );
                      },
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
