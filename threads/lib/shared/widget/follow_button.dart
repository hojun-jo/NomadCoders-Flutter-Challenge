import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({
    super.key,
  });

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onFollowTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _isFollowing ? "Following" : "Follow",
          style: TextStyle(
            color: _isFollowing ? Colors.grey : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  void _onFollowTap() {
    _isFollowing = !_isFollowing;
    setState(() {});
  }
}
