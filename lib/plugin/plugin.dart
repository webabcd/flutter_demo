/*
 * 插件
 * 本例用于演示 flutter 与 android/ios/web 原生之间的数据通信
 *
 * 一、android 插件开发
 * 1、主 flutter 项目要先在 android 平台中运行一下
 * 2、在 android 文件夹上，使用右键菜单，然后选择 Flutter -> Open Android module in Android Studio 即可开发插件
 * 3、参见 /android/app/src/main/kotlin/com/example/flutter_demo/MainActivity.kt
 *
 * 二、ios 插件开发
 * 1、主 flutter 项目要先在 ios 平台中运行一下
 * 2、在 android studio 或 visual studio code 中执行如下逻辑
 *    cd ios
 *    pod install
 * 3、用 xcode 中打开 /ios/Runner.xcworkspace 即可开发插件
 * 4、参见 /ios/Runner/AppDelegate.swift
 *
 * 三、web 插件开发
 * 1、为了在 flutter 中调用 js，需要在 pubspec.yaml 中做如下配置
 * dependencies:
 *   flutter_web_plugins:
 *     sdk: flutter
 *   js: ^0.6.5
 * 2、为了开发 web 插件，需要在 pubspec.yaml 中做如下配置
 * flutter:
 *   plugin:
 *     platforms:
 *       web:
 *         fileName: plugin/flutter_plugin_web.dart      # 实现了 web 插件的文件的文件名
 *         pluginClass: FlutterPluginWeb                 # 实现了 web 插件的类名
 * 3、在 /web/index.html 中开发具体的 js 逻辑
 * 4、在 plugin/flutter_plugin_web.dart 开发 web 插件逻辑，包括 flutter 与 js 之间的方法映射等
 *
 *
 * 注：插件中实现的功能（非 .dart 实现的）不支持 flutter 的 hot reload
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


/// 使用插件
class MyPlugin {
  /// 获取指定名称的 MethodChannel（其用于 flutter 和插件之间的通信）
  static final MethodChannel _methodChannel = const MethodChannel("com.webabcd.flutter/channel1")
    ..setMethodCallHandler(_callHandler); /// 插件调用 flutter 时会执行这里

  /// 用于演示如何接收插件调用 flutter 时的方法名和参数值
  static Future<dynamic> _callHandler(MethodCall call) async {
    log("method:${call.method}, arguments:${call.arguments}");
  }

  static Future<String> method1() async {
    /// flutter 调用插件中的方法
    return await _methodChannel.invokeMethod("method1");
  }

  static Future<String> method2() async {
    /// flutter 调用插件中的方法，并传递一个字符串类型的参数
    return await _methodChannel.invokeMethod("method2", "abc");
  }

  static Future<String> method3() async {
    /// flutter 调用插件中的方法，并传递一个字典表类型的参数
    var map = {"name": "webabcd", "age": 43};
    return await _methodChannel.invokeMethod("method3", map);
  }

  static Future<String> method4() async {
    /// flutter 调用插件中的方法，并传递一个列表类型的参数
    var list = [1, 2, 3];
    return await _methodChannel.invokeMethod("method4", list);
  }

  static Future<String> method5() async {
    /// flutter 调用插件中的方法，并捕获异常
    try {
      return await _methodChannel.invokeMethod("method5");
    } on PlatformException catch(e) {
      return "调用 method5 异常 code:${e.code}, message:${e.message}, details:${e.details}";
    }
  }

  static Future<String> method6() async {
    /// flutter 调用插件中的方法，但是插件中没有这个方法
    try {
      return await _methodChannel.invokeMethod("method6");
    } on MissingPluginException catch(e) {
      return "调用 method6 异常 ${e.toString()}";
    }
  }
}