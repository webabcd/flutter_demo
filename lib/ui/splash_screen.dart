/*
 * 闪屏页，程序名称，程序图标
 *
 *
 * 闪屏页
 * 一、android
 * 1、默认模板，在 /android/app/src/main/AndroidManifest.xml 中配置了闪屏页主题和非闪屏页主题
 * 2、闪屏页主题和非闪屏页主题的定义在 /android/app/src/main/res/values/styles.xml
 * 3、闪屏页主题的 window 窗口背景的定义在 /android/app/src/main/res/drawable/launch_background.xml
 * 二、ios
 * 1、用 xcode 中打开 /ios/Runner.xcworkspace
 * 2、通过 LaunchScreen.storyboard 实现闪屏页（具体的 storyboard 的名字可以在 Info.plist 中配置）
 *
 *
 * 程序名称
 * 一、android
 * 在 /android/app/src/main/AndroidManifest.xml 中的 application 节点做类似如下的配置 android:label="flutter_demo"
 * 二、ios
 * 在 /ios/Runner/Info.plist 中做类似如下的配置
 * <key>CFBundleDisplayName</key>
 * <string>flutter_demo</string>
 * <key>CFBundleName</key>
 * <string>flutter_demo</string>
 *
 *
 * 程序图标
 * 一、android
 * 在 /android/app/src/main/AndroidManifest.xml 中的 application 节点做类似如下的配置 android:icon="@mipmap/ic_launcher"
 * 二、ios
 * 用 xcode 中打开 /ios/Runner.xcworkspace 然后在 Assets.xcassets 中的 AppIcon 中配置即可
 */

import 'package:flutter/material.dart';

class SplashScreenDemo extends StatefulWidget {
  const SplashScreenDemo({Key? key}) : super(key: key);

  @override
  _SplashScreenDemoState createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<SplashScreenDemo> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}
