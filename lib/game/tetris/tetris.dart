/*
 * 俄罗斯方块
 *
 * 使用了 flame 库，在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dependencies:
 *   flame: ^1.7.3
 */


import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/game/tetris/shape/shape.dart';
import 'package:flutter_demo/game/tetris/shape/square.dart';
import 'package:flutter_demo/game/tetris/shape/t.dart';

import 'config.dart';
import 'controller.dart';
import 'core.dart';

class Tetris extends StatefulWidget {
  const Tetris({Key? key}) : super(key: key);

  @override
  TetrisState createState() => TetrisState();
}

class TetrisState extends State<Tetris> {

  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: Config.mainMatrixWidth * Config.squareWidth,
            height: Config.mainMatrixHeight * Config.squareWidth,
            child: GameWidget(
              game: MyGame(controller: controller),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button1(
                Icons.arrow_back, () { controller.left(); }, () { },
              ),
              _button1(
                Icons.arrow_forward, () { controller.right(); }, () { },
              ),
              _button1(
                Icons.rotate_right_rounded, () { controller.rotate(); }, () { },
              ),
              _button1(
                Icons.arrow_downward, () { controller.downPressed = true; }, () { controller.downPressed = false; },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Ink _button1(IconData iconData, VoidCallback onDown, VoidCallback onUp) {
    return Ink(
      padding: EdgeInsets.zero,
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        child: Icon(iconData, color: Colors.white,),
        onTapDown: (details) { onDown(); },
        onTapUp: (details) { onUp(); },
      ),
    );
  }
}

class MyGame extends FlameGame {
  MyGame({required this.controller});
  final Controller controller;
  bool shapeUpdated = false;

  List<Shape> shapeList = <Shape>[];
  List<List<Square?>> mainMatrix = <List<Square?>>[];

  @override
  Future<void>? onLoad() async {

    shapeList.add(Core.createShape());
    Core.initMainMatrix(mainMatrix);

    controller.addListener(() {
      if (controller.rotateTimes > 0) {
        shapeList[0].rotate();
        controller.rotateTimes--;
      } else if (controller.leftTimes > 0) {
        shapeList[0].left();
        controller.leftTimes--;
      } else if (controller.rightTimes > 0) {
        shapeList[0].right();
        controller.rightTimes--;
      }
      shapeUpdated = true;
    });

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    shapeList[0].render(canvas);

    for (var j = 0; j < mainMatrix.length; j++) {
      for (var i = 0; i < mainMatrix[j].length; i++) {
        var square = mainMatrix[j][i];
        if (square != null) {
          var offsetCenter = Offset(square.width / 2 + i * square.width, square.width / 2 + j * square.width);
          canvas.drawRect(Rect.fromCenter(center: offsetCenter, width: square.width, height: square.width), square.borderPaint);
          canvas.drawRect(Rect.fromCenter(center: offsetCenter, width: square.width - square.borderWidth, height: square.width - square.borderWidth), square.paint);
        }
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (controller.downPressed) {
      Config.speed = 500;
    } else {
      Config.speed = 20;
    }

    var shape = shapeList[0];
    if (shapeUpdated) {
      shapeUpdated = false;
    } else {
      shape.update(dt);
    }

    var collisionType = Core.checkCollision(shape, mainMatrix);
    if (collisionType == CollisionType.bottom) {
      shape.loadPrev();
      Core.pinShape(shape, mainMatrix);
      controller.downPressed = false;
      Core.removeLineShape(mainMatrix);

      shapeList.removeAt(0);
      var newShape = Core.createShape();
      shapeList.add(newShape);
      if (Core.checkCollision(newShape, mainMatrix) == CollisionType.bottom) {
        Core.initMainMatrix(mainMatrix); // 死了重来
      }
    } else if (collisionType == CollisionType.edge) {
      shape.loadPrev();
    }
  }
}