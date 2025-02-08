enum ActivityTab {
  all,
  replies,
  mentions,
  verified;

  @override
  String toString() {
    switch (this) {
      case ActivityTab.all:
        return "All";
      case ActivityTab.replies:
        return "Replies";
      case ActivityTab.mentions:
        return "Mentions";
      case ActivityTab.verified:
        return "Verified";
    }
  }

  int toIndex() {
    switch (this) {
      case ActivityTab.all:
        return 0;
      case ActivityTab.replies:
        return 1;
      case ActivityTab.mentions:
        return 2;
      case ActivityTab.verified:
        return 3;
    }
  }
}
