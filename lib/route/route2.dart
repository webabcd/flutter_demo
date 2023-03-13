import 'package:flutter/material.dart';

class Route2Demo extends StatelessWidget {
  const Route2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('route 2'),
      ),
      body: const Center(
        child: Text('我是 route 2',),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 当前页面出栈
          return Navigator.of(context).pop();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}