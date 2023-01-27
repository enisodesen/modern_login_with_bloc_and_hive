import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modern_login_page/hive/todos.dart';
import 'package:modern_login_page/utils/todo_tile.dart';

import '../utils/dialog_box.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final _controller = TextEditingController();

  late List<ToDo> _todos;
  late Box<ToDo> _box;

  @override
  void initState() {
    super.initState();
  }

  //checkbox was tapped

  void checkBoxChanged(int index) {
    setState(() {
      _todos[index].taskCompleted = !_todos[index].taskCompleted;
    });
  }

  //Save new task

  void saveNewTask() {
    setState(() {
      _box = Hive.box<ToDo>('todoBox');
      _box.add(ToDo(taskName: _controller.text, taskCompleted: false));
      _todos = _box.values.toList();
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a new task

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) async {
    await _box.deleteAt(index);
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: _todos[index].taskName,
            taskCompleted: _todos[index].taskCompleted,
            onCahnged: (value) => checkBoxChanged(index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
