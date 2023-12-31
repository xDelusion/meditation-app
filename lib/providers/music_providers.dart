import 'package:flutter/material.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/services/music_services.dart';

class MusicProvider extends ChangeNotifier {
  List<Music> musicList = [];
  List<Music> favoritesList = [];

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

  bool addToFavorites(int musicId) {
    Music music = getMusicById(musicId);

    if (music != null) {
      favoritesList.add(music); // Add the Music object to favorites list
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Music getMusicById(int musicId) {
    return musicList.firstWhere((music) => music.id == musicId);
  }
}
