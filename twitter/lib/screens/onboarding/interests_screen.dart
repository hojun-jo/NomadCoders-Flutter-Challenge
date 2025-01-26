import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/screens/onboarding/interests_two_screen.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';
import 'package:twitter/screens/onboarding/widgets/round_button.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _interests = [
    "Fashion & beauty",
    "Outdoors",
    "Arts & culture",
    "Animation & comics",
    "Business & finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
  ];

  final Set<int> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return TwitterScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoldTitle(text: "What do you want to see on Twitter?"),
          Gaps.v16,
          const PolicyText(
              text:
                  "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile."),
          Gaps.v20,
          Transform.scale(
            scaleX: 2,
            child: const Divider(
              height: 0.5,
            ),
          ),
          Gaps.v40,
          _interestsGrid(),
          _bottomBar(),
        ],
      ),
    );
  }

  Expanded _interestsGrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: _interests.length,
        itemBuilder: (BuildContext context, int index) {
          return _interestsCard(index); // TODO - 아이템 크기 수정 필요
        },
      ),
    );
  }

  GestureDetector _interestsCard(int index) {
    final isSelected = _selectedItems.contains(index);

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          _selectedItems.remove(index);
        } else {
          _selectedItems.add(index);
        }
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : null,
          border: isSelected ? null : Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.check_circle,
                color: isSelected ? Colors.white : Colors.transparent,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                _interests[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : null,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _bottomBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _bottomText(),
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          RoundButton(
            text: "Next",
            isSmall: true,
            backgroundColor: Colors.black,
            isEnabled: _selectedItems.length >= 3,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InterestsTwoScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _bottomText() {
    final count = _selectedItems.length;
    if (count >= 3) {
      return "Great work 🎉";
    } else {
      return "$count of 3 selected";
    }
  }
}
