/*
 * 本例用于演示 ios 插件的开发
 */

import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate
{
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // 这里用于注册自定义插件
        let messenger : FlutterBinaryMessenger = window?.rootViewController as! FlutterBinaryMessenger
        myPlugin(messenger: messenger)
        
        GeneratedPluginRegistrant.register(with: self)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // 自定义插件
    func myPlugin(messenger: FlutterBinaryMessenger) {

        // 创建一个 channel 并指定这个 channel 的名称，此 channel 用于 flutter 和 ios 插件之间的通信
        // binaryMessenger 的意思是这个 channel 用于传输二进制数据
        let channel = FlutterMethodChannel(name: "myChannel", binaryMessenger: messenger)

        // flutter 调用 ios 插件中的方法时，会执行这里
        channel.setMethodCallHandler { (call:FlutterMethodCall, result:@escaping FlutterResult) in

            // flutter 调用 ios 插件中的方法的名称
            let method = call.method
            
            if (method == "method1")
            {
                let returnValue = self.method1()
                // 返回给 flutter 的结果
                result(returnValue)
                
                // 用于演示 ios 调用 flutter
                channel.invokeMethod("ios to flutter", arguments: "param")
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
