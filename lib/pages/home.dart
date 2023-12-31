import 'package:flutter/material.dart';
import 'package:meditation_app/widgets/card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meditation Home'),
        ),
        body: Column(children: [
          MyCard(
            color: Colors.amber.shade300,
            cardName: "Tips",
            pathName: '/tips',
          ),
          MyCard(
            color: Colors.amber.shade300,
            cardName: "Meditation",
            pathName: '/meditation',
          ),
          MyCard(
            color: Colors.amber.shade300,
            cardName: "Music",
            pathName: '/music',
          ),
          MyCard(
            color: Colors.amber.shade300,
            cardName: "Yoga Videos",
            pathName: '/yoga_vids',
          ),
          MyCard(
            color: Colors.cyan.shade300,
            cardName: "FAVORITES",
            pathName: '/favorites',
          ),
        ]));
  }
}
