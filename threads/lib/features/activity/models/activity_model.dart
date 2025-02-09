import 'package:threads/core/models/profile/avatar_decoration.dart';
import 'package:threads/core/models/profile/user.dart';

class ActivityModel {
  final User user;
  final AvatarDecoration avatarDecoration;
  final DateTime notifiedTime;
  final String? description;

  ActivityModel({
    required this.user,
    required this.avatarDecoration,
    required this.notifiedTime,
    this.description,
  });
}
