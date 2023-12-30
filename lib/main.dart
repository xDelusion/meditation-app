import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/meditation.dart';
import 'package:meditation_app/pages/music.dart';
import 'package:meditation_app/pages/profile.dart';
import 'package:meditation_app/pages/register.dart';
import 'package:meditation_app/pages/home.dart';
import 'package:meditation_app/pages/login.dart';
import 'package:meditation_app/pages/tips.dart';
import 'package:meditation_app/pages/yoga_vids.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:meditation_app/providers/exercises_providers.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TipsProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
      ],
      child: MyApp(),
    ),
  );
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
  GoRoute(
    path: '/profile',
    builder: (context, state) {
      return Profile();
    },
  ),
  GoRoute(
    path: '/tips',
    builder: (context, state) {
      return TipsPage();
    },
  ),
  GoRoute(
    path: '/meditation',
    builder: (context, state) {
      return MeditationPage();
    },
  ),
  GoRoute(
    path: '/music',
    builder: (context, state) {
      return MusicPage();
    },
  ),
  GoRoute(
    path: '/yoga_vids',
    builder: (context, state) {
      return YogaVideos();
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
