enum ProfileTab {
  threads,
  replies;

  @override
  String toString() {
    switch (this) {
      case ProfileTab.threads:
        return "Threads";
      case ProfileTab.replies:
        return "Replies";
    }
  }
}
