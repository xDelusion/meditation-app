import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/exercises_services.dart';
import 'package:meditation_app/services/tips_services.dart';

class ExerciseProvider extends ChangeNotifier {
  List<DataExercises> exerciseList = [];
  final ExercisesService _exerciseService = ExercisesService();

  Future<List<DataExercises>> gettingExercises() async {
    try {
      exerciseList = await _exerciseService.getExercises();
      notifyListeners();
      return exerciseList;
    } catch (e) {
      throw e.toString();
    }
  }
}
