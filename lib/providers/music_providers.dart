import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/exercises_services.dart';
import 'package:meditation_app/services/music_services.dart';
import 'package:meditation_app/services/tips_services.dart';

class MusicProvider extends ChangeNotifier {
  List<Music> musicList = [];
  final MusicService _musicService = MusicService();

  Future<List<Music>> gettingMusic() async {
    try {
      musicList = await _musicService.getMusic();
      notifyListeners();
      return musicList;
    } catch (e) {
      throw e.toString();
    }
  }
}
