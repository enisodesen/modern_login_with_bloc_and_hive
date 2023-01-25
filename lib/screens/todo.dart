import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive/todo.dart';
import '../widgets/custom_button.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late List<Todo> _toDos;
  late Box<Todo> _box;

  final textController = TextEditingController();
  final urgentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _box = Hive.box<Todo>('todoBox');
    _toDos = _box.values.toList();
  }

  void saveNewTask(
      BuildContext context, String textController, String urgentController) {
    setState(() {
      _toDos.add(Todo(text: textController, isUrgent: urgentController));
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _toDos.length,
        itemBuilder: (context, index) => Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              backgroundColor: Colors.green,
              icon: Icons.delete,
              onPressed: (context) {
                setState(() {
                  _toDos.removeAt(index);
                  _box.deleteAt(index);
                });
              },
            ),
          ]),
          child: ListTile(
            title: Text(
              _toDos[index].text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _toDos[index].isUrgent,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.grey[700],
                  content: Column(
                    children: [
                      TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Add a new task'),
                      ),
                      TextField(
                        controller: urgentController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Is it urgent'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                              onTapped: () => saveNewTask(context,
                                  textController.text, urgentController.text),
                              text: 'Save'),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomButton(
                              onTapped: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Cancel'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
