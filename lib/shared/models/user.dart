import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 2)
class User extends HiveObject {
  @HiveField(0)
  bool lightThem;

  User({
    required this.lightThem,
  });
}
