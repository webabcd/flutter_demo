/*
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class RowDemo extends StatefulWidget {
  const RowDemo({Key? key}) : super(key: key);

  @override
  _RowDemoState createState() => _RowDemoState();
}

class _RowDemoState extends State<RowDemo> {

  var _mainAxisAlignment = MainAxisAlignment.start;

  void _changeMainAxisAlignment() {
    setState(() {
      var index = _mainAxisAlignment.index + 1;
      if (index >= MainAxisAlignment.values.length) {
        index = 0;
      }
      _mainAxisAlignment = MainAxisAlignment.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: _mainAxisAlignment,
          children: const [
            MyText("aa"),
            MyText("bb"),
            MyText("cc"),
            MyText("dd"),
          ],
        ),
        MyButton(
          onPressed: _changeMainAxisAlignment,
          child: Text(_mainAxisAlignment.name),
        ),
      ],
    );
  }
}