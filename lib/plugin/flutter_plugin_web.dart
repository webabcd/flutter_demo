/*
 * 本例用于演示 web 插件的开发（flutter 与 web 原生之间的数据通信）
 * 这里用于注册插件，以及配置 flutter 与 js 之间的方法映射等
 * 具体的插件逻辑请参见 /web/index.html
 *
 * web 插件的开发与 android/ios 插件的开发不太一样
 * android/ios 的插件注册和插件逻辑，完全是在 android 端和 ios 端实现的
 * web 的插件注册，以及 flutter 与 js 之间的方法映射是在 flutter 端实现的，具体的插件逻辑是在 web 端实现的
 *
 *
 * 在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * # 为了在 flutter 中调用 js
 * dependencies:
 *   flutter_web_plugins:
 *     sdk: flutter
 *   js: ^0.6.5
 * flutter:
 *   # 为了开发 web 插件
 *   plugin:
 *     platforms:
 *       web:
 *         fileName: plugin/flutter_plugin_web.dart      # 实现了 web 插件的文件的文件名
 *         pluginClass: FlutterPluginWeb                 # 实现了 web 插件的类名
 *
 *
 * 注：
 * 本例介绍的 flutter 与 js 通信的方法有一些麻烦，但是可以和 android/ios 插件的接口保持一致，这样对于 flutter 的开发来说，其与 android/ios/web 通信的方法都是一样的
 * 如果没有上述要求，则可以用更简单的通信方式，参见 flutter_plugin_web2.dart
 */

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

/// 在 flutter 中调用 xxx() 后，就会调用 js 中的 window.alert()
@JS('window.alert')
external void xxx(Object obj);

/// 在 js 中调用 webabcd_jsToFlutter() 后，就会调用 flutter 中的 jsToFlutter()
@JS('webabcd_jsToFlutter')
external set jsToFlutter(void Function(String method, dynamic arguments) f);

/// 在 flutter 中调用 flutterToJs() 后，就会调用 js 中的 webabcd_flutterToJs()
@JS("webabcd_flutterToJs")
external dynamic flutterToJs(String method, dynamic arguments);

/// 这个类名就是在 pubspec.yaml 中配置的 web 插件的类名
class FlutterPluginWeb {

  /// 注册自定义插件，用于演示 flutter 与 web 原生之间的数据通信
  static void registerWith(Registrar registrar) {
    /// 创建一个 MethodChannel 并指定其名称，它用于 flutter 和 web 插件之间的通信（在 flutter 中通过名称获取此 channel 后就可以通信了）
    final MethodChannel methodChannel = MethodChannel(
      'com.webabcd.flutter/channel1',
      const StandardMethodCodec(),
      registrar,
    );

    /// flutter 调用 web 插件中的方法时，会执行到这里
    final flutterPluginWeb = FlutterPluginWeb();
    methodChannel.setMethodCallHandler(flutterPluginWeb._methodCallHandler);

    /// 在 js 中调用 webabcd_jsToFlutter() 后，会执行到这里
    jsToFlutter = allowInterop((String method, dynamic arguments) {
      /// 用于演示 web 插件调用 flutter
      /// 对于本例来说，调用这句后，就会在 plugin.dart 中的 MyPlugin 的 _callHandler() 中接收到此回调
      methodChannel.invokeMethod(method, arguments);
    });

    /// flutter 调用 js
    xxx("插件注册完成");
  }

  /// flutter 调用 web 插件中的方法时
  Future<dynamic> _methodCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'method1':
        /// 调用 js 中的 webabcd_flutterToJs()
        /// 本例演示的是如何调用 js 中的 Promise，如果 js 中不用 Promise 的话则把这里的 promiseToFuture() 去掉即可
        /// 对于本例来说，这里的返回值，会在 plugin.dart 中的 MyPlugin 的 method1() 中收到
        return promiseToFuture(flutterToJs(call.method, call.arguments));
      case 'method2':
        return promiseToFuture(flutterToJs(call.method, call.arguments));
      case 'method3':
        return promiseToFuture(flutterToJs(call.method, call.arguments));
      case 'method4':
        return promiseToFuture(flutterToJs(call.method, call.arguments));
      case 'method5':
        return promiseToFuture(flutterToJs(call.method, call.arguments));

        /// 可以用如下方式返回给 flutter 一个自定义异常信息（flutter 中可以通过 try/catch 捕获到一个 PlatformException 类型的异常）
        /*
        throw PlatformException(
          code: 'errorCode',
          message: "errorMessage",
          details: "errorDetails",
        );
        */
      case 'method6':
        /// 如果 web 插件中没有 flutter 调用的方法，则可以返回如下异常（flutter 中可以通过 try/catch 捕获到一个 MissingPluginException 类型的异常）
        throw MissingPluginException();
      default:
        return "unimplemented";
    }
  }
}