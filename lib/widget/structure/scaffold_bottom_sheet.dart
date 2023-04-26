/*
 * BottomSheet - 底部弹出框
 *
 * showBottomSheet() - 可以理解为在当前页面弹出底部弹出框
 * showModalBottomSheet() - 可以理解为新开页面弹出底部弹出框
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ScaffoldBottomSheetDemo extends StatefulWidget {
  const ScaffoldBottomSheetDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldBottomSheetDemoState createState() => _ScaffoldBottomSheetDemoState();
}

class _ScaffoldBottomSheetDemoState extends State<ScaffoldBottomSheetDemo> {

  /// 底部弹出框的内容
  Widget _myWidget() {
    return Container(
      height: 400,
      color: Colors.red,
      alignment: Alignment.center,
      child: TextButton(
        child: const MyText("close"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: const Align(
        alignment: Alignment.topCenter,
        child: MyText('hello webabcd'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// 用于演示 showBottomSheet()
          Builder(
            builder: (BuildContext context) {
              return FloatingActionButton(
                child: const Text('1'),
                onPressed: () {
                  /// 需要通过 Scaffold.of(context) 使用 showBottomSheet()
                  /// 这里要借助 Builder 否则 context 中没有 Scaffold
                  /// 点击返回按钮时，底部弹出框会自动隐藏
                  Scaffold.of(context).showBottomSheet(
                    (context) {
                      return _myWidget();
                    },
                    /// 底部弹出框是否支持下滑隐藏
                    enableDrag: true,
                  );
                },
              );
            },
          ),

          /// 用于演示 showModalBottomSheet()
          FloatingActionButton(
            child: const Text('2'),
            onPressed: () {
              /// 可以直接使用 showModalBottomSheet()
              /// 点击返回按钮时，底部弹出框会自动隐藏
              showModalBottomSheet(
                context: context,
                builder: (context){
                  return _myWidget();
                },
                /// 底部弹出框是否支持下滑隐藏
                enableDrag: true,
                /// 点击非底部弹出框的区域时，是否需要自动隐藏底部弹出框
                isDismissible: false,
                /// 遮罩层的颜色
                barrierColor: Colors.green.withAlpha(0x66),
              );
            },
          )
        ],
      ),
    );
  }
}