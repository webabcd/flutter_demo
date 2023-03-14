import 'package:flutter/material.dart';

import '../helper.dart';

class RouteADemo extends StatelessWidget {
  const RouteADemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('route A'),
      ),
      body: Wrap(
        spacing: 10,
        children: [
          MyButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/routeB');
            },
            child: const Text('导航到 route B'),
          ),
        ],
      ),
    );
  }
}