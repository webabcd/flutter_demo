// https://flutter.github.io/samples/
// https://dart.dev/
// https://flutter.dev/
// https://pub.dev/

/*
 * flutter 使用的是声明式 UI（declarative UI），不是传统的命令式编程
 * 1、UI 的命令式编程：先实例化一个 UI 对象，然后按需求更改这个对象
 * 2、UI 的声明式编程：描述你需要的 UI 即可（构造 Widget 实例），需要修改时就重新描述 UI（构造新的 Widget 实例）
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

import 'widget/basic/stateless_widget.dart';
import 'widget/basic/stateful_widget.dart';
import 'widget/basic/constraint.dart';
import 'widget/basic/focus.dart';
import 'widget/basic/tree.dart';
import 'widget/basic/change_notifier.dart';

import 'widget/layout/row.dart';
import 'widget/layout/column.dart';
import 'widget/layout/flex.dart';
import 'widget/layout/wrap.dart';
import 'widget/layout/flow.dart';
import 'widget/layout/stack.dart';

import 'widget/container/padding.dart';
import 'widget/container/align.dart';
import 'widget/container/center.dart';
import 'widget/container/constrained_box.dart';
import 'widget/container/sized_box.dart';
import 'widget/container/unconstrained_box.dart';
import 'widget/container/decorated_box.dart';
import 'widget/container/container.dart';
import 'widget/container/opacity.dart';

import 'widget/text/text.dart';
import 'widget/text/font.dart';
import 'widget/text/text_field.dart';

import 'widget/button/text_button.dart';
import 'widget/button/outlined_button.dart';
import 'widget/button/elevated_button.dart';
import 'widget/button/icon_button.dart';

import 'widget/media/image.dart';
import 'widget/media/icon.dart';

import 'widget/structure/scaffold.dart';
import 'widget/structure/scaffold_app_bar.dart';
import 'widget/structure/scaffold_bottom_navigation_bar.dart';
import 'widget/structure/scaffold_drawer.dart';
import 'widget/structure/material_app.dart';
import 'widget/structure/scaffold_floating_action_button.dart';
import 'widget/structure/scaffold_tab_bar.dart';
import 'widget/structure/scaffold_tab_bar2.dart';

import 'widget/flyout/alert_dialog.dart';
import 'widget/flyout/simple_dialog.dart';
import 'widget/flyout/snack_bar.dart';

import 'widget/builder/builder.dart';
import 'widget/builder/stateful_builder.dart';
import 'widget/builder/layout_builder.dart';

import 'ui/status_bar.dart';
import 'ui/navigation_bar.dart';
import 'ui/theme.dart';

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
        "lib.widget.basic.stateless_widget.dart":(context) => const StatelessWidgetDemo(),
        "lib.widget.basic.stateful_widget.dart":(context) => const StatefulWidgetDemo(),
        "lib.widget.basic.constraint.dart":(context) => const ConstraintDemo(),
        "lib.widget.basic.focus.dart":(context) => const FocusDemo(),
        "lib.widget.basic.tree.dart":(context) => const TreeDemo(),
        "lib.widget.basic.change_notifier.dart":(context) => const ChangeNotifierDemo(),
        "lib.widget.layout.row.dart":(context) => const RowDemo(),
        "lib.widget.layout.column.dart":(context) => const ColumnDemo(),
        "lib.widget.layout.flex.dart":(context) => const FlexDemo(),
        "lib.widget.layout.wrap.dart":(context) => const WrapDemo(),
        "lib.widget.layout.flow.dart":(context) => const FlowDemo(),
        "lib.widget.layout.stack.dart":(context) => const StackDemo(),
        "lib.widget.container.padding.dart":(context) => const PaddingDemo(),
        "lib.widget.container.align.dart":(context) => const AlignDemo(),
        "lib.widget.container.center.dart":(context) => const CenterDemo(),
        "lib.widget.container.constrained_box.dart":(context) => const ConstrainedBoxDemo(),
        "lib.widget.container.sized_box.dart":(context) => const SizedBoxDemo(),
        "lib.widget.container.unconstrained_box.dart":(context) => const UnconstrainedBoxDemo(),
        "lib.widget.container.decorated_box.dart":(context) => const DecoratedBoxDemo(),
        "lib.widget.container.container.dart":(context) => const ContainerDemo(),
        "lib.widget.container.opacity.dart":(context) => const OpacityDemo(),
        "lib.widget.text.text.dart":(context) => const TextDemo(),
        "lib.widget.text.font.dart":(context) => const FontDemo(),
        "lib.widget.text.text_field.dart":(context) => const TextFieldDemo(),
        "lib.widget.button.text_button.dart":(context) => const TextButtonDemo(),
        "lib.widget.button.outlined_button.dart":(context) => const OutlinedButtonDemo(),
        "lib.widget.button.elevated_button.dart":(context) => const ElevatedButtonDemo(),
        "lib.widget.button.icon_button.dart":(context) => const IconButtonDemo(),
        "lib.widget.media.image.dart":(context) => const ImageDemo(),
        "lib.widget.media.icon.dart":(context) => const IconDemo(),
        "lib.widget.structure.scaffold.dart":(context) => const ScaffoldDemo(),
        "lib.widget.structure.scaffold_app_bar.dart":(context) => const ScaffoldAppBarDemo(),
        "lib.widget.structure.scaffold_bottom_navigation_bar.dart":(context) => const ScaffoldBottomNavigationBarDemo(),
        "lib.widget.structure.scaffold_drawer.dart":(context) => const ScaffoldDrawerDemo(),
        "lib.widget.structure.scaffold_floating_action_button.dart":(context) => const ScaffoldFloatingActionButtonDemo(),
        "lib.widget.structure.scaffold_tab_bar.dart":(context) => const ScaffoldTabBarDemo(),
        "lib.widget.structure.scaffold_tab_bar2.dart":(context) => const ScaffoldTabBarDemo2(),
        "lib.widget.structure.material_app.dart":(context) => const MaterialAppDemo(),
        "lib.widget.flyout.alert_dialog.dart":(context) => const AlertDialogDemo(),
        "lib.widget.flyout.simple_dialog.dart":(context) => const SimpleDialogDemo(),
        "lib.widget.flyout.snack_bar.dart":(context) => const SnackBarDemo(),
        "lib.widget.builder.builder.dart":(context) => const BuilderDemo(),
        "lib.widget.builder.stateful_builder.dart":(context) => const StatefulBuilderDemo(),
        "lib.widget.builder.layout_builder.dart":(context) => const LayoutBuilderDemo(),
        "lib.ui.status_bar.dart":(context) => const StatusBarDemo(),
        "lib.ui.navigation_bar.dart":(context) => const NavigationBarDemo(),
        "lib.ui.theme.dart":(context) => const ThemeDemo(),
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
