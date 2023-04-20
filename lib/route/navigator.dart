/*
 * 路由和导航的基础
 *
 * 导航的管理是通过维护一个路由栈实现的，路由入栈（push）就是打开一个页面，路由出栈（pop）就是关闭一个页面
 * 所谓的路由（Route）可以将其理解为一个页面
 *
 * Navigator - 通过路由栈管理路由集合，其提供了很多方法来管理路由栈，比如可以使用 push 或 pop 做入栈或出栈
 * MaterialPageRoute - 用于定义路由的与导航相关的行为，以及路由之间切换时的动画等（如果需要类似 ios 的效果就用 CupertinoPageRoute）
 *   MaterialApp 的 pushNamed() 走的是 MaterialPageRoute
 *   CupertinoApp 的 pushNamed() 走的是 CupertinoPageRoute
 * MaterialApp - 需要在 MaterialApp 内做路由管理，一个程序只有一个顶级 MaterialApp（可以嵌套），所有路由都在其内管理
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/route/route1.dart';
import 'package:flutter_demo/helper.dart';
import 'package:flutter_demo/route/route2.dart';
import 'package:flutter_demo/route/route3.dart';

class NavigatorDemo extends StatelessWidget {
  const NavigatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyNavigatorDemo(title: '主页'),

      /// 命名路由就是给路由起一个名字，然后通过这个名字打开对应的路由
      /// 要想使用命名路由，就先要注册路由表（注册后则可以通过 Navigator 的 pushNamed() 导航到指定的页面）
      /// 给路由起名的时候，有个规范，就是 / 代表主页，主页下的某页命名为 /xxx，多级页面的话命名为 /xxx/yyy/zzz
      /// 一个 MaterialApp 中注册的路由表，在这个 MaterialApp 内的所有路由均可使用
      routes:{
        "/route3":(context) => const Route3Demo(),
      },

      /// 对于没有在路由表中注册的路由，如果你通过 Navigator 的 pushNamed() 导航的话，就会走到这里
      onGenerateRoute: (settings) {
        /// 获取路由的名字，以及传递的参数
        log("name: ${settings.name}, arguments: ${settings.arguments}");
        /// 按照你的要求导航到指定的页面
        return MaterialPageRoute(
          builder: (context) {
            return const Route2Demo();
          },
        );
      },

      /// 先走 onGenerateRoute，如果在 onGenerateRoute 中 return null 了， 则会走到这里
      onUnknownRoute: (settings) {
        return null;
      }
    );
  }
}

class MyNavigatorDemo extends StatefulWidget {
  const MyNavigatorDemo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyNavigatorDemoState createState() => _MyNavigatorDemoState();
}

class _MyNavigatorDemoState extends State<MyNavigatorDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Wrap(
        spacing: 10,
        children: [
          MyButton(
            onPressed: () {
              /// 通过 Navigator 和 MaterialPageRoute 导航到指定的页面
              /// 可以 Navigator.push(context, ...) 也可以 Navigator.of(context).push(...)
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Route1Demo()),
              );
            },
            child: const Text('导航到 route 1'),
          ),
          MyButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  /// 是否采用全屏模态框的方式显示指定的页面（默认值为 false）
                  ///   在 ios 中此值为 true 则对应 present/dismiss，此值为 false 则对应 push/pop
                  fullscreenDialog: true,
                  builder: (context) => const Route1Demo()),
              );
            },
            child: const Text('导航到 route 1（fullscreenDialog 为 true）'),
          ),
          MyButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  /// 是否需要在指定的页面中维护状态（默认值为 true）
                  /// 比如：如果指定的页面 a 入栈之后，又有一个页面 b 入栈，则此值用于指定页面 a 是否需要保持状态
                  ///   如果此值为 true 则页面 b 出栈后，你会发现 a 保持了之前的状态，即 a 不会再走 initState()
                  ///   如果此值为 false 则页面 b 出栈后，你会发现 a 不会保持之前的状态，即 a 会再走 initState()
                  maintainState : false,
                  builder: (context) => const Route1Demo()),
              );
            },
            child: const Text('导航到 route 1（maintainState 为 false）'),
          ),
          MyButton(
            onPressed: () {
              /// 通过 Navigator 的 pushNamed() 方法导航到指定的命名路由，并传递参数，然后当指定的名命名路由关闭后接收其发出的数据
              /// 注：需要先在 MaterialApp 的 routes 中注册路由表
              Navigator.of(context).pushNamed('/route3', arguments: {"k1":'v1', "k2":"v2"})
                  .then((value) => log("收到 /route3 的数据：$value"));
            },
            child: const Text('导航到 route 3（通过命名路由的方式，并传递参数和接收数据）'),
          ),
          MyButton(
            onPressed: () {
              /// 如果在路由表中没有注册指定的路由，那么你通过 pushNamed() 导航时，则会走到 onGenerateRoute
              Navigator.of(context).pushNamed('/xxx', arguments: {"k1":'v1', "k2":"v2"});
            },
            child: const Text('通过命名路由的方式导航到未在路由表中注册的路由'),
          ),
        ],
      ),
    );
  }
}