/*
 * 自定义插件，用于演示 flutter 使用 ios 原生控件，并做数据通信
 */

import UIKit
import Flutter

// 自定义插件
class MyFlutterPlugin2: NSObject, FlutterPlugin
{
    static func register(with registrar: FlutterPluginRegistrar)
    {
        let binaryMessenger = registrar.messenger() // binaryMessenger 用于后续通过 FlutterMethodChannel 传输二进制数据
        
        let factory = MyFlutterPlatformViewFactory(binaryMessenger: binaryMessenger)
        registrar.register(factory, withId: "com.webabcd.flutter/myview") // 指定 view 的标识，在 flutter 中通过此标识使用这个 view
    }
}

// 自定义 FlutterPlatformViewFactory 用于创建一个 FlutterPlatformView
class MyFlutterPlatformViewFactory: NSObject,FlutterPlatformViewFactory {
    
    var binaryMessenger: FlutterBinaryMessenger?
    
    init(binaryMessenger: FlutterBinaryMessenger)
    {
        super.init()
        
        self.binaryMessenger = binaryMessenger
    }
    
    // viewId - 创建的 view 实例的 id（当这个 view 创建成功后，回调 UiKitView 的 onPlatformViewCreated 时，会把这个 viewId 传递过去）
    // args - 在 flutter 中通过 UiKitView 的 creationParams 传递过来的初始参数
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView
    {
        return MyFlutterPlatformView(frame, viewId: viewId, args: args, binaryMessenger: self.binaryMessenger!)
    }
    
    // 初始参数的编码方式，要与 UiKitView 的 creationParamsCodec 一致
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol
    {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

// 自定义 FlutterPlatformView 用于将指定的 ios 中的 view 嵌入到 flutter 中
class MyFlutterPlatformView: NSObject, FlutterPlatformView {
    
    // 需要嵌入到 flutter 中的 ios 的 view
    var _myView: MyView?
    // 用于 flutter 与 ios 之间的通信
    var _methodChannel: FlutterMethodChannel?
    
    init(_ frame: CGRect, viewId: Int64, args :Any?, binaryMessenger: FlutterBinaryMessenger)
    {
        super.init()
        
        _myView = MyView()
        _myView!.frame = frame
        
        // 获取在 flutter 中通过 UiKitView 的 creationParams 传递过来的初始参数
        if let dict = args as? NSDictionary
        {
            _myView!.showMessage(message: "flutter 创建 UiKitView 时的初始参数 k1:\(dict.value(forKey: "k1") as! String), k2:\(dict.value(forKey: "k2") as! String)")
        }

        // 创建一个 FlutterMethodChannel 并指定其名称，它用于 flutter 和 ios 插件之间的通信（在 flutter 中通过名称获取此 channel 后就可以通信了）
        // binaryMessenger 的意思是这个 FlutterMethodChannel 用于传输二进制数据
        _methodChannel = FlutterMethodChannel(name: "com.webabcd.flutter/channel2_view\(viewId)", binaryMessenger: binaryMessenger)
        // flutter 调用 ios 插件中的方法时，会执行到这里（更详细的说明请参见 MyFlutterPlugin1.swift）
        _methodChannel!.setMethodCallHandler { (call:FlutterMethodCall, result:@escaping FlutterResult) in
          
            let method = call.method
            
            if (method == "flutterToNative")
            {
                let message = call.arguments as! String
                self._myView!.showMessage(message: "flutter to ios: \(message)")
                result(true)
            }
        }
        
        _myView!.setIosToFlutterHandler { message in
            // 通过 FlutterMethodChannel 从 ios 发送数据到 flutter
            self._methodChannel!.invokeMethod("nativeToFlutter", arguments: message)
        }
    }
    
    // 返回需要嵌入到 flutter 中的 ios 的 view
    func view() -> UIView {
        return _myView!
    }
}
