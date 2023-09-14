import 'package:flutter/material.dart';
import 'package:flutter_demo/game/tetris/shape/square.dart';
import 'shape.dart';

class N extends Shape {
  N() : super(Square(Colors.blue[200]!, Colors.white70));

  @override
  List<List<List<int>>> get matrixList => [
    [
      [0,0,1,0],
      [0,1,1,0],
      [0,1,0,0],
      [0,0,0,0],
    ],
    [
      [0,1,1,0],
      [0,0,1,1],
      [0,0,0,0],
      [0,0,0,0],
    ],
  ];

  @override
  int get maxIndex => 1;
}