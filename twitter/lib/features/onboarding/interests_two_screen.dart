import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:twitter/constants/divider.dart';
import 'package:twitter/constants/dummy_interests.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/icons.dart';
import 'package:twitter/features/onboarding/widgets/bottom_bar.dart';
import 'package:twitter/features/onboarding/widgets/title_description.dart';

class InterestsTwoScreen extends StatefulWidget {
  const InterestsTwoScreen({super.key});

  @override
  State<InterestsTwoScreen> createState() => _InterestsTwoScreenState();
}

class _InterestsTwoScreenState extends State<InterestsTwoScreen> {
  final Set<String> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: twitterIcon,
        leading: IconButton(
          onPressed: () => _onBackButtonTap(context),
          icon: backIcon,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: TitleDescription(
                  title: "What do you want to see on Twitter?",
                  description:
                      "Interests are used to personalize your experience and will be visible on your profile.",
                ),
              ),
              for (final (title, items) in [
                ("Music", musics),
                ("Entertainment", entertainment),
                ("Dummy", dummy)
              ])
                _interestsGrid(
                  title: title,
                  items: items,
                ),
              divider,
              Gaps.v64,
            ],
          ),
        ),
      ),
      bottomSheet: BottomBar(
        isNextEnabled: _selectedItems.length >= 3,
        onNextTap: () {},
      ),
    );
  }

  Column _interestsGrid({
    required String title,
    required List<String> items,
  }) {
    return Column(
      children: [
        divider,
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              SizedBox(
                height: 140,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: StaggeredGrid.count(
                    axisDirection: AxisDirection.right,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      for (final text in items) _interestsGridCard(text),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector _interestsGridCard(String text) {
    final isSelected = _selectedItems.contains(text);

    return GestureDetector(
      onTap: () => _onInterestsCardTap(
        isSelected: isSelected,
        text: text,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : null,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : null,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _onBackButtonTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onInterestsCardTap({
    required bool isSelected,
    required String text,
  }) {
    if (isSelected) {
      _selectedItems.remove(text);
    } else {
      _selectedItems.add(text);
    }
    setState(() {});
  }
}
