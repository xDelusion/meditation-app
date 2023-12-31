import 'package:flutter/material.dart';
import 'package:meditation_app/models/meditation.dart';

import 'package:meditation_app/services/meditation_services.dart';

class MeditationProvider extends ChangeNotifier {
  List<Meditation> meditationList = [];

  final MeditationService _meditationService = MeditationService();

  Future<List<Meditation>> gettingMeditation() async {
    try {
      meditationList = await _meditationService.gettingMeditation();
      notifyListeners();
      return meditationList;
    } catch (e) {
      throw e.toString();
    }
  }
}
