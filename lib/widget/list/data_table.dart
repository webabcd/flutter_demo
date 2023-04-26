/*
 * DataTable - 数据表格
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {

  var _sortColumnIndex = 0;
  var _sortAscending = true;

  _getDataTable() {
    /// 数据表格
    return DataTable(
      /// 标题行 DataColumn 集合
      columns: _getDataColumnList(),
      /// 数据行 DataRow 集合
      rows: _getDataRowList(),
      
      /// 标题行的高度
      headingRowHeight: 56,
      /// 标题行的文本样式
      headingTextStyle: const TextStyle(color: Colors.white),

      /// 数据行的高度
      dataRowHeight: 40,
      /// 数据行的文本样式
      dataTextStyle: const TextStyle(color: Colors.white),
      /// 数据行的背景颜色
      dataRowColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.green;  /// 选中状态的颜色
        }
        return Colors.red;      /// 其他状态的颜色
      }),

      /// 列之间的间距
      columnSpacing: 56,
      /// 左侧边缘与第一列之间的间距，以及右侧边缘与最后一列之间的间距
      horizontalMargin: 10,
      /// 分隔线的宽度
      dividerThickness: 2,
      /// 最后一行数据的下面是否要显示分隔线
      showBottomBorder: false,
      
      /// 是否在每行的左侧显示复选框
      showCheckboxColumn: true,
      /// 复选框水平方向上的外边距
      checkboxHorizontalMargin: 10,

      /// 当前排序的列索引
      sortColumnIndex: _sortColumnIndex,
      /// 当前排序的方向是否是正向排序
      sortAscending: _sortAscending,

      /// 点击标题行中的全选按钮时的回调
      /// 定义这个就要自己写逻辑，不定义这个则走默认的全选逻辑
      /*
      onSelectAll: (value) {

      },
      */
    );
  }

  _getDataColumnList() {
    List<DataColumn> dataColumnList = [];
    for (var column in _columnList) {
      /// 标题行中的每个列
      dataColumnList.add(DataColumn(
        /// 需要显示的内容
        label: Text(column.name,),
        /// tooltip
        tooltip: column.name,
        /// 是否右对齐
        numeric: false,
        /// 点击标题，触发排序操作时的回调
        onSort: (int columnIndex, bool ascending) {
          /// columnIndex - 排序的列的索引
          /// ascending - 是否正向排序
          log('onSort, columnIndex:$columnIndex, ascending:$ascending');
          if (columnIndex != 0 && columnIndex != 2) {
            return;
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;

            /// 对数据源排序
            _rowList.sort((p1, p2) {
              dynamic compareA;
              dynamic compareB;
              switch (_sortColumnIndex) {
                case 0:
                  compareA = p1.id;
                  compareB = p2.id;
                  break;
                case 2:
                  compareA = p1.x1;
                  compareB = p2.x1;
                  break;
              }
              if (_sortAscending) {
                return compareA.compareTo(compareB);
              }
              return compareB.compareTo(compareA);
            });
          });
        },
      ));
    }
    return dataColumnList;
  }

  _getDataRowList() {
    List<DataRow> dataRowList = [];
    for (var row in _rowList) {
      /// 数据行中的每个单元格
      dataRowList.add(DataRow(
        /// 当前行的单元格集合
        cells: [
          _getDataCell(row.id.toString()),
          _getDataCell(row.name),
          _getDataCell(row.x1.toString()),
          _getDataCell(row.x2.toString()),
          _getDataCell(row.x3.toString()),
          _getDataCell(row.x4.toString()),
          _getDataCell(row.x5.toString()),
          _getDataCell(row.x6.toString()),
          _getDataCell(row.x7.toString()),
          _getDataCell(row.x8.toString()),
        ],
        /// 当前数据行是否是选中状态
        selected: row.isSelected,
        /// 当前数据行的选中状态发生变化时的回调
        onSelectChanged: (isSelected) {
          setState(() {
            row.isSelected = isSelected!;
          });
        },
      ));
    }
    return dataRowList;
  }

  _getDataCell(String s) {
    /// 单元格
    return DataCell(
      Text(s),
      /// 是否在单元格上显示编辑按钮
      showEditIcon: false,
      /// 单击事件，类似的有 onTap, onLongPress, onTapDown, onDoubleTap, onTapCancel
      onTap: () {
        log("onTap");
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('title'),),
      backgroundColor: Colors.orange,
      /// DataTable 不支持滚动，需要借助 SingleChildScrollView 实现滚动
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          /// 这个主题用于修改排序的提示图标的颜色，其它的一些无法直接修改的样式也可以通过这种方式修改，具体用的是什么主题可以看源代码
          child: Theme(
            data: ThemeData(
              iconTheme: const IconThemeData(
                color: Colors.blue,
              ),
            ),
            child: _getDataTable(),
          ),
        ),
      ),
    );
  }
}

class _MyColumn {
  const _MyColumn({required this.name});

  final String name;
}

class _MyRow {
  int id;
  String name;
  int x1;
  int x2;
  int x3;
  int x4;
  int x5;
  int x6;
  int x7;
  int x8;
  bool isSelected;

  _MyRow(
      this.id,
      this.name,
      this.x1,
      this.x2,
      this.x3,
      this.x4,
      this.x5,
      this.x6,
      this.x7,
      this.x8, {
        this.isSelected = false,
      });
}

var _columnList = const [
  _MyColumn(name: '学号'),
  _MyColumn(name: '姓名'),
  _MyColumn(name: '学科1'),
  _MyColumn(name: '学科2'),
  _MyColumn(name: '学科3'),
  _MyColumn(name: '学科4'),
  _MyColumn(name: '学科5'),
  _MyColumn(name: '学科6'),
  _MyColumn(name: '学科7'),
  _MyColumn(name: '学科8'),
];

var _random = Random();
var _rowList = List<_MyRow>.generate(30, (index) =>
    _MyRow(index, 'name$index', _random.nextInt(100), _random.nextInt(100), _random.nextInt(100), _random.nextInt(100), _random.nextInt(100), _random.nextInt(100), _random.nextInt(100), _random.nextInt(100)),);
