// https://dart.dev/guides/language/language-tour



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'dart/dart_summary.dart';
import 'dart/dart_datatype.dart';
import 'dart/dart_operator.dart';
import 'dart/dart_statement.dart';
import 'dart/dart_exception.dart';
import 'dart/dart_function.dart';
import 'dart/dart_class1.dart';
import 'dart/dart_class2.dart';
import 'dart/dart_generic.dart';

// main 是
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ddd'),
      routes:{
        "dart.dart_summary":(context) => const DartSummary(),
        "dart.dart_datatype":(context) => const DartDatatype(),
        "dart.dart_operator":(context) => const DartOperator(),
        "dart.dart_statement":(context) => const DartStatement(),
        "dart.dart_exception":(context) => const DartException(),
        "dart.dart_function":(context) => const DartFunction(),
        "dart.dart_class1":(context) => const DartClass1(),
        "dart.dart_class2":(context) => const DartClass2(),
        "dart.dart_generic":(context) => const DartGeneric(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // https://blog.csdn.net/Ly250821/article/details/118684351
  // _MyHomePageState(this._json, this._counter);

  List<Welcome>? _json;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _loadSiteMap() async {

    var jsonString = await rootBundle.loadString('assets/site_map.json');
    _json = welcomeFromJson(jsonString);
    //debugPrint(_json[0]["title"]);
   // debugPrint(_json[0]["title"].runtimeType.toString());
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _loadSiteMap(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ExpansionTile(
                initiallyExpanded: false,
                title: Text(_json![index].title),
                children: _json![index].node.map((e) =>
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Text(
                          e.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 36,
                            color: Colors.red,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, e.url);
                        },
                      )
                    ],
                  ),
                ).toList(),
              );
            },
            itemCount: _json?.length,
          ),
        );
      }
    );
  }
}



List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.title,
    required this.node,
  });

  String title;
  List<Node> node;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    title: json["title"],
    node: List<Node>.from(json["node"].map((x) => Node.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "node": List<dynamic>.from(node.map((x) => x.toJson())),
  };
}

class Node {
  Node({
    required this.title,
    required this.url,
  });

  String title;
  String url;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "url": url,
  };
}
