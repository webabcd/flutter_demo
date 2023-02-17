/*
 * BottomNavigationBar - 底部导航栏（一般在 Scaffold 中使用）
 *
 * BottomNavigationBar 的 item 是由图标和文字组成的
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ScaffoldBottomNavigationBarDemo extends StatefulWidget {
  const ScaffoldBottomNavigationBarDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldBottomNavigationBarDemo createState() => _ScaffoldBottomNavigationBarDemo();
}

class _ScaffoldBottomNavigationBarDemo extends State<ScaffoldBottomNavigationBarDemo> {

  var _currentIndex = 0;
  var _type = BottomNavigationBarType.fixed;
  static const List<Widget> _widgetList = <Widget>[
    Text('page 0',),
    Text('page 1',),
    Text('page 2',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        showSelectedLabels: true,               /// item 选中时是否显示文字
        showUnselectedLabels: true,             /// item 未选中时是否显示文字
        currentIndex: _currentIndex,            /// 当前选中的 item 的索引位置
        /// 类型
        ///   BottomNavigationBarType.fixed - item 的宽度都固定不变
        ///   BottomNavigationBarType.shifting - item 被选中后位置和背景等发生变化，且伴随动画效果
        type: _type,
        items: const [                          /// item 集合
          BottomNavigationBarItem(              /// BottomNavigationBar 的 item
            label: 'home',                      ///   文字
            icon: Icon(Icons.home),             ///   图标
            backgroundColor: Colors.red,        ///   item 被选中且 type 为 BottomNavigationBarType.shifting 时的背景色
            activeIcon: Icon(Icons.done),       ///   item 被选中且 type 为 BottomNavigationBarType.shifting 时的图标
          ),
          BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(Icons.favorite),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            label: 'share',
            icon: Icon(Icons.share),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (value) {                        /// 当 item 被点击时触发的事件
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<BottomNavigationBarType>(
              value: _type,
              onChanged: (BottomNavigationBarType? value) {
                setState(() {
                  _type = value ?? BottomNavigationBarType.fixed;
                });
              },
              items: <BottomNavigationBarType>[BottomNavigationBarType.fixed, BottomNavigationBarType.shifting].map<DropdownMenuItem<BottomNavigationBarType>>((BottomNavigationBarType value) {
                return DropdownMenuItem<BottomNavigationBarType>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            _widgetList.elementAt(_currentIndex),
          ],
        ),
      ),
      backgroundColor: Colors.orange,
    );
  }
}