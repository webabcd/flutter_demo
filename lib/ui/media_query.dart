/*
 * MediaQuery - 获取屏幕的相关信息，使系统设置中的字体大小无效
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class MediaQueryDemo extends StatefulWidget {
  const MediaQueryDemo({Key? key}) : super(key: key);

  @override
  _MediaQueryDemoState createState() => _MediaQueryDemoState();
}

class _MediaQueryDemoState extends State<MediaQueryDemo> {

  @override
  Widget build(BuildContext context) {

    String message = "";

    /// 获取屏幕的相关信息
    MediaQueryData data = MediaQuery.of(context);
    message = 'size: ${data.size}\n'                              /// 逻辑分辨率
        'devicePixelRatio: ${data.devicePixelRatio}\n'            /// 物理分辨率与逻辑分辨率的比值
        'textScaleFactor: ${data.textScaleFactor}\n'              /// 系统设置中的字体大小
        'platformBrightness: ${data.platformBrightness}\n'        /// 当前处于浅色模式还是深色模式
        'padding: ${data.padding}\n'                              /// 安全区域的尺寸
        'viewInsets: ${data.viewInsets}\n'                        /// 通过 .bottom 获取当前软键盘的高度
        'alwaysUse24HourFormat: ${data.alwaysUse24HourFormat}\n'  /// 是否是 24 小时制
        'orientation: ${data.orientation}';                       /// 当前屏幕的方向

    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextSmall(message),
          MediaQuery(
            // 使系统设置中的字体大小无效，会强制用 textScaleFactor 指定的值代替系统设置中的字体大小
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.5),
            child: MyTextSmall(message),
          ),
        ],
      ),
    );
  }
}