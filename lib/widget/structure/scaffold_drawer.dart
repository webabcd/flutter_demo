/*
 * Drawer - 侧滑菜单（一般在 Scaffold 中使用）
 *
 * 左边缘右滑显示左侧的侧滑菜单，右边缘左滑显示右侧的侧滑菜单，点击空白处则侧滑菜单消失
 * drawer 是抽屉的意思，侧滑菜单类似抽屉所以称之为 drawer
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ScaffoldDrawerDemo extends StatelessWidget {
  const ScaffoldDrawerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 20,                            /// 通过手势打开侧边抽屉时，手势的起始点距屏幕边缘的最大宽度
      drawerScrimColor: Colors.blue.withAlpha(128),       /// 侧滑菜单显示后，主页面的颜色
      drawerEnableOpenDragGesture: true,                  /// 左侧抽屉是否支持手势打开
      endDrawerEnableOpenDragGesture: true,               /// 右侧抽屉是否支持手势打开
      onDrawerChanged: (isOpened) {                       /// 左侧抽屉的打开关闭状态发生变化时触发的事件
        log("onDrawerChanged: $isOpened");
      },
      onEndDrawerChanged: (isOpened) {                    /// 右侧抽屉的打开关闭状态发生变化时触发的事件
        log("onEndDrawerChanged: $isOpened");
      },

      drawer: Drawer(
        width: 200,                                       /// 宽度
        shadowColor: Colors.black,                        /// 阴影颜色
        elevation: 10,                                    /// 阴影高度
        shape: BeveledRectangleBorder(                    /// 边框
            side: const BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(0)
        ),
        backgroundColor: Colors.red,                      /// 背景色
        child: Center(                                    /// 需要显示的 widget
          child: TextButton(
            child: const MyText("close"),
            onPressed: () {
              /// 关闭当前的 drawer
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (BuildContext context) {
                return TextButton(
                  child: const MyText("打开左侧的侧滑菜单"),
                  onPressed: () {
                    /// 打开左侧的侧滑菜单
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return TextButton(
                  child: const MyText("打开右侧的侧滑菜单"),
                  onPressed: () {
                    /// 打开右侧的侧滑菜单
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}