/*
 * StatefulWidget 有状态 widget
 */

import 'package:flutter/material.dart';

class StatefulWidgetDemo extends StatefulWidget {
  const StatefulWidgetDemo({Key? key}) : super(key: key);

  @override
  _StatefulWidgetDemoState createState() => _StatefulWidgetDemoState();

}

class _StatefulWidgetDemoState extends State<StatefulWidgetDemo> {
  int _counter1 = 0;
  int _counter2 = 0;

  void _handleTap() {
    setState(() {
      _counter1++;
    });
  }

  void _handleMyWidgetChanged(int newValue) {
    setState(() {
      _counter2 = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _handleTap,
            child: Container(
              width: 200,
              margin: const EdgeInsets.all(5),
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "$_counter1",
                style: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          _MyWidget(
            counter: _counter2,
            onChanged: _handleMyWidgetChanged
          ),
        ],
      ),
    );
  }
}

class _MyWidget extends StatelessWidget {
  const _MyWidget({
    Key? key,
    this.counter = 0,
    required this.onChanged,
  }) : super(key: key);

  final int counter;
  final ValueChanged<int> onChanged;

  void _handleTap() {
    onChanged(counter + 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "$counter",
          style: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}