import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                labelText: 'Email',
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
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
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/register');
            },
            child: Text('Register'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: Text('Home'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/profile');
            },
            child: Text('profile'),
          )
        ],
      ),
    );
  }
}
