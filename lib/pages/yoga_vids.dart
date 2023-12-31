import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/providers/exercises_providers.dart';
import 'package:provider/provider.dart';

class YogaPage extends StatelessWidget {
  YogaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Videos'),
      ),
      body: FutureBuilder(
        future: context.read<ExerciseProvider>().gettingExercises(),
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

          return Consumer<ExerciseProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount:
                    context.watch<ExerciseProvider>().exerciseList.length,
                itemBuilder: (context, index) {
                  DataExercises currentExercise =
                      context.watch<ExerciseProvider>().exerciseList[index];

                  return Card(
                    child: ListTile(
                      title: Text(currentExercise.title),
                      subtitle: Text(currentExercise.finished.toString()),
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
