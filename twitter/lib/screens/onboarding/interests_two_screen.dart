import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/icons.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/bottom_bar.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';

class InterestsTwoScreen extends StatefulWidget {
  const InterestsTwoScreen({super.key});

  @override
  State<InterestsTwoScreen> createState() => _InterestsTwoScreenState();
}

class _InterestsTwoScreenState extends State<InterestsTwoScreen> {
  final List<String> _musics = [
    "Rap",
    "R&B & soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music industry",
    "EDM",
    "Music news",
    "Hip hop",
    "Reggae",
    "Jazz",
    "Rock",
    "Hard rock",
    "Metal",
    "Instruments",
  ];
  final List<String> _entertainment = [
    "Anime",
    "Movies & TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie news",
    "Naruto",
    "Movies",
    "Grammy Awards",
    "Entertainment",
  ];
  final List<String> _dummy = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Elderberry",
    "Fig",
    "Grapes",
    "Honeydew",
    "Iceberg Lettuce",
  ];

  final Set<String> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: twitterIcon,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BoldTitle(text: "What do you want to see on Twitter?"),
                    Gaps.v16,
                    PolicyText(
                        text:
                            "Interests are used to personalize your experience and will be visible on your profile."),
                  ],
                ),
              ),
              const Divider(
                height: 0.5,
              ),
              _interestsGrid(
                title: "Music",
                items: _musics,
              ),
              const Divider(
                height: 0.5,
              ),
              _interestsGrid(
                title: "Entertainment",
                items: _entertainment,
              ),
              const Divider(
                height: 0.5,
              ),
              _interestsGrid(
                title: "Dummy",
                items: _dummy,
              ),
              const Divider(
                height: 0.5,
              ),
              Gaps.v64,
            ],
          ),
        ),
      ),
      bottomSheet: BottomBar(
        isEnabled: _selectedItems.length >= 3,
        onNextTap: () {},
      ),
    );
  }

  Padding _interestsGrid({required String title, required List<String> items}) {
    return Padding(
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
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          Gaps.v20,
          SizedBox(
            height: 180,
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
    );
  }

  GestureDetector _interestsGridCard(String text) {
    final isSelected = _selectedItems.contains(text);

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          _selectedItems.remove(text);
        } else {
          _selectedItems.add(text);
        }
        setState(() {});
      },
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
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
