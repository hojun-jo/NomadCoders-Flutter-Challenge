class DateFormatter {
  String postDifference(DateTime postedTime) {
    final difference = DateTime.now().difference(postedTime);

    if (difference.inMinutes < 1) {
      return "${difference.inSeconds}s";
    }
    if (difference.inHours < 1) {
      return "${difference.inMinutes}m";
    }
    if (difference.inDays < 1) {
      return "${difference.inHours}h";
    }
    return "${difference.inDays}d";
  }
}
