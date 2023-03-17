import 'package:flutter/material.dart';

import '../helper.dart';

class RouteCDemo extends StatelessWidget {
  const RouteCDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('route c'),
      ),
      body: Wrap(
        spacing: 10,
        children: [
          MyButton(
            onPressed: () {
              /// 返回到顶级 MaterialApp 的根路由（即从路由堆栈中做 pop 直到显示根路由为止）
              Navigator.of(context, rootNavigator:true).pop();
            },
            child: const Text('返回到根路由'),
          ),
          MyButton(
            onPressed: () {
              /// pushReplacementNamed - 用指定的路由替换当前栈顶的路由（效果和 popAndPushNamed 差不多）
              Navigator.of(context).pushReplacementNamed('/route_d');
            },
            child: const Text('导航到 route d（pushReplacementNamed）'),
          ),
          MyButton(
            onPressed: () {
              /// popAndPushNamed - 将当前栈顶的路由 pop 掉，然后 push 指定的路由（效果和 pushReplacementNamed 差不多）
              Navigator.of(context).popAndPushNamed('/route_d');
            },
            child: const Text('导航到 route d（popAndPushNamed）'),
          ),
          MyButton(
            onPressed: () {
              /// popUntil - 在路由堆栈中做 pop 直到显示指定的路由
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
            child: const Text('在路由堆栈中做 pop 直到显示指定的路由'),
          ),
          MyButton(
            onPressed: () {
              /// push 到指定的路由，并在其下做 pop 直到指定的路由
              /// 导航至 route_d，然后 route_d 下面的路由做 pop 直到 route_a，也就是说路由栈中 route_d 的下面是 route_a
              Navigator.of(context).pushNamedAndRemoveUntil('/route_d', ModalRoute.withName('/route_a'));
            },
            child: const Text('在路由堆栈中做 pop 直到显示指定的路由，然后 push 指定的路由'),
          ),
        ],
      ),
    );
  }
}