import 'package:flutter/material.dart';
import 'package:flutter_demo/game/tetris/shape/square.dart';

import '../config.dart';

class Shape {

  Shape(this.square) {
    leftTopOffset = Offset(3 * Config.squareWidth, 0);
    prevLeftTopOffset = Offset(3 * Config.squareWidth, 0);
  }

  Square square;
  Offset leftTopOffset = const Offset(0, 0);
  int currentIndex = 0;
  int maxIndex = 3;

  Offset prevLeftTopOffset = const Offset(0, 0);
  int prevCurrentIndex = 0;

  Offset get leftTopPoint {
    return _getLeftTopPoint(leftTopOffset);
  }
  Offset get prevLeftTopPoint {
    return _getLeftTopPoint(prevLeftTopOffset);
  }
  Offset _getLeftTopPoint(Offset offset) {
    var x = offset.dx % square.width == 0 ? offset.dx ~/ square.width : offset.dx ~/ square.width + 1;
    var y = offset.dy % square.width == 0 ? offset.dy ~/ square.width : offset.dy ~/ square.width + 1;
    return Offset(x.toDouble(), y.toDouble());
  }

  List<List<List<int>>> get matrixList => [
    [
      [],
    ],
  ];

  void render(Canvas canvas) {
    var matrix = matrixList[currentIndex];

    for (var j = 0; j < matrix.length; j++) {
      for (var i = 0; i < matrix[j].length; i++) {
        var cell = matrix[j][i];
        if (cell == 1) {
          var offsetCenter = leftTopOffset.translate(square.width / 2 + i * square.width, square.width / 2 + j * square.width);
          canvas.drawRect(Rect.fromCenter(center: offsetCenter, width: square.width, height: square.width), square.borderPaint);
          canvas.drawRect(Rect.fromCenter(center: offsetCenter, width: square.width - square.borderWidth, height: square.width - square.borderWidth), square.paint);
        }
      }
    }
  }

  void update(double dt) {
    savePrev();
    leftTopOffset = leftTopOffset.translate(0, dt * Config.speed);
  }

  void rotate() {
    savePrev();
    if (currentIndex < maxIndex) {
      currentIndex ++;
    } else {
      currentIndex = 0;
    }
  }

  void left() {
    savePrev();
    leftTopOffset = leftTopOffset.translate(-square.width, 0);
  }

  void right() {
    savePrev();
    leftTopOffset = leftTopOffset.translate(square.width, 0);
  }

  void savePrev() {
    prevLeftTopOffset = leftTopOffset;
    prevCurrentIndex = currentIndex;
  }

  void loadPrev() {
    leftTopOffset = prevLeftTopOffset;
    currentIndex = prevCurrentIndex;
  }
}