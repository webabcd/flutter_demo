/*
 * 本例用于演示 web 插件的开发（flutter 使用 web 原生控件，并做数据通信）
 *
 * 本例中用的 flutter 与 js 的通信方式实现起来比较简单，但是无法和 android/ios 插件的接口保持一致
 * 如果对于 flutter 的开发来说，其想要与 android/ios/web 通信的方法都是一样的，则可以参见 flutter_plugin_web.dart 中的实现方式
 */

import 'dart:html' as html;
import 'dart:ui' as ui;
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterPluginWeb2 {

  /// 构造一个 HtmlElementView，其用于在 flutter 中显示指定的 html（仅在 web 环境可用）
  HtmlElementView getHtmlElementView(dynamic jsToFlutter) {
    var view = html.DivElement()
      ..append(html.StyleElement()
        ..text = """
            #myDiv {
              height: 100%;
              font-size: 14px
              color: white;
              display: flex;
              flex-direction: column;
              align-items: center;
            }
          """
      )
      ..append(html.ScriptElement()
        ..text = """
            // 用于演示 flutter 调用 js
            function xxx_flutterToJs(message) {
              document.getElementById("txtMessage").innerHTML = "flutter to js: " + message;
            }
            
            // 用于演示 js 调用 flutter
            function send() {
              // 通过 xxx_jsToFlutter() 调用 flutter
              // 这个 xxx_jsToFlutter() 是通过类似这样注册的 js.context["xxx_jsToFlutter"] = jsToFlutter;
              window.xxx_jsToFlutter(new Date().getTime().toString());
            }
          """
      )
      ..append(html.DivElement()
        ..id = 'myDiv'
        ..append(html.DivElement()
          ..id = 'txtMessage'
          ..setAttribute("style", "flex-grow: 1; display: flex; flex-direction: column; justify-content: flex-end; color: black; margin-bottom: 12px")
        )
        ..append(html.DivElement()
          ..setAttribute("style", "flex-grow: 1; display: flex; flex-direction: column; justify-content: flex-start;")
          ..setAttribute("onclick", "send();")
          ..append(html.ButtonElement()
            ..setAttribute("style", "padding: 12px")
            ..setInnerHtml("发送数据给 flutter")
          )
        )
        ..append(html.DivElement()
          ..setAttribute("style", "flex-grow: 0; color: black; font-size: 24px; margin-bottom: 12px")
          ..setInnerHtml("Web - View")
        )
      );

    /// 注册一个名为 com.webabcd.flutter/myview 的 html
    /// 必须要有下面这行注释，否则会报错 The name 'platformViewRegistry' is being referenced through the prefix 'ui', but it isn't defined in any of the libraries imported using that prefix.
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('com.webabcd.flutter/myview', (int viewId) => view);

    /// 通过 js.context[] 在 js 中注册 js 调用 flutter 的方法，并将其映射到 flutter 中指定的方法
    /// 本例的意思是，在 js 中注册一个名为 xxx_jsToFlutter() 的方法，在 js 中调用此方法后，就会调用 flutter 中的 jsToFlutter() 方法
    js.context["xxx_jsToFlutter"] = jsToFlutter;

    /// 使用已注册的名为 com.webabcd.flutter/myview 的 html
    return HtmlElementView(
      viewType: 'com.webabcd.flutter/myview',
      onPlatformViewCreated: _onPlatformViewCreated,  /// 需要嵌入的 view 创建后触发的事件
    );
  }

  void _onPlatformViewCreated(int id) {
    /// 这里的 id 就是上面 (int viewId) => view 中的 viewId
    /// 一般在这里构造一个 MethodChannel 用于 flutter 和 web 之间的数据通信
    /// 这种方式可以让 flutter 和 web 之间的数据通信接口与 android/ios 插件的接口保持一致，从而对于 flutter 的开发来说，保证它与 android/ios/web 通信的方法都是一样的
    /// 具体如何实现可以参看 flutter_plugin_web.dart 中的说明，本例不用这种方式实现，而是用另一种简单的方式实现 flutter 与 js 的通信（但是无法和 android/ios 插件的接口保持一致）
    var methodChannel = MethodChannel('com.webabcd.flutter/channel2_view$id');
  }

  static dynamic flutterToJs(String message) {
    /// 通过 js.context.callMethod() 调用指定的 js 方法，并允许传递参数
    return js.context.callMethod('xxx_flutterToJs', [message]);
  }
}