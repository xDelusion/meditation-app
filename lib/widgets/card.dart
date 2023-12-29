import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.cardName, required this.pathName});

  final String cardName;
  final String pathName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(pathName);
      },
      child: Container(
        child: Text(cardName),
      ),
    );
  }
}
