/*
 * MaterialBanner - 顶部弹出条
 *
 * 注：需要使用 Scaffold 实现此功能
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class MaterialBannerDemo extends StatefulWidget {
  const MaterialBannerDemo({Key? key}) : super(key: key);

  @override
  _MaterialBannerDemoState createState() => _MaterialBannerDemoState();
}

class _MaterialBannerDemoState extends State<MaterialBannerDemo> {

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
      child: const Text('弹出 MaterialBanner'),
      onPressed: () {
        /// 显示顶部弹出条
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(                                     /// 顶部弹出条
            leading: Icon(Icons.home),                        ///   左侧图标
            content: const Text('content'),                   ///   内容
            contentTextStyle: TextStyle(color: Colors.white), ///   内容的文本样式
            backgroundColor: Colors.orange,                   ///   背景
            forceActionsBelow: false,                         ///   是否新起一行显示按钮（仅一个按钮时有效，多个按钮时会自动强制新起一行）
            actions: <Widget>[                                ///   按钮集合
              TextButton(
                onPressed: () {
                  /// 隐藏当前的顶部弹出条
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: Text('dismiss'),
              ),
            ],
            onVisible: () {                                   ///   弹出条显示后触发的事件
              log("MaterialBanner onVisible");
            },
          ),
        );
      },
    );
  }
}
