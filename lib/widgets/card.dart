import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.cardName,
      required this.pathName,
      required this.color,
      required this.image});

  final String cardName;
  final String pathName;
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(pathName);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
                color: color,
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                cardName,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
