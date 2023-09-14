import 'package:flutter/material.dart';
import 'package:flutter_demo/game/tetris/shape/square.dart';
import 'shape.dart';

class L2 extends Shape {
  L2() : super(Square(Colors.green[800]!, Colors.white70));

  @override
  List<List<List<int>>> get matrixList => [
    [
      [0,0,1,0],
      [0,0,1,0],
      [0,1,1,0],
      [0,0,0,0],
    ],
    [
      [0,1,0,0],
      [0,1,1,1],
      [0,0,0,0],
      [0,0,0,0],
    ],
    [
      [0,0,1,1],
      [0,0,1,0],
      [0,0,1,0],
      [0,0,0,0],
    ],
    [
      [0,0,0,0],
      [0,1,1,1],
      [0,0,0,1],
      [0,0,0,0],
    ],
  ];

  @override
  int get maxIndex => 3;
}