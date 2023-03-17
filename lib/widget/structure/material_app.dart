/*
 * MaterialApp - 符合 Material Design 的根组件
 *
 * 一些概念的说明
 * 1、Material Design 是 Google 的设计规范
 * 2、iOS Human Interface Guidelines 是 Apple 针对 iOS 的设计规范
 * 3、Material 组件就是符合 Material Design 的一套组件，比如 Scaffold, TextButton 等
 * 4、非 Material 组件就是一般的组件，比如 Center, Text 等
 *
 * 一些 Widget 的说明
 * 1、MaterialApp 是一个符合 Material Design 的根组件
 * 2、CupertinoApp 是一个符合 iOS 设计风格的根组件（用法和 MaterialApp 差不多）
 * 3、WidgetsApp 用于为 MaterialApp 和 CupertinoApp 实现一些基本功能，一般不会直接使用这个
 *
 *
 * 注：
 * 关于 MaterialApp 的主题请参见 lib/ui/theme.dart, lib/ui/theme2.dart
 * 关于 MaterialApp 的路由请参见 lib/route/
 * 关于 MaterialApp 的国际化请参见 lib/localization/
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class MaterialAppDemo extends StatefulWidget {
  const MaterialAppDemo({Key? key}) : super(key: key);

  @override
  _MaterialAppDemoState createState() => _MaterialAppDemoState();
}

class _MaterialAppDemoState extends State<MaterialAppDemo> {

  bool _debugShowMaterialGrid = false;
  bool _showPerformanceOverlay = false;
  bool _showSemanticsDebugger = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      /// 应用切换时，在应用列表中此 app 显示的标题（优先使用 onGenerateTitle，如果没有定义 onGenerateTitle 则使用 title）
      title: 'the title',
      /// 应用切换时，在应用列表中此 app 显示的标题（优先使用 onGenerateTitle，如果没有定义 onGenerateTitle 则使用 title）
      onGenerateTitle: (context) {
        return "my title";
      },

      /// 右上角是否显示 debug 图标
      debugShowCheckedModeBanner: true,
      /// 是否显示基线网格
      debugShowMaterialGrid: _debugShowMaterialGrid,
      /// 是否显示性能监控浮层
      showPerformanceOverlay: _showPerformanceOverlay,
      /// 是否显示每个组件的占位大小等信息
      showSemanticsDebugger: _showSemanticsDebugger,

      /// 主页面
      home: Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        backgroundColor: Colors.orange,
        body: Center(
          child: MyText('hello webabcd'),
        ),
        persistentFooterButtons: [
          MyButton(
            onPressed: () {
              setState(() {
                _debugShowMaterialGrid = !_debugShowMaterialGrid;
              });
            },
            child: const Text("基线网格"),
          ),
          MyButton(
            onPressed: () {
              setState(() {
                _showPerformanceOverlay = !_showPerformanceOverlay;
              });
            },
            child: const Text("性能监控"),
          ),
          MyButton(
            onPressed: () {
              setState(() {
                _showSemanticsDebugger = !_showSemanticsDebugger;
              });
            },
            child: const Text("占位大小"),
          ),
        ],
      ),
    );
  }
}