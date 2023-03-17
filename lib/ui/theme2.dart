/*
 * 主题（Material Design 3 规范，亮色主题，暗色主题）
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class Theme2Demo extends StatefulWidget {
  const Theme2Demo({Key? key}) : super(key: key);

  @override
  _Theme2DemoState createState() => _Theme2DemoState();
}

class _Theme2DemoState extends State<Theme2Demo> {

  var _useMaterial3 = true;
  var _themeMode = ThemeMode.system;

  void changeUseMaterial3() {
    setState(() {
      _useMaterial3 = !_useMaterial3;
    });
  }

  void changeThemeMode() {
    setState(() {
      if (_themeMode == ThemeMode.system) {
        _themeMode = ThemeMode.light;
      } else if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.system;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 亮色主题
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        /// 是否使用 Material Design 3 规范
        useMaterial3: _useMaterial3,
      ),
      /// 暗色主题
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
        /// 是否使用 Material Design 3 规范
        useMaterial3: _useMaterial3,
      ),
      /// 主题模式
      ///   ThemeMode.light - 亮色主题
      ///   ThemeMode.dark - 暗色主题
      ///   ThemeMode.system - 系统决定是亮色主题还是暗色主题
      themeMode: _themeMode,
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var parent = context.findAncestorStateOfType<_Theme2DemoState>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('ElevatedButton'),
              onPressed: () {},
            ),
            const FloatingActionButton.extended(
              onPressed: null,
              icon: Icon(Icons.add),
              label: Text("FloatingActionButton.extended"),
            ),
            MyText("useMaterial3:${parent._useMaterial3}, themeMode:${parent._themeMode}"),
          ],
        ),
      ),
      persistentFooterButtons: [
        MyButton(
          onPressed: () {
            parent.changeUseMaterial3();
          },
          child: const Text("切换 MD3 规范"),
        ),
        MyButton(
          onPressed: () {
            parent.changeThemeMode();
          },
          child: const Text("切换主题模式"),
        ),
      ],
    );
  }
}