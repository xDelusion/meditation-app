import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        User? signedInUser = authProvider.signedInUser;

        return Scaffold(
          appBar: AppBar(
            title: Text('Profile Page'),
          ),
          body: Column(
            children: [
              if (signedInUser != null)
                Text('Username: ${signedInUser.username}'),
              // Add other user information widgets as needed.
            ],
          ),
        );
      },
    );
  }
}
