/*
 *
 *
 *
 * 添加 http 库的方法，在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dependencies:
 *   http: ^0.13.5
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key? key}) : super(key: key);

  Future<_MyModel> requestData() async {
    final response = await http.get(
      Uri.parse('http://192.168.8.197:42656/json'),
      headers: {
        "myHeader": 'custom header',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return _MyModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(
        child: FutureBuilder(
          future: requestData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}




class _MyModel {
  _MyModel({
    required this.id,
    required this.name,
    required this.age,
  });

  int id;
  String name;
  int age;

  factory _MyModel.fromJson(Map<String, dynamic> json) => _MyModel(
    id: json["id"],
    name: json["name"],
    age: json["age"],
  );

  Map<String,
      dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
  };
}
