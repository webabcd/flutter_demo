// https://dart.dev/guides/language/language-tour



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'dart/summary.dart';
import 'dart/datatype.dart';
import 'dart/operator.dart';
import 'dart/statement.dart';
import 'dart/exception.dart';
import 'dart/function.dart';
import 'dart/class1.dart';
import 'dart/class2.dart';
import 'dart/generic.dart';
import 'dart/other.dart';
import 'dart/async.dart';
import 'dart/package/demo.dart';

import 'widget/basic/statelessWidget.dart';
import 'widget/basic/statefulWidget.dart';
import 'widget/basic/constraint.dart';
import 'widget/basic/widget_key.dart';

import 'widget/layout/row.dart';
import 'widget/layout/column.dart';
import 'widget/layout/flex.dart';
import 'widget/layout/wrap.dart';
import 'widget/layout/flow.dart';
import 'widget/layout/stack.dart';

import 'widget/container/padding.dart';
import 'widget/container/align.dart';
import 'widget/container/center.dart';
import 'widget/container/constrainedBox.dart';
import 'widget/container/sizedBox.dart';
import 'widget/container/unconstrainedBox.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
      routes:{
        "lib.dart.summary.dart":(context) => const DartSummary(),
        "lib.dart.datatype.dart":(context) => const DartDatatype(),
        "lib.dart.operator.dart":(context) => const DartOperator(),
        "lib.dart.statement.dart":(context) => const DartStatement(),
        "lib.dart.exception.dart":(context) => const DartException(),
        "lib.dart.function.dart":(context) => const DartFunction(),
        "lib.dart.class1.dart":(context) => const DartClass1(),
        "lib.dart.class2.dart":(context) => const DartClass2(),
        "lib.dart.generic.dart":(context) => const DartGeneric(),
        "lib.dart.other.dart":(context) => const DartOther(),
        "lib.dart.package.demo.dart":(context) => const DartPackage(),
        "lib.dart.async.dart":(context) => const DartAsync(),
        "lib.widget.basic.statelessWidget.dart":(context) => const StatelessWidgetDemo(),
        "lib.widget.basic.statefulWidget.dart":(context) => const StatefulWidgetDemo(),
        "lib.widget.basic.constraint.dart":(context) => const ConstraintDemo(),
        "lib.widget.basic.widget_key.dart":(context) => const WidgetKeyDemo(),
        "lib.widget.layout.row.dart":(context) => const RowDemo(),
        "lib.widget.layout.column.dart":(context) => const ColumnDemo(),
        "lib.widget.layout.flex.dart":(context) => const FlexDemo(),
        "lib.widget.layout.wrap.dart":(context) => const WrapDemo(),
        "lib.widget.layout.flow.dart":(context) => const FlowDemo(),
        "lib.widget.layout.stack.dart":(context) => const StackDemo(),
        "lib.widget.container.padding.dart":(context) => const PaddingDemo(),
        "lib.widget.container.align.dart":(context) => const AlignDemo(),
        "lib.widget.container.center.dart":(context) => const CenterDemo(),
        "lib.widget.container.constrainedBox.dart":(context) => const ConstrainedBoxDemo(),
        "lib.widget.container.sizedBox.dart":(context) => const SizedBoxDemo(),
        "lib.widget.container.unconstrainedBox.dart":(context) => const UnconstrainedBoxDemo(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Node>? _siteMap;

  _loadSiteMap() async {
    _siteMap = <Node>[];

    var str = await rootBundle.loadString('assets/README.md');
    var list = str.split("\n");
    Node? n;
    for (int i = 0; i < list.length; i++) {
      var line = list[i];
      if (line.startsWith("###")) {
        n = Node(line.substring(4).trim(), "", <Node>[]);
        _siteMap!.add(n);
      } else if (n != null && line.contains(". ")) {
        n.node.add(Node(line.trim(),
            list[++i].substring(list[i].indexOf("-") + 2).trim().replaceAll("/", "."),
            <Node>[]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _loadSiteMap(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Text("loading");
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ExpansionTile(
                initiallyExpanded: false,
                title: Text(
                  _siteMap![index].title,
                  style: const TextStyle(

                  ),
                ),
                collapsedBackgroundColor: Colors.yellow,
                backgroundColor: Colors.orange,
                collapsedTextColor: Colors.black,
                textColor: Colors.white,
                collapsedIconColor: Colors.black,
                iconColor: Colors.white,
                children: _siteMap![index].node.map((e) =>
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                                  child: Text(
                                    e.title,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, e.url);
                                },
                              )
                          )
                        ],
                      ),
                      const Divider(
                        height: 5,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ).toList(),
              );
            },
            itemCount: _siteMap!.length,
          ),
        );
      }
    );
  }
}

class Node {
  String title;
  String url;
  List<Node> node;
  Node(this.title, this.url, this.node);
}
