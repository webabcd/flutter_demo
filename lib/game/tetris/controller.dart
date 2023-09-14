import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {

  int rotateTimes = 0;
  int leftTimes = 0;
  int rightTimes = 0;

  bool downPressed = false;

  void left() {
    leftTimes++;
    notifyListeners();
  }

  void right() {
    rightTimes++;
    notifyListeners();
  }

  void rotate() {
    rotateTimes++;
    notifyListeners();
  }
}