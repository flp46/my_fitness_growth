import 'package:flutter/material.dart';


class MuscleListHorizontalNotifier extends ChangeNotifier {
  String muscleUid;
  bool muscleFiltred = false;
  String muscleSelected;

  void muscleWithFilter(String uidMuscle) {
    muscleSelected = uidMuscle;
    muscleFiltred = true;
    notifyListeners();
  }

  void muscleWithoutFilter() {
    muscleFiltred = false;
    notifyListeners();
  }
}


