/*
 * http 库以及 json 和对象间的转换
 *
 * 添加 http 库的方法，在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dependencies:
 *   http: ^0.13.5
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {

  late Future<_MyModel> _futureMyModel;

  /// get 请求，自定义 header
  Future<_MyModel> getData() async {
    var response = await http.get(
      Uri.parse('http://192.168.8.197:42656/get'),
      headers: {
        "myHeader": 'custom header',
      },
    );

    if (response.statusCode < 400) {
      /// 通过 jsonDecode 实现字符串转对象
      return _MyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('error: ${response.statusCode}');
    }
  }

  /// post 请求，自定义 post 数据
  Future<_MyModel> postData() async {
    final response = await http.post(
      Uri.parse('http://192.168.8.197:42656/post'),
      /// 通过 jsonEncode 实现对象转字符串
      body: jsonEncode({
        'key1': "value1",
        'key2': "value2",
      }),
    );

    if (response.statusCode < 400) {
      return _MyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('error: ${response.statusCode}');
    }
  }

  /// 通过 Future 的 timeout() 实现 http 请求的超时处理
  Future<_MyModel> getDataTimeout() async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.8.197:42656/get'),
        headers: {
          "myHeader": 'custom header',
        },
      ).timeout(const Duration(seconds: 1));

      if (response.statusCode < 400) {
        return _MyModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('error: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();

    _futureMyModel = Future<_MyModel>.value(_MyModel(id: 0, name: "初始"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: FutureBuilder(
                future: _futureMyModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Text("response data:\n${snapshot.data!.name}");
                    } else if (snapshot.hasError) {
                      return Text('response error:\n${snapshot.error}');
                    }
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          Container(
            height: 40,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('get'),
                  onPressed: () {
                    setState(() {
                      _futureMyModel = getData();
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('post'),
                  onPressed: () {
                    setState(() {
                      _futureMyModel = postData();
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('timeout'),
                  onPressed: () {
                    setState(() {
                      _futureMyModel = getDataTimeout();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/// 自定义实体类
/// 去 https://app.quicktype.io/ 可以方便地通过 json 自动生成自定义实体类
class _MyModel {
  _MyModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  /// jsonEncode() - 对象转字符串
  /// jsonDecode() - 字符串转对象（转换后的对象可以通过如下自动生成的方法转成你的自定义实体类的实例）
  factory _MyModel.fromJson(Map<String, dynamic> json) => _MyModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String,
      dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
