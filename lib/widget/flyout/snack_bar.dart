/*
 * SnackBar - 底部弹出条
 *
 * 注：需要使用 Scaffold 实现此功能
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class SnackBarDemo extends StatefulWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("title")),
        body: const Center(
          child: _MyStatelessWidget(),
        ),
      ),
    );
  }
}

class _MyStatelessWidget extends StatelessWidget {
  const _MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('弹出 SnackBar'),
      onPressed: () {
        /// 显示底部弹出条
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(                                             /// 底部弹出条
            content: const Text('content'),                     ///   内容
            duration: const Duration(milliseconds: 2000),       ///   弹出条显示后，经过此时间会自动消失
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),   ///   内边距
            margin: null,                                       ///   外边距
            width: null,                                        ///   宽度
            behavior: SnackBarBehavior.floating,                ///   floating - 不贴合屏幕边缘；fixed - 贴合屏幕边缘
            shape: RoundedRectangleBorder(                      ///   边框
              borderRadius: BorderRadius.circular(5.0),
            ),
            showCloseIcon: true,                                ///   是否显示关闭按钮
            closeIconColor: Colors.orange,                      ///   关闭按钮的颜色
            dismissDirection: DismissDirection.down,            ///   显示后，可以通过指定的势操作隐藏弹出条（down 从上到下的手势，startToEnd 从左到右的手势，等）
            onVisible: () {                                     ///   弹出条显示后触发的事件
              log("SnackBar onVisible");
            },
            action: SnackBarAction(                             ///   弹出条上显示的按钮
              label: 'action',                                  ///     按钮文字
              onPressed: () {                                   ///     按钮被点击时触发的事件
                /// 隐藏当前的底部弹出条
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                log("SnackBarAction pressed");
              },
            ),
          ),
        );
      },
    );
  }
}
