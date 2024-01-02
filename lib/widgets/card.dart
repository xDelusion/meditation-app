import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.cardName,
    required this.pathName,
    required this.color,
    required this.image,
  });

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
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 143,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cardName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
