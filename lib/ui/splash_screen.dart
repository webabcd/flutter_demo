/*
 * 闪屏页
 *
 * 一、android
 * 1、默认模板，在 /android/app/src/main/AndroidManifest.xml 中配置了闪屏页主题和非闪屏页主题
 * 2、闪屏页主题和非闪屏页主题的定义在 /android/app/src/main/res/values/styles.xml
 * 3、闪屏页主题的 window 窗口背景的定义在 /android/app/src/main/res/drawable/launch_background.xml
 *
 * 二、ios
 * 1、用 xcode 中打开 /ios/Runner.xcworkspace
 * 2、通过 LaunchScreen.storyboard 实现闪屏页（具体的 storyboard 的名字可以在 Info.plist 中配置）
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
