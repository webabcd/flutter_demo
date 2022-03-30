import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void log(String message) {
  debugPrint(message);
}

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.text,
    this.color = Colors.white,
  }):super(key:key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: color,
        child: Text(text),
      ),
    );
  }
}