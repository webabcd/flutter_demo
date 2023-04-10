/*
 * 自定义插件，用于演示 flutter 与 ios 原生之间的数据通信
 */

import UIKit
import Flutter

// 自定义插件
class MyFlutterPlugin1: NSObject, FlutterPlugin
{
    static func register(with registrar: FlutterPluginRegistrar)
    {
        let binaryMessenger = registrar.messenger()
        let _ = MyFlutterPlugin1(binaryMessenger: binaryMessenger)
    }
    
    init(binaryMessenger: FlutterBinaryMessenger)
    {
        super.init()
        
        // 创建一个 FlutterMethodChannel 并指定其名称，它用于 flutter 和 ios 插件之间的通信（在 flutter 中通过名称获取此 channel 后就可以通信了）
        // binaryMessenger 的意思是这个 FlutterMethodChannel 用于传输二进制数据
        let methodChannel = FlutterMethodChannel(name: "com.webabcd.flutter/channel1", binaryMessenger: binaryMessenger)

        // flutter 调用 ios 插件中的方法时，会执行到这里
        methodChannel.setMethodCallHandler { (call:FlutterMethodCall, result:@escaping FlutterResult) in

            // flutter 调用 ios 插件中的方法的名称
            let method = call.method
            
            if (method == "method1")
            {
                let returnValue = self.method1()
                // 返回给 flutter 的结果
                result(returnValue)
                
                // 用于演示 ios 调用 flutter
                methodChannel.invokeMethod("ios to flutter", arguments: "param")
            }
            
            else if (method == "method2")
            {
                // 通过 call.arguments 获取 flutter 调用 ios 插件中的方法时传递的参数
                let param = call.arguments as! String
                let returnValue = self.method2(param: param)
                // 返回给 flutter 的结果
                result(returnValue)
            }
     
            else if (method == "method3")
            {
                // 通过 call.arguments 获取 flutter 调用 ios 插件中的方法时传递的参数
                let dict = call.arguments as! Dictionary<String, Any>
                let name = dict["name"] as! String
                let age = dict["age"] as! Int
                let returnValue = self.method3(name: name, age: age)
                // 返回给 flutter 的结果
                result(returnValue)
            }
            
            else if (method == "method4")
            {
                // 通过 call.arguments 获取 flutter 调用 ios 插件中的方法时传递的参数
                let array = call.arguments as! Array<Int>
                let returnValue = self.method4(array: array)
                // 返回给 flutter 的结果
                result(returnValue)
            }
            
            else if (method == "method5")
            {
                // 返回给 flutter 的自定义异常信息（flutter 中可以通过 try/catch 捕获到一个 PlatformException 类型的异常）
                result(FlutterError(code: "errorCode", message: "errorMessage", details: "errorDetails"))
            }
            
            else
            {
                // 如果 ios 插件中没有 flutter 调用的方法，则可以返回如下异常（flutter 中可以通过 try/catch 捕获到一个 MissingPluginException 类型的异常）
                result(FlutterMethodNotImplemented)
            }
        }
    }
    
    func method1() -> String
    {
        return "调用 method1 成功"
    }

    func method2(param:String) -> String
    {
        return "调用 method2 成功 param:\(param)"
    }

    func method3(name:String, age:Int) -> String
    {
        return "调用 method3 成功 name:\(name), age:\(age)"
    }

    func method4(array:Array<Int>) -> String
    {
        return "调用 method4 成功 \(array.map({ String($0) }).joined(separator: ","))"
    }
}
