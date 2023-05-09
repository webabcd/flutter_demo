/*
 * 此文件对外的方法定义与 flutter_plugin_web2.dart 是一致的，用于编译非 web 时使用
 */

import 'package:flutter/material.dart';

class FlutterPluginWeb2 {

  Widget getHtmlElementView(dynamic jsToFlutter) {
    return const Text("不可能到这里");
  }

  static dynamic flutterToJs(String message) {
    return "不可能到这里";
  }
}