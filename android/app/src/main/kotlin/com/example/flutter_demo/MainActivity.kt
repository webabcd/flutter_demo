/*
 * 本例用于演示 android 插件的开发
 */

package com.example.flutter_demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val plugin1 = MyFlutterPlugin1()
        val plugin2 = MyFlutterPlugin2()

        // 注册自定义插件，用于演示 flutter 与 android 原生之间的数据通信
        flutterEngine.plugins.add(plugin1)

        // 注册自定义插件，用于演示 flutter 使用 android 原生控件，并做数据通信
        flutterEngine.plugins.add(plugin2)

        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}