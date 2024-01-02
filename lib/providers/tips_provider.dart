import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/tips_services.dart';

class TipsProvider extends ChangeNotifier {
  List<MyTips> tipsList = [];
  final TipsService _tipsService = TipsService();
  bool _ascendingOrder = true; // Default to ascending order

  bool get ascendingOrder => _ascendingOrder;

  void toggleSortingOrder() {
    _ascendingOrder = !_ascendingOrder;
    notifyListeners();
  }

  Future<List<MyTips>> getTips() async {
    try {
      tipsList = await _tipsService.getTips();

      // Sorting is now moved outside of the getTips method
      sortTips();

      notifyListeners();
      return tipsList;
    } catch (e) {
      throw e.toString();
    }
  }

  void sortTips() {
    if (_ascendingOrder) {
      // Sort in ascending order
      tipsList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      // Sort in descending order
      tipsList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
  }

  Future<void> addTip(String text) async {
    await _tipsService.addTip(text);
    await getTips();
  }

  // Future<void> addTip(String text) async {
  //   await _tipsService.addTip(text);
  //   await getTips();
  // }

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
