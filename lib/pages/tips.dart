import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: FutureBuilder(
        future: context.read<TipsProvider>().gettingTips(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<TipsProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: context.watch<TipsProvider>().tipsList.length,
                itemBuilder: (context, index) {
                  MyTips currentTip =
                      context.watch<TipsProvider>().tipsList[index];

                  return Card(
                    child: ListTile(
                      title: Text(currentTip.author),
                      subtitle: Text(currentTip.text),
                      // trailing: Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     IconButton(
                      //       icon: Icon(Icons.thumb_up_sharp),
                      //       onPressed: () {
                      //         // Increment the upvote count when the button is pressed
                      //         context.read<TipsProvider>().upvotesTip(index);
                      //       },
                      //     ),
                      //     Text('$upvoteCount'), // Display the upvote count
                      //   ],
                      // ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
