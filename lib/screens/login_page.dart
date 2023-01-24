import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),

              //Logo

              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),

              //Welcome back, you've been missed!

              const Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(
                height: 25,
              ),

              //username textfield

              CustomTextField(
                labelText: 'Username',
                controller: _usernameController,
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password textfield

              CustomTextField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: true),

              const SizedBox(
                height: 10,
              ),

              //forgot password

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Forgot Password?'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //sign in

              CustomButton(onTapped: signUserIn),
              const SizedBox(
                height: 15,
              ),
              //or Continue
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.7,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' Or countiue with ',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 0.7,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              //google + apple signin buttons

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SquareTile(imagePath: 'lib/images/apple.png'),
                  SizedBox(
                    width: 10,
                  ),
                  SquareTile(imagePath: 'lib/images/google.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //Not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'Register now!',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
