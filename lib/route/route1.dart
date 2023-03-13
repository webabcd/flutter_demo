import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'package:flutter_demo/route/route2.dart';

class Route1Demo extends StatefulWidget {
  const Route1Demo({super.key});

  @override
  _Route1DemoState createState() => _Route1DemoState();

}


class _Route1DemoState extends State<Route1Demo> {

  String message = "";

  @override
  void initState() {
    message = "time: ${DateTime.now().toString()}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('route 1'),
      ),
      body: Container(
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                /// 可以通过这个值观察一下
                /// 当导航到此页时指定的 maintainState 为 true 时，则导航到 route 2 后再关闭 route 2 你会发现 route 1 保持了之前的状态
                /// 当导航到此页时指定的 maintainState 为 false 时，则导航到 route 2 后再关闭 route 2 你会发现 route 1 没有保持了之前的状态
                MyText(message),
                MyButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const Route2Demo()),
                    );
                  },
                  child: const Text('导航到 route 2'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 当前页面出栈
          return Navigator.of(context).pop();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}