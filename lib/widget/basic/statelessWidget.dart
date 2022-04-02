/*
 * StatelessWidget 无状态 widget
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class StatelessWidgetDemo extends StatelessWidget {
  const StatelessWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyText(text: "StatelessWidgetDemo");
  }
}
