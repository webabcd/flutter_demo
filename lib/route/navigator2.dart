/*
 * 路由和导航的进阶
 *
 * 主要请看 routeC.dart 中的说明
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'package:flutter_demo/route/routeA.dart';
import 'package:flutter_demo/route/routeB.dart';
import 'package:flutter_demo/route/routeC.dart';
import 'package:flutter_demo/route/routeD.dart';

class Navigator2Demo extends StatelessWidget {
  const Navigator2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    /// 这里的 MaterialApp 是 main.dart 中的 MaterialApp 的子
    return MaterialApp(
      home: null,
      /// 当 home 设置为 null 时，首次加载会自动导航至 initialRoute 指定的路由
      initialRoute: '/',
      /// 一个 MaterialApp 中注册的路由表，在这个 MaterialApp 内的所有路由均可使用
      routes:{
        "/":(context) => const MyNavigator2Demo(title: '主页'),
        "/routeA":(context) => const RouteADemo(),
        "/routeB":(context) => const RouteBDemo(),
        "/routeC":(context) => const RouteCDemo(),
        "/routeD":(context) => const RouteDDemo(),
      },
    );
  }
}

class MyNavigator2Demo extends StatefulWidget {
  const MyNavigator2Demo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyNavigator2DemoState createState() => _MyNavigator2DemoState();
}

class _MyNavigator2DemoState extends State<MyNavigator2Demo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Wrap(
        spacing: 10,
        children: [
          MyButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/routeA');
            },
            child: const Text('导航到 route A'),
          ),
        ],
      ),
    );
  }
}