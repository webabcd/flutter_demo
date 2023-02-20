/*
 * Center - 居中对齐
 *
 * Center 继承自 Align，建议能用 Center 就别用 Align
 */

import 'package:flutter/material.dart';

class ScaffoldFloatingActionButtonDemo extends StatelessWidget {
  const ScaffoldFloatingActionButtonDemo({Key? key}) : super(key: key);

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
        backgroundColor: Colors.blue,           /// 背景色
        iconSize: 24,                           /// 图标大小
        unselectedItemColor: Colors.white,      /// 未选中的 item 的颜色
        unselectedFontSize: 12,                 /// 未选中的 item 的文字的大小
        unselectedLabelStyle: const TextStyle(  /// 未选中的 item 的文字的样式
            fontWeight: FontWeight.normal
        ),
        selectedItemColor: Colors.yellow,       /// 选中的 item 的颜色
        selectedFontSize: 14,                   /// 选中的 item 的文字的大小
        selectedLabelStyle: const TextStyle(    /// 选中的 item 的文字的样式
            fontWeight: FontWeight.bold
        ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Builder(                              /// 悬浮按钮
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: Text('show'),
            onPressed: () {
              Scaffold.of(context).showBottomSheet((context) {    /// 弹出 BottomSheet（下滑可消失）
                return Container(
                  height: 200,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text("close"),
                    onPressed: () {
                      /// 关闭当前的 BottomSheet
                      Navigator.of(context).pop();
                    },
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}