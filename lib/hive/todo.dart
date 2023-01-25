import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 2)
class Todo {
  Todo({
    required this.text,
    required this.isUrgent,
  });
  @HiveField(0)
  String text;

  @HiveField(1)
  String isUrgent;
}
