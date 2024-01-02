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

  addTip(String text) async {
    try {
      final Response response = await Client.post(
        "/tips",
        data: {"text": text},
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  deleteTip(int id) async {
    try {
      final Response response = await Client.delete(
        "/tips/$id",
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
