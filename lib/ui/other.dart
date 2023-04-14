/*
 * 其它
 */

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../helper.dart';

class OtherDemo extends StatefulWidget {
  const OtherDemo({Key? key}) : super(key: key);

  @override
  _OtherDemoState createState() => _OtherDemoState();
}

class _OtherDemoState extends State<OtherDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        children: const [
          _MyWidget1(),
          _MyWidget2(),
        ],
      ),
    );
  }
}

class _MyWidget1 extends StatelessWidget {
  const _MyWidget1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      // color: Colors.red,
      // color: Colors.red[100],
      /// 颜色值 Colors.red 之类的不是纯的，具体看源码
      /// 颜色值可以通过类似 Colors.red[100] 的方式指定色值的浓淡，具体看源码
      /// 自定义颜色值的规则是 argb
      color: const Color(0xffff0000),
    );
  }
}

class _MyWidget2 extends StatelessWidget {
  const _MyWidget2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 判断是否为 web 环境要用 kIsWeb
    /// 如果在 web 环境使用 Platform.xxx 的话会报错的
    if (kIsWeb) {
      return const MyText("kIsWeb");
    }
    /// 是否是 android 环境
    if (Platform.isAndroid) {
      return const MyText("Platform.isAndroid");
    }
    /// 是否是 ios 环境
    if (Platform.isIOS) {
      return const MyText("Platform.isIOS");
    }
    return const MyText("不是 web, 不是 android, 不是 ios");
  }
}