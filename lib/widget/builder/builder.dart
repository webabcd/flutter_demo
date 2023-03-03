/*
 * Builder - 在指定的位置构造上下文
 */

import 'package:flutter/material.dart';

class BuilderDemo extends StatefulWidget {
  const BuilderDemo({Key? key}) : super(key: key);

  @override
  _BuilderDemoState createState() => _BuilderDemoState();
}

class _BuilderDemoState extends State<BuilderDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 这里通过 Scaffold.of(context) 是拿不到 Scaffold 对象的
          /// 因为这个 context 是在 Scaffold 之上定义的，也就是说有 context 的时候还没有 Scaffold，所以通过这个 context 是拿不到 Scaffold 的
          // Text("hasAppBar: ${Scaffold.of(context).hasAppBar}"),
          Theme(
            data: ThemeData(
              colorScheme:Theme.of(context).colorScheme.copyWith(background: Colors.orange),
            ),
            /// 这里通过 Builder 获取上下文，这个上下文是由框架传递过来的
            ///   此 context 可以关联到当前之上的 context，所以可以通过 Scaffold.of(context) 拿到上级定义的 Scaffold
            ///   此 context 可以关联到当前同级的 context，所以可以通过 Theme.of(context) 拿到同级定义的 ThemeData
            child:Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                  child: Text("hasAppBar: ${Scaffold.of(context).hasAppBar}"),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}