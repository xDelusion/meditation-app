import 'package:dio/dio.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/client.dart';

class TipsService {
  Future<List<MyTips>> getTips() async {
    try {
      final responseValue = await Client.get("/tips");
      if (responseValue.statusCode == 200) {
        final List<MyTips> listoftips = List.from(responseValue.data)
            .map((e) => MyTips.fromJson(e))
            .toList();
        return listoftips;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}

//final List<MyTips> listoftips = List.from(response.data).map((e) => MyTips.fromJson(e)).toList();