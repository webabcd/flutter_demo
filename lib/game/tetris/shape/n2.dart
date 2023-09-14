import 'package:flutter/material.dart';
import 'package:flutter_demo/game/tetris/shape/square.dart';
import 'shape.dart';

class N2 extends Shape {
  N2() : super(Square(Colors.blue[800]!, Colors.white70));

  @override
  List<List<List<int>>> get matrixList => [
    [
      [0,1,0,0],
      [0,1,1,0],
      [0,0,1,0],
      [0,0,0,0],
    ],
    [
      [0,0,1,1],
      [0,1,1,0],
      [0,0,0,0],
      [0,0,0,0],
    ],
  ];

  @override
  int get maxIndex => 1;
}