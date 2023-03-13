/*
 * WillPopScope - 出栈拦截
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class WillPopScopeDemo extends StatefulWidget {
  const WillPopScopeDemo({Key? key}) : super(key: key);

  @override
  _WillPopScopeDemoState createState() => _WillPopScopeDemoState();
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      /// 通过 WillPopScope 拦截当前页面的 pop
      body: WillPopScope(
        child: Center(
          child: MyButton(
            onPressed: () {
              /// 注意：
              /// 如果通过 Navigator.of(context).pop() 出栈，则走不到 WillPopScope 的 onWillPop
              /// 要想走到 WillPopScope 的 onWillPop 需要使用 Navigator.of(context).maybePop()
              Navigator.of(context).maybePop();
            },
            child: const Text('关闭'),
          ),
        ),
        /// 当前页面将要 pop 时触发的事件
        onWillPop: () async {
          var result = await _showDialog(context);
          /// return true; 代表允许出栈
          /// return false; 代表禁止出栈
          return result ?? false;
        },
      ),
    );
  }

  Future<bool?> _showDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('是否退出？'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('是'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('否'),
          ),
        ],
      ),
    );
  }
}