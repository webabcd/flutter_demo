/**
 * 自定义插件，用于演示 flutter 使用 android 原生控件，并做数据通信
 */

package com.example.flutter_demo

import android.content.Context
import android.view.View
import androidx.annotation.NonNull
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

// 自定义插件
class MyFlutterPlugin2: FlutterPlugin {

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "com.webabcd.flutter/myview", // 指定 view 的标识，在 flutter 中通过此标识使用这个 view
            MyPlatformViewFactory(flutterPluginBinding.binaryMessenger) // binaryMessenger 用于后续通过 MethodChannel 传输二进制数据
        )
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

    }
}

// 自定义 PlatformViewFactory 用于创建一个 PlatformView
class MyPlatformViewFactory(private val binaryMessenger: BinaryMessenger)
    : PlatformViewFactory(StandardMessageCodec.INSTANCE) { // StandardMessageCodec 用于指定初始参数的编码方式，要与 AndroidView 的 creationParamsCodec 一致

    // viewId - 创建的 view 实例的 id（当这个 view 创建成功后，回调 AndroidView 的 onPlatformViewCreated 时，会把这个 viewId 传递过去）
    // args - 在 flutter 中通过 AndroidView 的 creationParams 传递过来的初始参数
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return MyPlatformView(context!!, viewId, args, binaryMessenger)
    }
}

// 自定义 PlatformView 用于将指定的 android 中的 view 嵌入到 flutter 中
class MyPlatformView(private val context: Context, viewId: Int, args: Any?, binaryMessenger: BinaryMessenger)
    : PlatformView, MethodChannel.MethodCallHandler {

    // 需要嵌入到 flutter 中的 android 的 view
    private var _myView: MyView
    // 用于 flutter 与 android 之间的通信
    private var _methodChannel: MethodChannel

    init {
        // 创建一个 MethodChannel 并指定其名称，它用于 flutter 和 android 插件之间的通信（在 flutter 中通过名称获取此 channel 后就可以通信了）
        // binaryMessenger 的意思是这个 MethodChannel 用于传输二进制数据
        _methodChannel = MethodChannel(binaryMessenger, "com.webabcd.flutter/channel2_view$viewId")
        _methodChannel.setMethodCallHandler(this)

        _myView = MyView(context, null)
        // android 中的 view 需要发数据到 flutter
        _myView.setOnAndroidToFlutterHandler(object : OnAndroidToFlutterHandler {
            override fun onAndroidToFlutter(message: String) {
                // 通过 MethodChannel 从 android 发送数据到 flutter
                _methodChannel.invokeMethod("nativeToFlutter",message)
            }
        })

        // 获取在 flutter 中通过 AndroidView 的 creationParams 传递过来的初始参数
        val dict = args as? Map<String, Any?>
        if (dict != null) {
            _myView.showMessage("flutter 创建 AndroidView 时的初始参数 k1:${dict.getValue("k1") as String}, k2:${dict.getValue("k2") as String}")
        }
    }

    // 返回需要嵌入到 flutter 中的 android 的 view
    override fun getView(): View? {
        return _myView
    }

    // flutter 调用 android 插件中的方法时，会执行到这里（更详细的说明请参见 MyFlutterPlugin1.kt）
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "flutterToNative" -> {
                val message = call.arguments as String
                _myView?.showMessage("flutter to android: $message")
                result.success(true)
            }
            else -> result.notImplemented()
        }
    }

    override fun dispose() {
        Log.i("MyPlatformView", "dispose")
    }
}