import 'package:flutter/material.dart';

class Route3Demo extends StatelessWidget {
  const Route3Demo({super.key});

  @override
  Widget build(BuildContext context) {

    String v1 = "";
    String v2 = "";

    /// 获取打开此页面的页面传递过来的参数
    dynamic obj = ModalRoute.of(context)?.settings.arguments;
    if (obj != null) {
      v1 = obj["k1"];
      v2 = obj["k2"];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('route 3'),
      ),
      body: Center(
        child: Text('我是 route 3\nk1=$v1\nk2=$v2',),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 当前页面出栈
          return Navigator.of(context).pop("xxx"); /// pop("xxx") 中的数据会传递给打开此页面的页面
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}