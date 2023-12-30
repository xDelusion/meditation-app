import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/tips_services.dart';

class TipsProvider extends ChangeNotifier {
  List<MyTips> tipsList = [];
  final TipsService _tipsService = TipsService();

  Future<List<MyTips>> gettingTips() async {
    try {
      tipsList = await _tipsService.getTips();
      notifyListeners();
      return tipsList;
    } catch (e) {
      throw e.toString();
    }
  }

  void upvotesTip(int index) {
    // Increment the upvote count for the specified tip index
    //upvoteCounts[index] = (upvoteCounts[index] ?? 0) + 1;
    notifyListeners();
  }
  // Map<int, int> upvoteCounts = {}; // Map to store upvote counts for each tip

  //int getUpvoteCount(int index) {
  // Get the upvote count for the specified tip index
  // return upvoteCounts[index] ?? 0;
  // }
}
