import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modern_login_page/widgets/custom_button.dart';
import 'package:modern_login_page/widgets/custom_snackbar.dart';
import 'package:modern_login_page/widgets/custom_text_field.dart';

import '../hive/user.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUserUp(BuildContext context, String name, String username,
      String age, String mail, String password) {
    final myBox = Hive.box<User>('userBox');
    myBox.add(User(
        name: name,
        username: username,
        age: int.parse(age),
        mail: mail,
        password: password));

    ScaffoldMessenger.of(context).showSnackBar(
      const CustomSnackBar(
          content: Text(
        'You\'ve been created account',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up Page')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                labelText: 'Name',
                obscureText: false,
                controller: _nameController),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                labelText: 'Username',
                obscureText: false,
                controller: _usernameController),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                labelText: 'Age',
                obscureText: false,
                controller: _ageController),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                labelText: 'Mail',
                obscureText: false,
                controller: _mailController),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                labelText: 'Password',
                obscureText: true,
                controller: _passwordController),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: 'Sign Up',
              onTapped: () => signUserUp(
                  context,
                  _nameController.text,
                  _usernameController.text,
                  _ageController.text,
                  _mailController.text,
                  _passwordController.text),
            )
          ],
        ),
      ),
    );
  }
}
