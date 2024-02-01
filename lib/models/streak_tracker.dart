import 'package:flutter/cupertino.dart';

class StreakTracker with ChangeNotifier {
  int _streak = 0;

  void increment(){
    _streak++;
    notifyListeners();
  }

  void reset(){
    _streak = 0;
    notifyListeners();
  }

  int get streak => _streak;
}