import 'dart:math';

import 'package:flutter_demo/game/tetris/shape/i.dart';
import 'package:flutter_demo/game/tetris/shape/l.dart';
import 'package:flutter_demo/game/tetris/shape/l2.dart';
import 'package:flutter_demo/game/tetris/shape/n.dart';
import 'package:flutter_demo/game/tetris/shape/n2.dart';
import 'package:flutter_demo/game/tetris/shape/o.dart';
import 'package:flutter_demo/game/tetris/shape/shape.dart';
import 'package:flutter_demo/game/tetris/shape/square.dart';
import 'package:flutter_demo/game/tetris/shape/t.dart';

import 'config.dart';

enum CollisionType { none, edge, bottom }

class Core {

  static var random = Random();

  static CollisionType checkCollision(Shape shape, List<List<Square?>> mainMatrix) {
    var shapeMatrix = shape.matrixList[shape.currentIndex];
    for (var j = 0; j < shapeMatrix.length; j++) { // 纵轴是 j 横轴是 i
      for (var i = 0; i < shapeMatrix[j].length; i++) {
        var cell = shapeMatrix[j][i];
        if (cell == 1) {
          var leftTopPoint = shape.leftTopPoint;
          var prevLeftTopPoint = shape.prevLeftTopPoint;
          var mi = i + leftTopPoint.dx.toInt();
          var mj = j + leftTopPoint.dy.toInt();
          if (mi < 0 || mi >= mainMatrix[0].length) {
            return CollisionType.edge;
          }
          if (mj >= mainMatrix.length) {
            return CollisionType.bottom;
          }
          var square = mainMatrix[mj][mi];
          if (square != null) {
            if (leftTopPoint.dx == prevLeftTopPoint.dx) {
              return CollisionType.bottom;
            } else {
              return CollisionType.edge;
            }
          }
        }
      }
    }
    return CollisionType.none;
  }

  static void pinShape(Shape shape, List<List<Square?>> mainMatrix) {
    var shapeMatrix = shape.matrixList[shape.currentIndex];
    for (var j = 0; j < shapeMatrix.length; j++) { // 纵轴是 j 横轴是 i
      for (var i = 0; i < shapeMatrix[j].length; i++) {
        var cell = shapeMatrix[j][i];
        if (cell == 1) {
          var mi = i + shape.leftTopPoint.dx.toInt();
          var mj = j + shape.leftTopPoint.dy.toInt();
          if (mi < 0 || mi >= mainMatrix[0].length) {
            return;
          }
          if (mj < 0 || mj >= mainMatrix.length) {
            return;
          }

          mainMatrix[mj][mi] = Square(shape.square.paint.color, shape.square.borderPaint.color);
        }
      }
    }
  }

  static void removeLineShape(List<List<Square?>> mainMatrix) {
    for (var j = 0; j < mainMatrix.length; j++) { // 纵轴是 j 横轴是 i
      var line = true;
      for (var i = 0; i < mainMatrix[j].length; i++) {
        var square = mainMatrix[j][i];
        if (square == null) {
          line = false;
          continue;
        }
      }

      if (line) {
        mainMatrix.removeAt(j);

        var row = <Square?>[];
        mainMatrix.insert(0, row);
        for (var i = 0; i < 10; i++) {
          row.add(null);
        }
      }
    }
  }

  static void initMainMatrix(List<List<Square?>> mainMatrix) {
    mainMatrix.clear();
    for (var i = 0; i < Config.mainMatrixHeight; i++) {
      var row = <Square?>[];
      mainMatrix.add(row);
      for (var j = 0; j < Config.mainMatrixWidth; j++) {
        row.add(null);
      }
    }
  }

  static Shape createShape() {
    var shapeList = <Shape>[I(), L(), L2(), N(), N2(), O(), T()];
    var shape = shapeList[random.nextInt(shapeList.length)];
    return shape;
  }
}