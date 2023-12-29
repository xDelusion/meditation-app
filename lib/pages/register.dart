import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              controller: usernameController,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: passwordController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Check if both username and password are not empty
              if (usernameController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                final User user = User(
                  username: usernameController.text,
                  password: passwordController.text,
                );
                context
                    .read<AuthProvider>()
                    .registration(user: user)
                    .then((token) {
                  if (token.isNotEmpty) {
                    // Registration successful, navigate to login screen
                    context.push("/login");
                  }
                });
              } else {
                // Show an error message or handle the case where fields are empty
                // For example, you can show a snackbar:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please fill in both username and password.'),
                  ),
                );
              }
            },
            child: const Text("Register"),
          )
        ],
      ),
    );
  }
}
