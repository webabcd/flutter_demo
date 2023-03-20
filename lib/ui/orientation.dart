/*
 * 屏幕方向
 * 所谓的左横屏，右横屏，上竖屏，下竖屏中的上下左右指的是听筒的位置
 *
 * 关于 android 和 ios 的配置说明：
 * 1、Android 的屏幕的支持方向在 /android/app/src/main/AndroidManifest.xml 中的 activity 中配置，类似如下
 * <activity android:screenOrientation="fullSensor" />
 * 2、iOS 的屏幕的支持方向在 /iosRunner/Info.plist 中配置，类似如下
 * <key>UISupportedInterfaceOrientations</key>
 * <array>
 *   <string>UIInterfaceOrientationPortrait</string>
 *   <string>UIInterfaceOrientationLandscapeLeft</string>
 *   <string>UIInterfaceOrientationLandscapeRight</string>
 * </array>
 * <key>UISupportedInterfaceOrientations~ipad</key>
 * <array>
 *   <string>UIInterfaceOrientationPortrait</string>
 *   <string>UIInterfaceOrientationPortraitUpsideDown</string>
 *   <string>UIInterfaceOrientationLandscapeLeft</string>
 *   <string>UIInterfaceOrientationLandscapeRight</string
 * </array>
 *
 * 注：
 * 经测试，通过 SystemChrome.setPreferredOrientations() 设置屏幕方向时，有的时候不符合预期
 * 所以建议这块还是自己写插件比较好
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class OrientationDemo extends StatefulWidget {
  const OrientationDemo({Key? key}) : super(key: key);

  @override
  _OrientationDemoState createState() => _OrientationDemoState();
}

class _OrientationDemoState extends State<OrientationDemo> {

  @override
  Widget build(BuildContext context) {
    /// OrientationBuilder - 用于监听屏幕方向的变化，发生变化时就会走到这里（但是左横屏直接变为右横屏，上竖屏直接变为下竖屏则不会走到这里）
    ///   Orientation.portrait - 竖屏
    ///   Orientation.landscape - 横屏
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("title"),
          ),
          backgroundColor: Colors.orange,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText("屏幕方向：$orientation"),
              ],
            ),
          ),
          persistentFooterButtons: [
            MyButton(
              onPressed: () {
                /// SystemChrome.setPreferredOrientations() - 设置屏幕的方向
                ///   注：我这里测试，这个有的时候不符合预期，所以建议这块还是自己写插件比较好
                SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
              },
              child: const Text("仅支持横屏"),
            ),
            MyButton(
              onPressed: () {
                SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
              },
              child: const Text("仅支持上竖屏"),
            ),
            MyButton(
              onPressed: () {
                SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
              },
              child: const Text("支持所有方向"),
            ),
          ],
        );
      },
    );
  }
}
