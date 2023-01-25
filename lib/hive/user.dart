import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  User({
    required this.name,
    required this.username,
    required this.age,
    required this.mail,
    required this.password,
  });
  @HiveField(0)
  String name;

  @HiveField(1)
  String username;

  @HiveField(2)
  int age;

  @HiveField(3)
  String mail;

  @HiveField(4)
  String password;
}
