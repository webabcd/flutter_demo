/*
 * AlertDialog - 弹出框（包括标题，内容，多个按钮）
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {

  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              /// 显示弹出框，并获取弹出框的返回值
              var result = await _showDialog(context);
              setState(() {
                _result = 'result: $result';
              });
            },
            child: const Text('弹出 AlertDialog'),
          ),
          MyText(_result),
        ],
      ),
    );
  }

  Future<String?> _showDialog(BuildContext context) {
    /// showDialog<T> 显示弹出框，其中的 T 是弹出框的返回结果的类型
    return showDialog<String>(
      context: context,
      barrierColor: Colors.red,                           /// 显示弹出框后，弹出框和主界面之间的遮罩层的颜色
      barrierDismissible: false,                          /// 点击空白区域后是否要自动隐藏弹出框
      builder: (BuildContext context) => AlertDialog(     /// 弹出框的类型为 AlertDialog（除了以下演示的外，还可以定义图标，标题样式，内容样式，按钮间距等，自己看文档吧）
        title: const Text('title'),                       ///   标题
        content: const Text('content\ncontent'),          ///   内容
        backgroundColor: Colors.white,                    ///   背景色
        insetPadding: EdgeInsets.zero,                    ///   弹出框的位置
        actions: <Widget>[                                ///   按钮集合
          TextButton(
            /// 通过 Navigator.pop() 隐藏当前弹出框，第 2 个参数为弹出框的返回值
            onPressed: () => Navigator.pop(context, 'button1 pressed'),
            child: const Text('button1'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'button2 pressed'),
            child: const Text('button2'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'button3 pressed'),
            child: const Text('button3'),
          ),
        ],
      ),
    );
  }
}