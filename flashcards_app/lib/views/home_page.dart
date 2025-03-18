import 'dart:math';

import 'package:flashcards_app/models/card_state.dart';
import 'package:flashcards_app/view_models/home_view_model.dart';
import 'package:flashcards_app/views/widgets/fade_animation_text.dart';
import 'package:flashcards_app/views/widgets/flashcard.dart';
import 'package:flashcards_app/views/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const double backCardAnimationStart = 0.65;

  late final HomeViewModel _viewModel;
  late final AnimationController _backCardAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  late final Animation<double> _backCardAnimation = Tween<double>(
    begin: backCardAnimationStart,
    end: 0.9,
  ).animate(_backCardAnimationController);
  late final AnimationController _cardAnimationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );

  late Animation<Offset> _cardAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset.zero,
  ).animate(_cardAnimationController);

  bool _displayFront = true;
  double _dragDx = 0;
  double _rotateAngle = 0;

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;

    _viewModel.init();
  }

  @override
  void dispose() {
    _backCardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: _viewModel.getBackgroundColor(),
          child: SafeArea(
            child: SizedBox(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Center(
                      child: FadeAnimationText(text: _viewModel.getStateText()),
                    ),
                  ),
                  Stack(
                    children: [
                      if (_backCardAnimationController.isAnimating)
                        ScaleTransition(
                          scale: _backCardAnimation,
                          child: FadeTransition(
                            opacity: _backCardAnimation,
                            child: Flashcard(text: ""),
                          ),
                        ),
                      GestureDetector(
                        onTap: _flipCard,
                        onHorizontalDragUpdate:
                            (details) => _setCardState(details, size.width),
                        onHorizontalDragEnd:
                            (details) => _getNextCard(details, size.width),
                        child: SlideTransition(
                          position: _cardAnimation,
                          child: Transform.translate(
                            offset: Offset(_dragDx, 0),
                            child: Transform.rotate(
                              angle: _rotateAngle,
                              alignment: Alignment.bottomCenter,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                transitionBuilder: _transitionBuilder,
                                layoutBuilder:
                                    (currentChild, previousChildren) => Stack(
                                      children: [
                                        currentChild!,
                                        ...previousChildren,
                                      ],
                                    ),
                                child: _flashcard(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomPaint(
                        painter: ProgressBar(progress: _viewModel.progress),
                        size: Size(300, 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _flipCard() {
    _displayFront = !_displayFront;

    setState(() {});
  }

  void _setCardState(DragUpdateDetails details, double deviceWidth) {
    if (_viewModel.isComplete) return;

    final dx = details.delta.dx;
    _rotateAngle += (dx / deviceWidth / 2);
    _dragDx += dx;

    if (_dragDx < -5) {
      _viewModel.setCardState(CardState.left);
    } else if (_dragDx > 5) {
      _viewModel.setCardState(CardState.right);
    } else {
      _resetCardPosition();
      _viewModel.setCardState(CardState.center);
    }

    _backCardAnimationController.animateTo(
      backCardAnimationStart + _rotateAngle.abs(),
    );
  }

  void _getNextCard(DragEndDetails details, double deviceWidth) {
    if (_viewModel.isComplete) return;
    if (_viewModel.cardState == CardState.center) return;

    double dx = 0;

    if (_viewModel.cardState == CardState.left) {
      dx = -2;
    }
    if (_viewModel.cardState == CardState.right) {
      dx = 2;
    }

    _cardAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(dx, 0),
    ).animate(_cardAnimationController);
    _cardAnimationController.forward().then((_) {
      _viewModel.getNextCard();
      _resetCardPosition();
    });
  }

  void _resetCardPosition() {
    _backCardAnimationController.reset();
    _cardAnimationController.reset();

    _rotateAngle = 0;
    _dragDx = 0;
    _displayFront = true;
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_displayFront) != widget?.key);
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;

        return Transform(
          transform: Matrix4.rotationY(value),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _flashcard() {
    return _viewModel.isComplete
        ? Flashcard(text: "Complete!")
        : _displayFlashcard();
  }

  Widget _displayFlashcard() {
    return _displayFront
        ? Flashcard(key: ValueKey(true), text: _viewModel.currentCard.question)
        : Flashcard(key: ValueKey(false), text: _viewModel.currentCard.answer);
  }
}
