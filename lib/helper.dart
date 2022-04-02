import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void log(String message) {
  debugPrint(message);
}

int currentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.text,
  }):super(key:key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            decoration: TextDecoration.none
        ),
      ),
    );
  }
}