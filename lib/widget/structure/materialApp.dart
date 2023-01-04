/*
 *
 */

import 'package:flutter/material.dart';

class MaterialAppDemo extends StatelessWidget {
  const MaterialAppDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // #docregion centered-text
        body: const Center(
          // #docregion text
          child: Text('Hello World'),
          // #enddocregion text
        ),
        // #enddocregion centered-text
      ),
    );
  }
}



// https://docs.flutter.dev/development/ui/layout#material-apps    materialapp  nonmaterialapp 他们继承的是什么  Material组件