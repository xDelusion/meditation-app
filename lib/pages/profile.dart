import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        User? signedInUser = authProvider.signedInUser;

        return Padding(
          padding: const EdgeInsets.all(80.0),
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://cucucovers.com/cdn/shop/products/000590a-6_8c6dc7b8-8a00-4f32-82c4-30e4cfa1800b_1500x.png?v=1581094062'),
                  ),
                  SizedBox(height: 20),
                  if (signedInUser != null)
                    Text(
                      'Username: ${signedInUser.username}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/register');
                      },
                      child: const Text('Sign Out'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
