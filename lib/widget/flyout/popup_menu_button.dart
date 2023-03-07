/*
 * PopupMenuButton - 弹出菜单按钮
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  const PopupMenuButtonDemo({Key? key}) : super(key: key);

  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        actions: [_popupMenuButton(context)],
      ),
    );
  }

  PopupMenuButton _popupMenuButton(BuildContext context) {
    /// PopupMenuButton 是一个可以弹出菜单的按钮
    return PopupMenuButton(
      /// 构造菜单中的选项集合
      itemBuilder: (BuildContext context){
        return [
          /// PopupMenuItem 用于定义菜单中的每一个选项，除了下面写的示例外还有一些样式相关的设置，自己看文档吧
          ///   value - 选项被点击后，此值会传递给 PopupMenuButton 的 onSelected()
          ///   onTap - 选项被点击后，先走到这里，然后走到 PopupMenuButton 的 onSelected()
          PopupMenuItem(child: Text("button1"), value: "v1", onTap: null,),
          PopupMenuItem(child: Text("button2"), value: ["v2_1", "v2_2", "v2_3"], onTap: null,),
          PopupMenuItem(child: Text("button3"), value: {"v":"v3"}, onTap: null,),
        ];
      },
      position: PopupMenuPosition.over,           /// 菜单相对于按钮的显示位置（over - 菜单覆盖在按钮上面；under - 菜单显示在按钮下面）
      offset: Offset.zero,                        /// 菜单显示位置的偏移量
      onOpened: () {                              /// 菜单被打开时触发的事件
        log("onOpened");
      },
      onSelected: (dynamic object) {              /// 菜单选项被点击时触发的事件（此处的 dynamic 参数就是定义 PopupMenuItem 时的 value 值）
        if (object is String) {
          log("onSelected: " + object);
        } else if (object is List) {
          log("onSelected: " + object.join(","));
        } else if (object is Map) {
          log("onSelected: " + object["v"]);
        }
      },
      onCanceled: () {                            /// 点击空白区域隐藏菜单后触发的事件
        log("onCanceled");
      },
      color: Colors.orange,                       /// 按钮的颜色
      icon: Icon(Icons.add),                      /// 按钮的图标（如果需要自定义按钮，就设置 child 属性）
      shape: RoundedRectangleBorder(              /// 菜单的边框
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 2,
          color: Colors.red,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}