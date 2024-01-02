import 'package:flutter/material.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/music_providers.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: (Text(
                  "Favorites:",
                  style: TextStyle(fontSize: 25),
                )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<MusicProvider>(
              builder: (context, musicProvider, child) {
                List<Music> favoritesList = musicProvider.favoritesList;

                if (favoritesList.isEmpty) {
                  return Center(
                    child: Text('No favorites yet.'),
                  );
                }

                return Container(
                  width: 500,
                  height: 150,
                  child: ListView.builder(
                    itemCount: favoritesList.length,
                    itemBuilder: (context, index) {
                      Music currentMusic = favoritesList[index];

                      return Card(
                        color: Colors.blue.shade100,
                        child: ListTile(
                          title: Text(currentMusic.title),
                          subtitle: Text(
                            currentMusic.file.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
