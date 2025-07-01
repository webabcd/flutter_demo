/*
 * 本例用于演示 web 插件的开发（flutter 使用 web 原生控件，并做数据通信）（新版 flutter 的实现方式）
 *
 * 本例中用的 flutter 与 js 的通信方式实现起来比较简单，但是无法和 android/ios 插件的接口保持一致
 * 如果对于 flutter 的开发来说，其想要与 android/ios/web 通信的方法都是一样的，则可以参见 flutter_plugin_web.dart 中的实现方式
 * 
 * 注：本例演示的是新版 flutter 的实现方式，旧版 flutter 的实现方式请参见 /lib/plugin/flutter_plugin_web2.dart
 */

import 'dart:ui_web' as ui;
import 'package:web/web.dart' as web;
import 'dart:js_interop' as js_interop;

import 'package:flutter/material.dart';

class FlutterPluginWeb2New {

  /// 构造一个 HtmlElementView，其用于在 flutter 中显示指定的 html（仅在 web 环境可用）
  /// jsToFlutter 是 js 端调用 flutter 端之后，需要回调的函数
  HtmlElementView getHtmlElementView(void Function(js_interop.JSString message) jsToFlutter) {

    /// js 端调用 globalThis.yyy_jsToFlutter() 之后就会调用 jsToFlutter
    yyyJsToFlutter = jsToFlutter.toJS;
 
    final script = web.HTMLScriptElement();
    script.innerHTML = '''
      // 用于演示 flutter 调用 js
      function yyy_flutterToJs(message) {
        document.getElementById("txtMessage").innerHTML = "flutter to js: " + message;
        return "ok";
      }

      // 用于演示 js 调用 flutter
      function yyy_jsToFlutter_demo() {
        // 通过 globalThis.yyy_jsToFlutter() 实现 js 调用 flutter
        globalThis.yyy_jsToFlutter(new Date().getTime().toString());
      }
    '''.toJS;
    web.document.head?.appendChild(script);

    final view = web.HTMLDivElement()
      ..style.width = '100%'
      ..style.height = '100%';
    view.innerHTML = """
      <style>
        #myDiv {
          height: 100%;
          font-size: 14px
          color: white;
          display: flex;
          flex-direction: column;
          align-items: center;
        }
      </style>

      <div id="myDiv">
        <div id="txtMessage" style="flex-grow: 1; display: flex; flex-direction: column; justify-content: flex-end; color: black; margin-bottom: 12px"></div>
        <div style="flex-grow: 1; display: flex; flex-direction: column; justify-content: flex-start;">
          <button style="padding: 12px" onclick="yyy_jsToFlutter_demo();">发送数据给 flutter</button>
        </div>
        <div style="color: black; font-size: 24px; margin-bottom: 12px">Web - View</div>
      </div>
    """.toJS;
    
    /// 注册一个名为 com.webabcd.flutter/myview_newWeb 的 html
    /// 必须要有下面这行注释，否则会报错 The name 'platformViewRegistry' is being referenced through the prefix 'ui', but it isn't defined in any of the libraries imported using that prefix.
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('com.webabcd.flutter/myview_newWeb', (int viewId) => view);

    /// 使用已注册的名为 com.webabcd.flutter/myview_newWeb 的 html
    return HtmlElementView(
      viewType: 'com.webabcd.flutter/myview_newWeb',
      onPlatformViewCreated: _onPlatformViewCreated,  /// 需要嵌入的 view 创建后触发的事件
    );
  }

  void _onPlatformViewCreated(int id) {
    /// 这里的 id 就是上面 (int viewId) => view 中的 viewId
  }

  static dynamic flutterToJs(String message) {
    // 用于演示 flutter 调用 js
    return yyyFlutterToJs(message);
  }
}

/// 将 dart 函数与指定的 js 函数做绑定（调用此 dart 函数就会调用指定的 js 函数）
/// js 端名为 yyy_flutterToJs, dart 端名为 yyyFlutterToJs
@js_interop.JS("yyy_flutterToJs")
external String yyyFlutterToJs(String message);

/// 将 dart 函数与指定的 js 函数做绑定（调用指定的 js 函数就会调用此 dart 函数）
/// js 端名为 yyy_jsToFlutter, dart 端名为 yyyJsToFlutter
@js_interop.JS("yyy_jsToFlutter")
external set yyyJsToFlutter(js_interop.JSFunction value);