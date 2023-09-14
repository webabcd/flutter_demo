import 'package:flutter/material.dart';

import '../config.dart';

class Square {

  late Paint paint;
  late Paint borderPaint;

  double width = Config.squareWidth;
  double borderWidth = Config.squareBorderWidth;

  Square(Color color, Color borderColor) {
    paint = Paint()..color = color;
    borderPaint = Paint()..color = borderColor;
  }
}