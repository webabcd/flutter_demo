/*
 * ExpansionTile - 列表项（可展开）
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper.dart';

class ExpansionTileDemo extends StatefulWidget {
  const ExpansionTileDemo({Key? key}) : super(key: key);

  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  List<Node>? _siteMap;

  Future<void> _loadSiteMap() async {
    await Future.delayed(const Duration(milliseconds: 1000));
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
        n.node.add(Node(
            line.trim(),
            list[++i].substring(list[i].indexOf("-") + 2).trim().replaceAll("/", "."),
            <Node>[]
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: FutureBuilder(
          future: _loadSiteMap(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator(),);
            }

            return ListView.separated(
              itemCount: _siteMap!.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 1.0, height: 1.0, color: Colors.white);
              },
              itemBuilder: (context, index) {
                return ExpansionTile(
                  /// 初始时是否为展开状态
                  initiallyExpanded: false,
                  /// 标题
                  title: Text(
                    _siteMap![index].title,
                  ),
                  /// 标题的内边距
                  tilePadding: EdgeInsets.zero,
                  /// 左侧组件
                  leading: null,
                  /// 右侧组件
                  trailing: null,
                  /// title 下面的组件
                  subtitle: null,
                  /// 收缩状态时的背景颜色
                  collapsedBackgroundColor: Colors.red,
                  /// 收缩状态时的文本颜色
                  collapsedTextColor: Colors.white,
                  /// 收缩状态时的图标颜色
                  collapsedIconColor: Colors.white,
                  /// 展开状态时的背景颜色
                  backgroundColor: Colors.yellow,
                  /// 展开状态时的文本颜色
                  textColor: Colors.black,
                  /// 展开状态时的图标颜色
                  iconColor: Colors.black,
                  /// 展开/收缩时触发的事件（其中的 value 值用于说明当前是否是展开状态）
                  onExpansionChanged: (value) => log("onExpansionChanged:$value"),
                  /// 展开/收缩时，是否保持展开列表中的内容的状态
                  maintainState: false,
                  children: _siteMap![index].node.map((e) =>
                      Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
                      ),
                  ).toList(),
                );
              },
            );
          }
      ),
    );
  }
}

class Node {
  String title;
  String url;
  List<Node> node;
  Node(this.title, this.url, this.node);
}
