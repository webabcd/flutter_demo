// https://flutter.github.io/samples/
// https://dart.dev/
// https://flutter.dev/
// https://pub.dev/

/*
 * flutter 的 UI 部分是声明式 UI，不是传统的命令式编程
 * 1、UI 的命令式编程：先实例化一个 UI 对象，然后按需求更改这个对象
 * 2、UI 的声明式编程：描述你需要的 UI 即可（构造 Widget 实例），需要修改时就重新描述 UI（构造新的 Widget 实例）
 *
 * 注：
 * 为了容易看懂，本例中的文件命名并不符合规范，实际开发中请按照 lower_lower 规范命名（避免不同文件系统是否区分大小写的问题），比如 scaffold_bottom_navigation_bar.dart
 */

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
import 'dart/isolate.dart';
import 'dart/package/demo.dart';

import 'widget/basic/statelessWidget.dart';
import 'widget/basic/statefulWidget.dart';
import 'widget/basic/constraint.dart';
import 'widget/basic/focus.dart';
import 'widget/basic/tree.dart';

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
import 'widget/container/decoratedBox.dart';
import 'widget/container/container.dart';
import 'widget/container/opacity.dart';

import 'widget/text/text.dart';
import 'widget/text/font.dart';
import 'widget/text/textField.dart';

import 'widget/button/textButton.dart';
import 'widget/button/outlinedButton.dart';
import 'widget/button/elevatedButton.dart';
import 'widget/button/iconButton.dart';

import 'widget/media/image.dart';
import 'widget/media/icon.dart';

import 'widget/structure/scaffold.dart';
import 'widget/structure/scaffold_appBar.dart';
import 'widget/structure/scaffold_bottomNavigationBar.dart';
import 'widget/structure/scaffold_drawer.dart';
import 'widget/structure/materialApp.dart';
import 'widget/structure/scaffold_floatingActionButton.dart';
import 'widget/structure/scaffold_tabBar.dart';
import 'widget/structure/scaffold_tabBar2.dart';

import 'ui/statusBar.dart';
import 'ui/navigationBar.dart';

import 'shape/border.dart';
import 'shape/clip.dart';
import 'shape/gradient.dart';
import 'shape/transform.dart';
import 'shape/shadow.dart';
import 'shape/paint.dart';

import 'network/http.dart';

// main 是
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      // 右上角是否显示 debug 图标
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
        "lib.dart.isolate.dart":(context) => const DartIsolate(),
        "lib.widget.basic.statelessWidget.dart":(context) => const StatelessWidgetDemo(),
        "lib.widget.basic.statefulWidget.dart":(context) => const StatefulWidgetDemo(),
        "lib.widget.basic.constraint.dart":(context) => const ConstraintDemo(),
        "lib.widget.basic.focus.dart":(context) => const FocusDemo(),
        "lib.widget.basic.tree.dart":(context) => const TreeDemo(),
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
        "lib.widget.container.decoratedBox.dart":(context) => const DecoratedBoxDemo(),
        "lib.widget.container.container.dart":(context) => const ContainerDemo(),
        "lib.widget.container.opacity.dart":(context) => const OpacityDemo(),
        "lib.widget.text.text.dart":(context) => const TextDemo(),
        "lib.widget.text.font.dart":(context) => const FontDemo(),
        "lib.widget.text.textField.dart":(context) => const TextFieldDemo(),
        "lib.widget.button.textButton.dart":(context) => const TextButtonDemo(),
        "lib.widget.button.outlinedButton.dart":(context) => const OutlinedButtonDemo(),
        "lib.widget.button.elevatedButton.dart":(context) => const ElevatedButtonDemo(),
        "lib.widget.button.iconButton.dart":(context) => const IconButtonDemo(),
        "lib.widget.media.image.dart":(context) => const ImageDemo(),
        "lib.widget.media.icon.dart":(context) => const IconDemo(),
        "lib.widget.structure.scaffold.dart":(context) => const ScaffoldDemo(),
        "lib.widget.structure.scaffold_appBar.dart":(context) => const ScaffoldAppBarDemo(),
        "lib.widget.structure.scaffold_bottomNavigationBar.dart":(context) => const ScaffoldBottomNavigationBarDemo(),
        "lib.widget.structure.scaffold_drawer.dart":(context) => const ScaffoldDrawerDemo(),
        "lib.widget.structure.scaffold_floatingActionButton.dart":(context) => const ScaffoldFloatingActionButtonDemo(),
        "lib.widget.structure.scaffold_tabBar.dart":(context) => const ScaffoldTabBarDemo(),
        "lib.widget.structure.scaffold_tabBar2.dart":(context) => const ScaffoldTabBarDemo2(),
        "lib.widget.structure.materialApp.dart":(context) => const MaterialAppDemo(),
        "lib.ui.statusBar.dart":(context) => const StatusBarDemo(),
        "lib.ui.navigationBar.dart":(context) => const NavigationBarDemo(),
        "lib.shape.border.dart":(context) => const BorderDemo(),
        "lib.shape.clip.dart":(context) => const ClipDemo(),
        "lib.shape.gradient.dart":(context) => const GradientDemo(),
        "lib.shape.transform.dart":(context) => const TransformDemo(),
        "lib.shape.shadow.dart":(context) => const ShadowDemo(),
        "lib.shape.paint.dart":(context) => const PaintDemo(),
        "lib.network.http.dart":(context) => const HttpDemo(),
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

  Future<void> _loadSiteMap() async {
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
