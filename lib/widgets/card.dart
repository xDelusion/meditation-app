import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.cardName,
      required this.pathName,
      required this.color});

  final String cardName;
  final String pathName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(pathName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              cardName,
            ),
          ),
        ),
      ),
    );
  }
}
