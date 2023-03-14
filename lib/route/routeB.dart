import 'package:flutter/material.dart';

import '../helper.dart';

class RouteBDemo extends StatelessWidget {
  const RouteBDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('route B'),
      ),
      body: Wrap(
        spacing: 10,
        children: [
          MyButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/routeC');
            },
            child: const Text('导航到 route C'),
          ),
        ],
      ),
    );
  }
}