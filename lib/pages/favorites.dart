import 'package:flutter/material.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/music_providers.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<MusicProvider>(
        builder: (context, musicProvider, child) {
          List<Music> favoritesList = musicProvider.favoritesList;

          if (favoritesList.isEmpty) {
            return Center(
              child: Text('No favorites yet.'),
            );
          }

          return ListView.builder(
            itemCount: favoritesList.length,
            itemBuilder: (context, index) {
              Music currentMusic = favoritesList[index];

              return Card(
                color: Colors.blue.shade100,
                child: ListTile(
                  title: Text(currentMusic.title),
                  subtitle: Text(currentMusic.file.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
