/*
 * Card - 阴影边框
 *
 * Card 就是一个有阴影和边框的容器
 */

import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            /// 背景色
            color: Colors.white,
            /// 阴影色
            shadowColor: Colors.red,
            /// 阴影高度
            elevation: 20,
            /// 边框
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.blue
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {

              },
              child: const SizedBox(
                width: 300,
                height: 100,
                child: Center(child: Text('Card')),
              ),
            ),
          ),

          /// 一般用 Card 包裹一套相关元素
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text('title'),
                  subtitle: Text('subtitle'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('button1'),
                      onPressed: () { },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('button2'),
                      onPressed: () { },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}