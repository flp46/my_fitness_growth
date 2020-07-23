import 'package:flutter/material.dart';

class MuscleListHorizontal extends ChangeNotifier {
  String muscleUid;
  bool muscleFiltred = false;

  void muscleSelected() {
    muscleFiltred = true;
    notifyListeners();
  }

  void muscleWithoutFilter() {
    muscleFiltred = false;
    notifyListeners();
  }
}
