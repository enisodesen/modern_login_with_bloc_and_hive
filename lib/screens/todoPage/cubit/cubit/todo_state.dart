part of 'todo_cubit.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}

class TodoSuccess extends TodoState {
  final List<Todo> todos;
  TodoSuccess(this.todos);
}
