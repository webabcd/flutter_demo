/*
 * FloatingActionButton - 悬浮按钮（一般在 Scaffold 中使用）
 *
 * 结合 BottomAppBar 可实现底部导航栏与 Docked 的 floatingActionButton 之间的空隙效果
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ScaffoldFloatingActionButtonDemo extends StatefulWidget {
  const ScaffoldFloatingActionButtonDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldFloatingActionButtonDemoState createState() => _ScaffoldFloatingActionButtonDemoState();
}

class _ScaffoldFloatingActionButtonDemoState extends State<ScaffoldFloatingActionButtonDemo> {

  /// 当前的 floatingActionButtonLocation
  var _floatingActionButtonLocation = FloatingActionButtonLocation.miniStartFloat;
  /// 当前的 FloatingActionButton 的种类
  var _floatingActionButtonType = 0;

  /// 修改 floatingActionButtonLocation
  void _changeFloatingActionButtonLocation() {
    setState(() {
      switch (_floatingActionButtonLocation) {
        case FloatingActionButtonLocation.startTop:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniStartTop;
          break;
        case FloatingActionButtonLocation.miniStartTop:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.centerTop;
          break;
        case FloatingActionButtonLocation.centerTop:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniCenterTop;
          break;
        case FloatingActionButtonLocation.miniCenterTop:
          _floatingActionButtonLocation = FloatingActionButtonLocation.endTop;
          break;
        case FloatingActionButtonLocation.endTop:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniEndTop;
          break;
        case FloatingActionButtonLocation.miniEndTop:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.startFloat;
          break;
        case FloatingActionButtonLocation.startFloat:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniStartFloat;
          break;
        case FloatingActionButtonLocation.miniStartFloat:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.centerFloat;
          break;
        case FloatingActionButtonLocation.centerFloat:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniCenterFloat;
          break;
        case FloatingActionButtonLocation.miniCenterFloat:
          _floatingActionButtonLocation = FloatingActionButtonLocation.endFloat;
          break;
        case FloatingActionButtonLocation.endFloat:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniEndFloat;
          break;
        case FloatingActionButtonLocation.miniEndFloat:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.startDocked;
          break;
        case FloatingActionButtonLocation.startDocked:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniStartDocked;
          break;
        case FloatingActionButtonLocation.miniStartDocked:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.centerDocked;
          break;
        case FloatingActionButtonLocation.centerDocked:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniCenterDocked;
          break;
        case FloatingActionButtonLocation.miniCenterDocked:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.endDocked;
          break;
        case FloatingActionButtonLocation.endDocked:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.miniEndDocked;
          break;
        case FloatingActionButtonLocation.miniEndDocked:
          _floatingActionButtonLocation =
              FloatingActionButtonLocation.endContained;
          break;
        case FloatingActionButtonLocation.endContained:
          _floatingActionButtonLocation = FloatingActionButtonLocation.startTop;
          break;
        default:
      }
    });
  }

  /// 第 1 种 FloatingActionButton（圆形）
  FloatingActionButton _buildFloatingActionButton1() {
    return FloatingActionButton(
      child: const Text('种类1'),      /// 按钮上显示的内容
      tooltip: "tooltip",             /// 长按提示或鼠标悬浮提示
      foregroundColor: Colors.white,  /// 前景色
      backgroundColor: Colors.orange, /// 背景色
      splashColor: Colors.blue,       /// 点击效果的颜色
      mini: false,                    /// 是否是小按钮
      elevation: 5,                   /// 按钮阴影
      highlightElevation: 20,         /// 点击后的按钮阴影
      shape: null,                    /// 边框
      onPressed: () {                 /// 单击事件
      },
    );
  }

  /// 第 2 种 FloatingActionButton（形状自适应）
  FloatingActionButton _buildFloatingActionButton2() {
    return const FloatingActionButton.extended(
      onPressed: null,
      /// 图标
      icon: Icon(Icons.ac_unit),
      /// 文字
      label: Text("种类2"),
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              onPressed: () {
                _changeFloatingActionButtonLocation();
              },
              child: const Text("修改 floatingActionButtonLocation"),
            ),
            MyButton(
              onPressed: () {
                setState(() {
                  if (_floatingActionButtonType == 0) {
                    _floatingActionButtonType = 1;
                  } else {
                    _floatingActionButtonType = 0;
                  }
                });
              },
              child: const Text("更换 FloatingActionButton 的种类"),
            ),
            MyTextSmall("$_floatingActionButtonLocation"),
          ],
        ),
      ),

      /// 这里使用的是 BottomAppBar，而不是 BottomNavigationBar
      /// BottomAppBar 允许底部导航栏与 Docked 的 floatingActionButton 之间有一个空隙效果
      bottomNavigationBar: BottomAppBar(
        /// 底部导航栏的背景颜色
        color: Colors.blue,
        /// 设置为 CircularNotchedRectangle() 则支持空隙效果
        shape: const CircularNotchedRectangle(),
        /// 空隙的大小
        notchMargin: 5,
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: const MyTextSmall("tab1"),
                  alignment: Alignment.center,
                ),
              ),
              Expanded(
                child: Container(
                  child: const MyTextSmall("tab2"),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),

      /// 按钮的位置
      floatingActionButtonLocation: _floatingActionButtonLocation,
      /// 按钮的动画，设置为 null 的话则默认使用 FloatingActionButtonAnimator.scaling 动画
      /// 如果需要自定义动画的话，则继承 FloatingActionButtonAnimator 后写自定义的逻辑即可
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          if (_floatingActionButtonType == 0) {
            return _buildFloatingActionButton1();
          }
          return _buildFloatingActionButton2();
        },
      ),
    );
  }
}