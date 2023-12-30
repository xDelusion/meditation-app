import 'package:dio/dio.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/client.dart';

class MusicService {
  Future<List<Music>> getMusic() async {
    try {
      final responseValue = await Client.get("/music");
      if (responseValue.statusCode == 200) {
        final List<Music> listOfMusic = List.from(responseValue.data)
            .map((e) => Music.fromJson(e))
            .toList();
        return listOfMusic;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}

//final List<MyTips> listoftips = List.from(response.data).map((e) => MyTips.fromJson(e)).toList();