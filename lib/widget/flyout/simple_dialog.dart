/*
 * SimpleDialog - 弹出框（包括标题，多个选项）
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class SimpleDialogDemo extends StatefulWidget {
  const SimpleDialogDemo({Key? key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {

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
            child: const Text('弹出 SimpleDialog'),
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
      builder: (BuildContext context) => SimpleDialog(    /// 弹出框的类型为 SimpleDialog（除了以下演示的外，还可以定义标题样式等，自己看文档吧）
        title: const Text('title'),                       ///   标题
        backgroundColor: Colors.white,                    ///   背景色
        insetPadding: EdgeInsets.zero,                    ///   弹出框的位置
        children: <Widget>[                               ///   选项集合
          SimpleDialogOption(
            onPressed: () { Navigator.pop(context, "option1 pressed"); },
            child: const Text('option1'),
          ),
          SimpleDialogOption(
            onPressed: () { Navigator.pop(context, "option2 pressed"); },
            child: const Text('option2'),
          ),
          SimpleDialogOption(
            onPressed: () { Navigator.pop(context, "option3 pressed"); },
            child: const Text('option3'),
          ),
        ],
      ),
    );
  }
}