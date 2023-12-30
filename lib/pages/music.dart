import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/exercises_providers.dart';
import 'package:meditation_app/providers/music_providers.dart';
import 'package:provider/provider.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
      ),
      body: FutureBuilder(
        future: context.read<MusicProvider>().gettingMusic(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text('Error loading exercises + $snapshot'),
            );
          }

          return Consumer<MusicProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: context.watch<MusicProvider>().musicList.length,
                itemBuilder: (context, index) {
                  Music currentMusic =
                      context.watch<MusicProvider>().musicList[index];

                  return Card(
                    child: ListTile(
                      title: Text(currentMusic.title),
                      subtitle: Text(currentMusic.file.toString()),
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
