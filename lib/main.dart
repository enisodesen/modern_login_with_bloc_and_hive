// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:modern_login_page/screens/grideview_page.dart';
import 'package:modern_login_page/screens/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modern_login_page/screens/todo.dart';

import 'hive/todo.dart';
import 'hive/user.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TodoAdapter());

  await Hive.openBox<User>('userBox');
  await Hive.openBox<Todo>('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoPage(),
    );
  }
}
