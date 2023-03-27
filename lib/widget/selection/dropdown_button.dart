/*
 * DropdownButton - 下拉框
 *
 * 注：DropdownButton 必须放到一个 Material 组件内，否则会报错
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class DropdownButtonDemo extends StatefulWidget {
  const DropdownButtonDemo({Key? key}) : super(key: key);

  @override
  _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends State<DropdownButtonDemo> {

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// DropdownButton<T> 中的 T 用于指定 DropdownMenuItem 中的 value 的类型
          DropdownButton<String>(
            icon: const Icon(Icons.arrow_right),                  /// 右侧图标
            iconSize: 40,                                         /// 图标大小
            iconEnabledColor: Colors.green,                       /// 图标颜色
            hint: const Text('请选择'),                            /// 下拉框上的提示文字
            isExpanded: true,                                     /// 宽度是否拉伸到与父容器一样（默认为 false，即下拉框本身的宽度会适应其下拉菜单中内容的宽度）
            isDense: true,                                        /// 是否需要减少高度（默认为 false，即下拉框本身的高度与 itemHeight 一样）
            underline: Container(height: 1, color: Colors.green), /// 下面的横线
            itemHeight: 60,                                       /// 下拉菜单的每一项的宽度
            menuMaxHeight: 160,                                   /// 下拉菜单的整体宽度，显示不下可滚动
            borderRadius: BorderRadius.circular(10),              /// 边框圆角的半径
            items: const [                                        /// 下拉菜单中选项的集合
              /// value - 选项被点击后，此值会传递给 DropdownButton 的 onChanged()
              /// onTap - 选项被点击后，先走到这里，然后走到 DropdownButton 的 onSelected()
              DropdownMenuItem(child: Text('item1'), value: "a", onTap: null,),
              DropdownMenuItem(child: Text('item2'), value: "b", onTap: null,),
              DropdownMenuItem(child: Text('item3'), value: "c", onTap: null,),
            ],
            selectedItemBuilder: (context) {                      /// 当某个下拉选项被选中后，此处与其位置对应的内容就会显示到下拉框上
              return const [
                Center(child: Text('选择了 item1',style: TextStyle(color: Colors.blue),),),
                Center(child: Text('选择了 item2',style: TextStyle(color: Colors.blue),),),
                Center(child: Text('选择了 item3',style: TextStyle(color: Colors.blue),),),
              ];
            },
            onChanged: (value) {                                  /// 当用户从下拉菜单中选中某项后触发的事件
              setState(() {
                _selectedValue = value;
              });
            },
            value: _selectedValue,                                /// 当前选中的选项的值
            onTap: () => log("onTap"),                            /// 点击下拉框时触发的事件
          ),

          DropdownButton<String>(
            disabledHint: const Text('请选择'),                    /// 右侧图标（下拉框不可用时）
            iconDisabledColor: Colors.red,                        /// 下拉框上的提示文字（下拉框不可用时）
            isExpanded: false,
            items: const [
              DropdownMenuItem(child: Text('item1'), value: "a"),
              DropdownMenuItem(child: Text('item2'), value: "b"),
              DropdownMenuItem(child: Text('item3'), value: "c"),
            ],
            onChanged: null,                                      /// onChanged 设置为 null 则说明 DropdownButton 为不可用状态
          ),
        ],
      ),
    );
  }
}