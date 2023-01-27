import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../hive/todo.dart';
import '../../../widgets/custom_button.dart';
import '../cubit/cubit/todo_cubit.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final textController = TextEditingController();
  final urgentController = TextEditingController();
  late Function(String x, String y) onCreate;
  bool taskCompleted = false;

  late TextDecoration line = TextDecoration.none;

  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().getTodos();
    onCreate = (x, y) => context.read<TodoCubit>().addTask(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoSuccess) {
            return _buildTodoList(state.todos);
          } else if (state is TodoError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.red),
              ),
            );
          } else {
            return Center(
              child: Text(
                'You have no tasks!!!!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.grey[100],
                  content: SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        TextField(
                          controller: textController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Add a new task'),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: urgentController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Is it urgent'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                                onTapped: () {
                                  onCreate(textController.text,
                                      urgentController.text);
                                  textController.clear();
                                  urgentController.clear();
                                  Navigator.of(context).pop();
                                },
                                text: ' Save '),
                            CustomButton(
                                onTapped: () {
                                  Navigator.of(context).pop();
                                },
                                text: 'Cancel'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }

  ListView _buildTodoList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.black,
              icon: Icons.delete,
              onPressed: (context) {
                context.read<TodoCubit>().deleteTask(index);
              },
            ),
          ]),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[700],
            ),
            child: ListTile(
              title: Text(
                todos[index].text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              subtitle: Text(
                todos[index].isUrgent,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              leading: Checkbox(
                activeColor: Colors.black,
                value: taskCompleted,
                onChanged: (value) {
                  setState(() {
                    taskCompleted = value!;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
