/*
 *
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({Key? key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 2000),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin:const EdgeInsets.only(bottom: 30, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  CircleAvatar _circleAvatar(){
    return CircleAvatar(
      child: Container(
        height: 30,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text("Avatar child text"),
      ), // avatar 子控件
      backgroundColor: Colors.red, // avatar 背景色
      foregroundColor: Colors.white, // avatar 中 text 颜色
      // avatra 背景图
      backgroundImage: NetworkImage("http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg"),
      // 背景图加载失败回调
      onBackgroundImageError: (error, trace){
        print("onBackgroundImageError");
      },
      // radius: 200, // avatar 半径 (和 maxRadius 以及 minRadius 不能同时存在)
      maxRadius: 100, // avatar 最小半径 (和 radius 不能同时存在)
      minRadius: 80, // avatar 最大半径 (和 radius 不能同时存在)
    );
  }

  Chip _chipForSimpleText(){
    return Chip(
        label: Text("Simple Text Chip")
    );
  }

  Chip _chipForSimple(){
    return Chip(
      label: Text("Simple Chip"),
      avatar: CircleAvatar(backgroundColor: Colors.red,),
    );
  }

  Chip _chipForNormal(){
    return Chip(
      label: Text("Normal Chip"),
      avatar: CircleAvatar(backgroundColor: Colors.red,),
      deleteIcon: Icon(Icons.ac_unit),
      onDeleted: (){},
    );
  }

  Chip _chip(){
    return Chip(
      avatar: _circleAvatar(), // 左侧图标组件
      label: Text("text"), // 文本 Widget
      labelStyle: TextStyle(color: Colors.red, fontSize: 30), // 文本样式，TextStyle
      labelPadding: EdgeInsets.fromLTRB(15, 50, 0, 50), // 文本外边距 Padding

      deleteIcon: Icon(Icons.ac_unit), // 右侧删除按钮 Widget
      deleteButtonTooltipMessage: "deleteButtonTooltipMessage", // 长按删除按钮的提示语
      deleteIconColor: Colors.red, // 删除按钮颜色
      // 删除按钮点击事件
      onDeleted: (){
        print("onDeleted");
      },
      // Chip 形状
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 2,
          color: Colors.red,
        ),
      ),

      // padding: EdgeInsets.zero,
    );
  }

  ListView _listView(){
    return ListView(
      children: [
        _chipForSimpleText(),
        _chipForSimple(),
        _chipForNormal(),
        _chip(),
        Padding(padding: EdgeInsets.all(10)),

        Padding(padding: EdgeInsets.all(10)),
        _choiceChip(),
      ],
    );
  }

  bool _filterChipSeleted = false;

  FilterChip _filterChip(){
    return FilterChip(
      avatar: _circleAvatar(), // 左侧图标组件
      label: Text("text"), // 文本 Widget
      labelStyle: TextStyle(color: Colors.red, fontSize: 30), // 文本样式，TextStyle
      labelPadding: EdgeInsets.fromLTRB(15, 50, 0, 50), // 文本外边距 Padding

      selected: _filterChipSeleted, // 是否选中
      selectedColor: Colors.white, // 选中背景色
      // 点击回调
      onSelected: (value){
        _filterChipSeleted = value;
        setState(() {

        });
      },

      showCheckmark: true, // 是否显示勾选框
      checkmarkColor: Colors.yellow, // 勾选框颜色

      // Chip 形状
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 2,
          color: Colors.red,
        ),
      ),
    );
  }

  bool _choiceChipSelected = false;

  ChoiceChip _choiceChip(){
    return ChoiceChip(
      avatar: _circleAvatar(), // 左侧图标组件
      label: Text("ChoiceChip"), // 文本 Widget
      labelStyle: TextStyle(color: Colors.red, fontSize: 30), // 文本样式，TextStyle
      labelPadding: EdgeInsets.fromLTRB(15, 50, 0, 50), // 文本外边距 Padding

      selected: _choiceChipSelected, // 是否选中
      selectedColor: Colors.yellow, // 选中背景色
      // 选中点击事件
      onSelected: (value){
        print("ChoiceChip onSelected");
        _choiceChipSelected = value;
        setState(() {

        });
      },

      // Chip 形状
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 2,
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Wrap(
        spacing: 10,
        children: [
          Chip(
            label: Text('text'),
            labelStyle: TextStyle(color: Colors.white),
            avatar: Icon(Icons.star, color: Colors.yellow),
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            deleteIcon: Icon(Icons.close, color: Colors.red),
            deleteButtonTooltipMessage: "tooltip",
            onDeleted: () {
              showToast("onDeleted");
            },
            elevation: 10,
            shadowColor: Colors.black,
            side: null,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Colors.green),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          ActionChip(
            label: Text('text'),
            labelStyle: TextStyle(color: Colors.white),
            avatar: Icon(Icons.star, color: Colors.yellow),
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            onPressed: () {
              showToast("onPressed");
            },
            elevation: 10,
            shadowColor: Colors.black,
            pressElevation: 0,
          ),

          ChoiceChip(
            label: Text('text'),
            labelStyle: TextStyle(color: Colors.white),
            avatar: Icon(Icons.star, color: Colors.yellow),
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

            elevation: 10,
            shadowColor: Colors.black,
            pressElevation: 0,
            selected: true,
          ),

          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: const Text('AH'),
          ),
          _choiceChip(),
    _filterChip(),
        ],
      ),
    );
  }
}


// 还有 inputchip 没写