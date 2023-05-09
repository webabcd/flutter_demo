/*
 * 插件
 * 本例用于演示 flutter 使用 android/ios 原生控件，并做数据通信
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
 *
 * 注：插件中实现的功能（非 .dart 实现的）不支持 flutter 的 hot reload
 */

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper.dart';

class Plugin2Demo extends StatefulWidget {
  const Plugin2Demo({Key? key}) : super(key: key);

  @override
  _Plugin2DemoState createState() => _Plugin2DemoState();
}

class _Plugin2DemoState extends State<Plugin2Demo> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: const _MyWidget()
    );
  }
}


class _MyWidget extends StatefulWidget {
  const _MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_MyWidget> {

  /// 用于保存从 android/ios 发送到 flutter 的数据
  String _nativeToFlutterMessage = '';
  /// 用于控制 android/ios 和 flutter 通信的 controller
  final _controller = _MyViewController();

  @override
  void initState() {

    _controller.addListener(() {
      setState(() {
        _nativeToFlutterMessage = _controller.nativeToFlutterMessage;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: _buildNativeView(),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: _buildFlutterView(),
          ),
        ),
      ],
    );
  }

  /// 嵌入到 flutter 中的 android/ios 的 view
  Widget _buildNativeView() {
    return _MyNativeView(
      controller: _controller,
    );
  }

  Widget _buildFlutterView() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("native to flutter: $_nativeToFlutterMessage"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.flutterToNative("${DateTime.now().millisecondsSinceEpoch}");
              },
              child: const Text('发送数据给 Native'),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            'Flutter - View',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}


/// 嵌入到 flutter 中的 android/ios 的 view
class _MyNativeView extends StatefulWidget {
  final _MyViewController controller;

  const _MyNativeView({required this.controller, Key? key}) : super(key: key);

  @override
  _MyNativeViewState createState() => _MyNativeViewState();
}

class _MyNativeViewState extends State<_MyNativeView> {

  @override
  Widget build(BuildContext context) {

    /// 判断是否为 web 环境要用 kIsWeb
    /// 如果在 web 环境使用 Platform.xxx 的话会报错的
    if (kIsWeb) {
      return const MyText("不支持 web 环境");
    }

    if (Platform.isAndroid) {
      /// 嵌入到 flutter 中的 android 的 view（相关的插件在 android/app/src/main/kotlin/com/example/flutter_demo/MyFlutterPlugin2.kt）
      return AndroidView(
        viewType: 'com.webabcd.flutter/myview',                           /// 需要嵌入的 view 的标识（这是在插件中定义的）
        onPlatformViewCreated: _onPlatformViewCreated,                    /// 传给插件的初始参数
        creationParams: const <String, dynamic>{'k1': 'p1', 'k2': 'p2'},  /// 传给插件的初始参数的编码方式
        creationParamsCodec: const StandardMessageCodec(),                /// 需要嵌入的 view 创建后触发的事件
      );
    }

    if (Platform.isIOS) {
      /// 嵌入到 flutter 中的 ios 的 view（相关的插件在 ios/Runner/MyFlutterPlugin2.swift）
      return UiKitView(
        viewType: 'com.webabcd.flutter/myview',                           /// 需要嵌入的 view 的标识（这是在插件中定义的）
        creationParams: const <String, dynamic>{'k1': 'p1', 'k2': 'p2'},  /// 传给插件的初始参数
        creationParamsCodec: const StandardMessageCodec(),                /// 传给插件的初始参数的编码方式
        onPlatformViewCreated: _onPlatformViewCreated,                    /// 需要嵌入的 view 创建后触发的事件
      );
    }

    return const MyText("不支持当前环境");
  }

  /// 对于 android 来说，这个 id 是插件中 PlatformViewFactory 的 create() 中生成的 viewId
  /// 对于 ios 来说，这个 id 是插件中 FlutterPlatformViewFactory 的 create() 中生成的 viewId
  void _onPlatformViewCreated(int id) {
    var methodChannel = MethodChannel('com.webabcd.flutter/channel2_view$id');
    widget.controller.setMethodChannel(methodChannel);
  }
}

/// 用于控制 android/ios 和 flutter 通信的 controller
class _MyViewController extends ChangeNotifier {

  late MethodChannel _methodChannel;

  String nativeToFlutterMessage = "";

  /// 接收从 android/ios 发送到 flutter 的数据
  void setMethodChannel(MethodChannel methodChannel) {
    _methodChannel = methodChannel;
    _methodChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'nativeToFlutter':
          final result = call.arguments as String;
          nativeToFlutterMessage = result;
          notifyListeners();
          break;
      }
    });
  }

  /// 从 flutter 发送数据到 android/ios
  Future<void> flutterToNative(String message) async {
    await _methodChannel.invokeMethod('flutterToNative', message);
  }
}