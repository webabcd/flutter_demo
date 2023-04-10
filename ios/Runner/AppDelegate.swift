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
        // 用于为某个插件提供服务
        let registrar1: FlutterPluginRegistrar = self.registrar(forPlugin: "com.webabcd.flutter/plugin1")!
        let registrar2: FlutterPluginRegistrar = self.registrar(forPlugin: "com.webabcd.flutter/plugin2")!
        
        // 注册自定义插件，用于演示 flutter 与 ios 原生之间的数据通信
        MyFlutterPlugin1.register(with: registrar1)
        
        // 注册自定义插件，用于演示 flutter 使用 ios 原生控件，并做数据通信
        MyFlutterPlugin2.register(with: registrar2)
        
        GeneratedPluginRegistrant.register(with: self)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
