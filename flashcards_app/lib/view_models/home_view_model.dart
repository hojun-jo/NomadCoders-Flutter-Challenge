import 'package:flashcards_app/constants/dummy.dart';
import 'package:flashcards_app/models/card_model.dart';
import 'package:flashcards_app/models/card_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  late List<CardModel> _cards;

  int _currentCardIndex = 0;
  CardState _cardState = CardState.center;
  bool _isComplete = false;

  int get cardCount => _cards.length;
  CardModel get currentCard => _cards[_currentCardIndex];
  double get progress => _isComplete ? 1 : _currentCardIndex / cardCount;
  CardState get cardState => _cardState;
  bool get isComplete => _isComplete;

  void init() {
    _cards = dummyCards;
  }

  void getNextCard() {
    if (_currentCardIndex + 1 >= cardCount) {
      _isComplete = true;
      setCardState(CardState.center);
      return;
    }

    _currentCardIndex += 1;

    setCardState(CardState.center);
    notifyListeners();
  }

  void setCardState(CardState state) {
    _cardState = state;

    notifyListeners();
  }

  Color getBackgroundColor() {
    switch (_cardState) {
      case CardState.left:
        return Colors.red.shade300;
      case CardState.center:
        return Colors.blue.shade300;
      case CardState.right:
        return Colors.green.shade300;
    }
  }

  String getStateText() {
    switch (_cardState) {
      case CardState.left:
        return "Need to review";
      case CardState.center:
        return "";
      case CardState.right:
        return "I got it right";
    }
  }
}
