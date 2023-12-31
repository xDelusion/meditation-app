import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/tips_services.dart';

class TipsProvider extends ChangeNotifier {
  List<MyTips> tipsList = [];
  final TipsService _tipsService = TipsService();

  Future<List<MyTips>> getTips() async {
    try {
      tipsList = await _tipsService.getTips();
      notifyListeners();
      return tipsList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> addTip(String text) async {
    await _tipsService.addTip(text);
    await getTips();
  }

  Future<void> deleteTip(int id) async {
    print("Deleting tip with ID: $id");

    try {
      await _tipsService.deleteTip(id);
      tipsList.removeWhere((tip) => tip.id == id);

      print("Tip deleted successfully");
      notifyListeners();
    } catch (e) {
      print("Error deleting tip: $e");
    }
  }
}
