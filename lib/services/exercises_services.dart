import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/services/client.dart';

class ExercisesService {
  Future<List<DataExercises>> getExercises() async {
    try {
      final responseValue = await Client.get("/exercises");
      if (responseValue.statusCode == 200) {
        final List<DataExercises> listOfExercises =
            List.from(responseValue.data)
                .map((e) => DataExercises.fromJson(e))
                .toList();
        return listOfExercises;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
