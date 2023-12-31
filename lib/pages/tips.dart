import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

final _textEditingController = TextEditingController();

class TipsPage extends StatefulWidget {
  TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: ElevatedButton(
              onPressed: () => _dialogBuilder(context),
              child: Container(child: Text('+ Add Review')))),
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: FutureBuilder(
        future: context.read<TipsProvider>().getTips(),
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

                  return Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, right: 115, left: 15),
                    child: Card(
                      child: ListTile(
                        title: Text(currentTip.author),
                        subtitle: Text(currentTip.text),
                      ),
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

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Tips'),
        actions: <Widget>[
          TextField(
            controller: _textEditingController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: null,
            maxLines: null,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Share your tips...',
                labelStyle: TextStyle(color: Colors.grey)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('Add'),
              onPressed: () {
                context
                    .read<TipsProvider>()
                    .addTip(_textEditingController.text);
                context.pop();
              },
            ),
          ]),
        ],
      );
    },
  );
}
