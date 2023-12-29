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
            cardName: "Tips",
            pathName: '/tips',
          ),
          MyCard(
            cardName: "Meditation",
            pathName: '/meditation',
          ),
          MyCard(
            cardName: "Music",
            pathName: '/music',
          ),
          MyCard(
            cardName: "Yoga Videos",
            pathName: '/yoga_vids',
          ),
        ]));
  }
}
