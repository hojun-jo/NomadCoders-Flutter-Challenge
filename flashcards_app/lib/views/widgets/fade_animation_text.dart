import 'package:flutter/material.dart';

class FadeAnimationText extends StatefulWidget {
  final String text;

  const FadeAnimationText({super.key, required this.text});

  @override
  State<FadeAnimationText> createState() => _FadeAnimationTextState();
}

class _FadeAnimationTextState extends State<FadeAnimationText>
    with SingleTickerProviderStateMixin, ChangeNotifier {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );
  late final Animation<double> _fade = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
