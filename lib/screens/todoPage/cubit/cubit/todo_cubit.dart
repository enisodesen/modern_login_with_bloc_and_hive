import '../../../../hive/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  late Box<Todo> _box;
  TodoCubit() : super(TodoInitial()) {
    _box = Hive.box('todoBox');
  }

  void addTask(String taskname, String urgent) async {
    emit(TodoLoading());
    await _box.add(Todo(text: taskname, isUrgent: urgent));
    final todos = _box.values.toList();
    emit(TodoSuccess(todos));
  }

  void deleteTask(int index) async {
    emit(TodoLoading());
    await _box.deleteAt(index);
    final todos = _box.values.toList();
    emit(TodoSuccess(todos));
  }

  void getTodos() {
    emit(TodoLoading());
    final todos = _box.values.toList();
    emit(TodoSuccess(todos));
  }
}
