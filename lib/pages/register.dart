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
        title: Text(
          'Meditation App',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/5266/5266956.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
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
          SizedBox(height: 2),
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
                    context.push("/login");
                  }
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please fill in both username and password.'),
                  ),
                );
              }
            },
            child: const Text("Register"),
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Sign In'))
        ],
      ),
    );
  }
}
