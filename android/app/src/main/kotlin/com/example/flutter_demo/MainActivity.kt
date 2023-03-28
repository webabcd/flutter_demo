/*
 * 本例用于演示 android 插件的开发
 */

package com.example.flutter_demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // 这里用于注册自定义插件
        flutterEngine.plugins.add(MyFlutterPlugin())

        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}

// 自定义插件
class MyFlutterPlugin : FlutterPlugin {

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {

        // 获取 android 的 application 级别的 context
        var applicationContext = binding.applicationContext;

        // 创建一个 channel 并指定这个 channel 的名称，此 channel 用于 flutter 和 android 插件之间的通信
        // binding.binaryMessenger 的意思是这个 channel 用于传输二进制数据
        val channel = MethodChannel(binding.binaryMessenger, "myChannel")

        // flutter 调用 android 插件中的方法时，会执行这里
        channel.setMethodCallHandler { call, result ->
            // flutter 调用 android 插件中的方法的名称
            val method = call.method

            if (method == "method1") {
                val returnValue = method1()
                // 返回给 flutter 的结果
                result.success(returnValue)
            }

            else if (method == "method2") {
                // 通过 call.arguments 获取 flutter 调用 android 插件中的方法时传递的参数
                val param = call.arguments as String
                val returnValue = method2(param)
                // 返回给 flutter 的结果
                result.success(returnValue)
            }

            else if (method == "method3") {
                // 通过 call.argument<T>(key) 获取 flutter 调用 android 插件中的方法时传递的字典表中的指定 key 的数据
                val name = call.argument<String>("name")!!
                val age = call.argument<Int>("age")!!
                val returnValue = method3(name, age)
                // 返回给 flutter 的结果
                result.success(returnValue)
            }

            else if (method == "method4") {
                // 通过 call.arguments<T>() 获取 flutter 调用 android 插件中的方法时传递的参数
                val param = call.arguments<List<Int>>()!!
                val returnValue = method4(param)
                // 返回给 flutter 的结果
                result.success(returnValue)
            }

            else if (method == "method5") {
                // 返回给 flutter 的自定义异常信息（flutter 中可以通过 try/catch 捕获到一个 PlatformException 类型的异常）
                result.error("errorCode", "errorMessage", "errorDetails")
            }

            else {
                // 如果 android 插件中没有 flutter 调用的方法，则可以返回如下异常（flutter 中可以通过 try/catch 捕获到一个 MissingPluginException 类型的异常）
                result.notImplemented()
            }
        }
    }

    private fun method1(): String {
        return "调用 method1 成功"
    }

    private fun method2(param:String): String {
        return "调用 method2 成功 param:$param"
    }

    private fun method3(name:String, age:Int): String {
        return "调用 method3 成功 name:$name, age:$age"
    }

    private fun method4(param:List<Int>): String {
        return "调用 method4 成功 ${param.joinToString(",")}"
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {

    }
}