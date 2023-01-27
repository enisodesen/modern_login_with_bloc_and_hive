import 'package:flutter/material.dart';

import 'package:modern_login_page/screens/todo_list.dart';
import 'package:modern_login_page/screens/user_list.dart';

import '../widgets/custom_container.dart';

class GrideViewPage extends StatefulWidget {
  const GrideViewPage({super.key});

  @override
  State<GrideViewPage> createState() => _GrideViewPageState();
}

class _GrideViewPageState extends State<GrideViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const NetworkImage('https://picsum.photos/200'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.5), BlendMode.darken)),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            CustomContainer(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserList(),
                      ));
                },
                color: Colors.red,
                icon: Icons.home,
                text: 'Home'),
            CustomContainer(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ToDoList(),
                      ));
                },
                color: Colors.yellow.shade700,
                icon: Icons.search,
                text: 'Todo Page'),
            CustomContainer(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ToDoList(),
                      ));
                },
                color: Colors.green,
                icon: Icons.settings,
                text: 'Settings'),
            CustomContainer(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserList(),
                      ));
                },
                color: Colors.blue,
                icon: Icons.book,
                text: 'Books'),
          ],
        ),
      ),
    );
  }
}
