import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation App'),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _usernameController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final User user = User(
                  username: _usernameController.text,
                  password: _passwordController.text);
              context.read<AuthProvider>().loggingIn(user: user).then((token) {
                if (token.isNotEmpty) {
                  context.push("/navbar");
                }
              });
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
