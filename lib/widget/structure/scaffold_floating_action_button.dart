/*
 * FloatingActionButton - 悬浮按钮（一般在 Scaffold 中使用）
 */

import 'package:flutter/material.dart';

class ScaffoldFloatingActionButtonDemo extends StatefulWidget {
  const ScaffoldFloatingActionButtonDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldFloatingActionButtonDemoState createState() => _ScaffoldFloatingActionButtonDemoState();
}

class _ScaffoldFloatingActionButtonDemoState extends State<ScaffoldFloatingActionButtonDemo> {

  var _floatingActionButtonLocation = FloatingActionButtonLocation.miniStartFloat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        itemExtent: 200,
        children: <Widget>[
          Container(color: Colors.red[100],),
          Container(color: Colors.red[200],),
          Container(color: Colors.red[300],),
          Container(color: Colors.red[400],),
          Container(color: Colors.red[500],),
          Container(color: Colors.red[600],),
          Container(color: Colors.red[700],),
          Container(color: Colors.red[800],),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        items: const [
          BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'share',
            icon: Icon(Icons.share),
          ),
        ],
      ),

      /// 按钮的位置
      floatingActionButtonLocation: _floatingActionButtonLocation,
      /// 按钮的动画，设置为 null 的话则默认使用 FloatingActionButtonAnimator.scaling 动画
      /// 如果需要自定义动画的话，则继承 FloatingActionButtonAnimator 后写自定义的逻辑即可
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: const Text('show'),      /// 按钮上显示的内容
            tooltip: "tooltip",             /// 长按提示
            foregroundColor: Colors.white,  /// 前景色
            backgroundColor: Colors.orange, /// 背景色
            splashColor: Colors.blue,       /// 点击效果的颜色
            mini: false,                    /// 是否是小按钮
            elevation: 5,                   /// 按钮阴影
            highlightElevation: 20,         /// 点击后的按钮阴影
            shape: null,                    /// 边框
            onPressed: () {                 /// 单击事件
              setState(() {
                switch (_floatingActionButtonLocation) {
                  case FloatingActionButtonLocation.startTop:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniStartTop;
                    break;
                  case FloatingActionButtonLocation.miniStartTop:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.centerTop;
                    break;
                  case FloatingActionButtonLocation.centerTop:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniCenterTop;
                    break;
                  case FloatingActionButtonLocation.miniCenterTop:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.endTop;
                    break;
                  case FloatingActionButtonLocation.endTop:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniEndTop;
                    break;
                  case FloatingActionButtonLocation.miniEndTop:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.startFloat;
                    break;
                  case FloatingActionButtonLocation.startFloat:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniStartFloat;
                    break;
                  case FloatingActionButtonLocation.miniStartFloat:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.centerFloat;
                    break;
                  case FloatingActionButtonLocation.centerFloat:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniCenterFloat;
                    break;
                  case FloatingActionButtonLocation.miniCenterFloat:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.endFloat;
                    break;
                  case FloatingActionButtonLocation.endFloat:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniEndFloat;
                    break;
                  case FloatingActionButtonLocation.miniEndFloat:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.startDocked;
                    break;
                  case FloatingActionButtonLocation.startDocked:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniStartDocked;
                    break;
                  case FloatingActionButtonLocation.miniStartDocked:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
                    break;
                  case FloatingActionButtonLocation.centerDocked:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniCenterDocked;
                    break;
                  case FloatingActionButtonLocation.miniCenterDocked:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.endDocked;
                    break;
                  case FloatingActionButtonLocation.endDocked:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.miniEndDocked;
                    break;
                  case FloatingActionButtonLocation.miniEndDocked:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.endContained;
                    break;
                  case FloatingActionButtonLocation.endContained:
                    _floatingActionButtonLocation = FloatingActionButtonLocation.startTop;
                    break;
                  default:
                }
              });
            },
          );
        },
      ),
    );
  }
}