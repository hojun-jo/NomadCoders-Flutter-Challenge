import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/features/profile/models/profile_tab.dart';
import 'package:threads/features/profile/views/widgets/profile_information.dart';
import 'package:threads/features/profile/views/widgets/profile_tab_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(
    length: ProfileTab.values.length,
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const Icon(FontAwesomeIcons.globe),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.instagram),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.barsStaggered),
              onPressed: () {},
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
          delegate: ProfileTabBar(controller: _controller),
        ),
      ],
    );
  }
}
