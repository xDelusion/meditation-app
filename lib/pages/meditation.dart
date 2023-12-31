import 'package:flutter/material.dart';
import 'package:meditation_app/models/meditation.dart';

import 'package:meditation_app/providers/meditation_providers.dart';

import 'package:provider/provider.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation'),
      ),
      body: FutureBuilder(
        future: context.read<MeditationProvider>().gettingMeditation(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<MeditationProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount:
                    context.watch<MeditationProvider>().meditationList.length,
                itemBuilder: (context, index) {
                  Meditation currentMeditation =
                      context.watch<MeditationProvider>().meditationList[index];

                  return Card(
                    child: ListTile(
                      title: Text(currentMeditation.title),
                      subtitle: Text(currentMeditation.file.toString()),
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
