import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

final _textEditingController = TextEditingController();
final _searchTextController = TextEditingController();

class TipsPage extends StatefulWidget {
  TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  bool _isNewestFirst = true; // Default to sort newest first

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: ElevatedButton(
          onPressed: () => _dialogBuilder(context),
          child: Container(child: Text('+ Add Your Tip')),
        ),
      ),
      appBar: AppBar(
        title: Text('Tips'),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.go('/mytips');
            },
            child: const Text('My Tips'),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(
                  () {}); // Add the logic to navigate to the profile page or open a drawer, etc.
            },
          ),
          IconButton(
            onPressed: () {
              context.read<TipsProvider>().toggleSortingOrder();
              setState(() {
                _isNewestFirst = !_isNewestFirst;
              });
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<TipsProvider>().getTips(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<MyTips> filteredTips =
              getFilteredTips(context, _searchTextController.text);

          if (!_isNewestFirst) {
            filteredTips = filteredTips.reversed.toList();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchTextController,
                  onChanged: (value) {
                    // Filter tips live as each word is typed
                  },
                  decoration: InputDecoration(
                    hintText: 'Search by text or author...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredTips.length,
                  itemBuilder: (context, index) {
                    MyTips currentTip = filteredTips[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 15,
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(currentTip.author),
                          subtitle: Text(currentTip.text),
                          trailing: IconButton(
                            onPressed: () {
                              context
                                  .read<TipsProvider>()
                                  .deleteTip(currentTip.id);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<MyTips> getFilteredTips(BuildContext context, String searchQuery) {
    List<MyTips> allTips = context.read<TipsProvider>().tipsList;

    if (searchQuery.isEmpty) {
      return allTips;
    }

    List<String> searchWords = searchQuery.toLowerCase().split(' ');

    return allTips.where((tip) {
      for (String word in searchWords) {
        if (!(tip.text?.toLowerCase() ?? '').contains(word) &&
            !(tip.author?.toLowerCase() ?? '').contains(word)) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Tips'),
          content: TextField(
            controller: _textEditingController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: null,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Share your tips...',
              labelStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                context
                    .read<TipsProvider>()
                    .addTip(_textEditingController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
