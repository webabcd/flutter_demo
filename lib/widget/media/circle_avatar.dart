/*
 * CircleAvatar - 圆形头像
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class CircleAvatarDemo extends StatefulWidget {
  const CircleAvatarDemo({Key? key}) : super(key: key);

  @override
  _CircleAvatarDemoState createState() => _CircleAvatarDemoState();
}

class _CircleAvatarDemoState extends State<CircleAvatarDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Wrap(
        children: [
          /// 圆形头像（由一个纯色背景和一个子组件构成）
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: MyText('W'),
          ),

          /// 圆形头像（由一个图片背景和一个子组件构成）
          CircleAvatar(
            backgroundImage: AssetImage('assets/son.jpg'),
            onBackgroundImageError: (exception, stackTrace) {
              log("图片加载失败");
            },
            child: MyText('W'),
          ),

          /// 通过 radius 设置圆形头像的半径（类似的参数还有 minRadius 和 maxRadius）
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: MyText('W'),
            radius: 100,
          ),
        ],
      ),
    );
  }
}