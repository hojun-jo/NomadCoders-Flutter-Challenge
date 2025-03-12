import 'package:explicit_animations/constant/animation_duration.dart';
import 'package:explicit_animations/constant/tweens.dart';
import 'package:flutter/material.dart';

class RedDotRow extends StatefulWidget {
  final Duration animationDuration;
  final Duration reverseDuration;
  final Duration startDelay;
  final bool isLeftToRight;
  final void Function(VoidCallback) startAnimationWith;

  const RedDotRow({
    super.key,
    required this.animationDuration,
    required this.reverseDuration,
    required this.startDelay,
    required this.isLeftToRight,
    required this.startAnimationWith,
  });

  @override
  State<RedDotRow> createState() => _RedDotRowState();
}

class _RedDotRowState extends State<RedDotRow> with TickerProviderStateMixin {
  late final AnimationController _animationController1 = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.reverseDuration,
  );
  late final AnimationController _animationController2 = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.reverseDuration,
  );
  late final AnimationController _animationController3 = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.reverseDuration,
  );
  late final AnimationController _animationController4 = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.reverseDuration,
  );
  late final AnimationController _animationController5 = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.reverseDuration,
  );

  @override
  void initState() {
    super.initState();
    widget.startAnimationWith(_startAnimation);
  }

  void _startAnimation() {
    Future.delayed(widget.startDelay, () {
      if (widget.isLeftToRight) {
        _startLeftToRightAnimation();
      } else {
        _startRightToLeftAnimation();
      }
    });
  }

  void _startLeftToRightAnimation() {
    _animationController1.forward();

    Future.delayed(animationDuration, () {
      _animationController2.forward();
    });
    Future.delayed(animationDuration * 2, () {
      _animationController3.forward();
    });
    Future.delayed(animationDuration * 3, () {
      _animationController4.forward();
      _animationController1.reverse();
    });
    Future.delayed(animationDuration * 4, () {
      _animationController5.forward();
      _animationController2.reverse();
    });
    Future.delayed(animationDuration * 5, () {
      _animationController3.reverse();
    });
    Future.delayed(animationDuration * 6, () {
      _animationController4.reverse();
    });
    Future.delayed(animationDuration * 7, () {
      _animationController5.reverse();
    });
  }

  void _startRightToLeftAnimation() {
    _animationController5.forward();

    Future.delayed(animationDuration, () {
      _animationController4.forward();
    });
    Future.delayed(animationDuration * 2, () {
      _animationController3.forward();
    });
    Future.delayed(animationDuration * 3, () {
      _animationController2.forward();
      _animationController5.reverse();
    });
    Future.delayed(animationDuration * 4, () {
      _animationController1.forward();
      _animationController4.reverse();
    });
    Future.delayed(animationDuration * 5, () {
      _animationController3.reverse();
    });
    Future.delayed(animationDuration * 6, () {
      _animationController2.reverse();
    });
    Future.delayed(animationDuration * 7, () {
      _animationController1.reverse();
    });
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationController4.dispose();
    _animationController5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...[
          _animationController1,
          _animationController2,
          _animationController3,
          _animationController4,
          _animationController5,
        ].map((controller) {
          return ScaleTransition(
            scale: Tweens.scale.animate(controller),
            child: DecoratedBoxTransition(
              decoration: Tweens.decoration.animate(controller),
              child: Container(
                color: Colors.red.withAlpha(20),
                width: 40,
                height: 40,
              ),
            ),
          );
        }),
      ],
    );
  }
}
