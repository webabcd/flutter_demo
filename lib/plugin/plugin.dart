/*
 * 插件基础
 *
 * 一、android 插件开发
 * 1、在 android 文件夹上，使用右键菜单，然后选择 Flutter -> Open Android module in Android Studio
 * 2、参见 /android/app/src/main/kotlin/com/example/flutter_demo/MainActivity.kt
 *
 *
 *
 * 注：插件中实现的功能不支持 flutter 的 hot reload
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class PluginDemo extends StatefulWidget {
  const PluginDemo({Key? key}) : super(key: key);

  @override
  _PluginDemoState createState() => _PluginDemoState();
}

class _PluginDemoState extends State<PluginDemo> {

  String text = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: MyText(text),
      ),
      persistentFooterButtons: [
        MyButton(
          onPressed: () async {
            var result = await MyPlugin.method1();
            setState(() {
              text = result;
            });
          },
          child: const Text("method1"),
        ),
        MyButton(
          onPressed: () async {
            var result = await MyPlugin.method2();
            setState(() {
              text = result;
            });
          },
          child: const Text("method2"),
        ),
        MyButton(
          onPressed: () async {
            var result = await MyPlugin.method3();
            setState(() {
              text = result;
            });
          },
          child: const Text("method3"),
        ),
        MyButton(
          onPressed: () async {
            var result = await MyPlugin.method4();
            setState(() {
              text = result;
            });
          },
          child: const Text("method4"),
        ),
        MyButton(
          onPressed: () async {
            var result = await MyPlugin.method5();
            setState(() {
              text = result;
            });
          },
          child: const Text("method5"),
        ),
        MyButton(
          onPressed: () async {
            var result = await MyPlugin.method6();
            setState(() {
              text = result;
            });
          },
          child: const Text("method6"),
        ),
      ],
    );
  }
}


class MyPlugin {
  /// 指定一个 channel 的名称，从而获取这个用于 flutter 和 android 插件之间通信的 channel
  static const MethodChannel _channel = MethodChannel("myChannel");

  static Future<String> method1() async {
    /// flutter 调用 android 插件中的方法
    return await _channel.invokeMethod("method1");
  }

  static Future<String> method2() async {
    /// flutter 调用 android 插件中的方法，并传递一个字符串类型的参数
    return await _channel.invokeMethod("method2", "abc");
  }

  static Future<String> method3() async {
    /// flutter 调用 android 插件中的方法，并传递一个字典表类型的参数
    var map = {"name": "webabcd", "age": 43};
    return await _channel.invokeMethod("method3", map);
  }

  static Future<String> method4() async {
    /// flutter 调用 android 插件中的方法，并传递一个列表类型的参数
    var list = [1, 2, 3];
    return await _channel.invokeMethod("method4", list);
  }

  static Future<String> method5() async {
    /// flutter 调用 android 插件中的方法，并捕获异常
    try {
      return await _channel.invokeMethod("method5");
    } on PlatformException catch(e) {
      return "调用 method5 异常 code:${e.code}, message:${e.message}, details:${e.details}";
    }
  }

  static Future<String> method6() async {
    /// flutter 调用 android 插件中的方法，但是 android 插件中没有这个方法
    try {
      return await _channel.invokeMethod("method6");
    } on MissingPluginException catch(e) {
      return "调用 method6 异常 ${e.toString()}";
    }
  }
}