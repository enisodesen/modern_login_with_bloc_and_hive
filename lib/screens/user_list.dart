import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive/user.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late List<User> _users;
  late Box<User> _box;

  @override
  void initState() {
    super.initState();

    _box = Hive.box<User>('userBox');
    _users = _box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Users'))),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) => Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              backgroundColor: Colors.green,
              icon: Icons.delete,
              onPressed: (context) {
                setState(() {
                  _users.removeAt(index);
                  _box.deleteAt(index);
                });
              },
            ),
          ]),
          child: ListTile(
            title: Text(
              _users[index].name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _users[index].mail,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
          ),
        ),
      ),
    );
  }
}
