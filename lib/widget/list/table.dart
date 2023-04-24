/*
 * Table - 表格
 */

import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({Key? key}) : super(key: key);

  @override
  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      /// 表格
      body: Table(
        /// 表格边框
        border: TableBorder.all(
          /// 边框颜色
          color: Colors.red,
          /// 边框大小
          width: 2,
          /// 边框样式
          ///   solid - 有边框
          ///   none - 无边框
          style: BorderStyle.solid,
        ),
        /// 用于定义列宽
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),  /// 第 1 列，由此列中的元素决定列宽（注：这个效率不高）
          1: FlexColumnWidth(),       /// 第 2 列，列宽自适应
          2: FixedColumnWidth(64),    /// 第 3 列，指定一个固定的列宽
        },
        /// 每个单元格的垂直方向的默认的对齐方式
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          /// 用于定义行
          TableRow(
            /// 用于定义行中的单元格
            children: [
              Container(
                height: 32,
                color: Colors.green,
              ),
              /// 通过 TableCell 可以指定当前单元格的垂直方向的对齐方式
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.red,
                ),
              ),
              Container(
                height: 64,
                color: Colors.yellow,
              ),
            ],
          ),
          TableRow(
            /// 用于定义行的装饰样式
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            children: [
              Container(
                height: 64,
                width: 128,
                color: Colors.green,
              ),
              Container(
                height: 32,
                color: Colors.red,
              ),
              Center(
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}