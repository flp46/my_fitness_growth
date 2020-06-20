import 'package:flutter/material.dart';

class ControlIconFAB extends ChangeNotifier{

  bool isFaved = false;

  void clickedButton(){
    isFaved = !isFaved;
    notifyListeners();
  }

}

