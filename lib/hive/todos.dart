import 'package:hive/hive.dart';

part 'todos.g.dart';

@HiveType(typeId: 2)
class ToDo {
  ToDo({
    required this.taskName,
    required this.taskCompleted,
  });
  @HiveField(0)
  String taskName;

  @HiveField(1)
  bool taskCompleted;
}
