import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/thread_separator.dart';
import 'package:threads/core/utils/date_formatter.dart';
import 'package:threads/core/widgets/thread/thread_item.dart';
import 'package:threads/features/profile/models/profile_tab.dart';
import 'package:threads/features/profile/views/widgets/profile_information.dart';
import 'package:threads/features/profile/views/widgets/profile_tab_bar.dart';
import 'package:threads/features/settings/views/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: ProfileTab.values.length,
    vsync: this,
  );
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          leading: const Icon(FontAwesomeIcons.globe),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.instagram),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.barsStaggered),
              onPressed: () => _onSettingsTap(context),
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: ProfileInformation(
            avatarUrl: dummyAvatarUrl,
            name: "name",
            userName: "userName",
            bio: "bio",
            followers: 2,
          ),
        ),
        SliverPersistentHeader(
          // pinned: true,
          floating: true,
          delegate: ProfileTabBar(controller: _tabController),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: ProfileTab.values.map((tab) {
              // TODO: 데이터 바인딩
              final items = dummyThreads;
              return ListView.separated(
                controller: _scrollController,
                separatorBuilder: (context, index) => threadSeparator,
                itemCount: items.length,
                itemBuilder: (context, index) => ThreadItem(
                  avatarUrl: items[index].user.avatarUrl,
                  userName: items[index].user.name,
                  userIsVerified: items[index].user.isVerified,
                  images: items[index].images,
                  description: items[index].description,
                  postTime: DateFormatter.difference(items[index].postTime),
                  replies: items[index].replies,
                  likes: items[index].likes,
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  void _onSettingsTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }
}
