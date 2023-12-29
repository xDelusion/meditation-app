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
              final User user = User(
                  username: usernameController.text,
                  password: passwordController.text);
              context
                  .read<AuthProvider>()
                  .registration(user: user)
                  .then((token) {
                if (token.isNotEmpty) {
                  context.push("/login");
                }
              });
            },
            child: const Text("Register"),
          )
        ],
      ),
    );
  }
}
