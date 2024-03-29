/*
 * 主题（基础）
 */

import 'package:flutter/material.dart';

class ThemeDemo extends StatefulWidget {
  const ThemeDemo({Key? key}) : super(key: key);

  @override
  _ThemeDemoState createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 通过 MaterialApp 的 theme 定义整个应用程序的主题
      /// ThemeData 就是自定义主题对象
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        /// 通过 copyWith() 可以在继承指定的主题的基础上，自定义你需要修改的样式
        colorScheme: Theme.of(context).colorScheme.copyWith(background: Colors.red),
      ),
      home: const _MyHomePage(
        title: "title",
      ),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  const _MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text('Text'),
          ),

          Container(
            width: double.infinity,
            /// 通过 Theme.of() 引用主题
            color: Theme.of(context).colorScheme.background,
            child: Text('Text', style: Theme.of(context).textTheme.displayLarge),
          ),

          /// 如果只想在某一个部分使用自定义主题，则可以使用名为 Theme 的 Widget
          Theme(
            /// 指定一个 ThemeData 类型的对象
            data: Theme.of(context).copyWith(
              textTheme: const TextTheme(
                displayLarge: TextStyle(fontSize: 72.0, color: Colors.yellow),
              ),
            ),
            /// 注：此处你无法直接使用 Theme 的 data 中定义的样式，需要借助 Builder
            child:Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  /// 如果不用 Builder 的话，这个 context 就是 _MyHomePage 的 context，那个时候还没有新定义的主题
                  child: Text('Text', style: Theme.of(context).textTheme.displayLarge),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.red),
            ),
            /// FloatingActionButton 的 Icon 的颜色用的是主题 colorScheme 中的 secondary
            /// 可以通过修改主题来修改 FloatingActionButton 的 Icon 的颜色
            /// 因为是 FloatingActionButton 内部 build 时使用的，所以不需要借助 Builder
            /// 很多复杂控件中的一些组件的样式是无法直接修改的，需要通过这种方式修改，具体的使用的是什么主题，可以看源码
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}