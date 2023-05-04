/*
 * shared_preferences - 用于操作 android 的 SharedPreferences, ios 的 NSUserDefaults, web 的 LocalStorage
 *
 * 在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dev_dependencies:
 *   flutter_test:
 *     sdk: flutter
 *   shared_preferences : ^2.1.0
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {

  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                /// 写数据的示例
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                /// 写入指定的数据
                await prefs.setInt('timestamp', currentTimestamp());
                await prefs.setBool('repeat', true);
                await prefs.setDouble('decimal', 1.5);
                await prefs.setString('action', 'Start');
                await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
              },
              child: const Text('写数据',),
            ),
            ElevatedButton(
              onPressed: () async {
                /// 读数据的示例
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                /// 读取指定的数据
                final int? timestamp = prefs.getInt('timestamp');
                final bool? repeat = prefs.getBool('repeat');
                final double? decimal = prefs.getDouble('decimal');
                final String? action = prefs.getString('action');
                final List<String>? items = prefs.getStringList('items');
                setState(()  {
                  _message = '结果 $timestamp, $repeat, $decimal, $action, $items';
                });
              },
              child: const Text('读数据',),
            ),
            ElevatedButton(
              onPressed: () async {
                /// 删数据的示例
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                /// 删除指定的数据
                prefs.remove('timestamp');
                /// 删除全部数据
                prefs.clear();
              },
              child: const Text('删数据',),
            ),
            MyTextSmall(_message),
          ],
        ),
      ),
    );
  }
}