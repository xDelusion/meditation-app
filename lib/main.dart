import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/register.dart';
import 'package:meditation_app/pages/home.dart';
import 'package:meditation_app/pages/login.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(initialLocation: '/register', routes: [
  GoRoute(
    path: '/register',
    builder: (context, state) {
      return Register();
    },
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return Login();
    },
  ),
  GoRoute(
    path: '/',
    builder: (context, state) {
      return Home();
    },
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
