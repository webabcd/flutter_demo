/*
 * 边框
 *
 * 以下边框均继承自 ShapeBorder
 * 1、BeveledRectangleBorder - 边可倾斜的矩形框（可以指定边框的大小、颜色、半径）
 * 2、Border - 边框（允许分别设置每个边的大小和颜色）
 * 3、BorderDirectional - 同 Border，只不过因为文字方向的原因，没有 left 和 right 了，改为 start 和 end 了
 * 4、CircleBorder - 圆形边框
 * 5、RoundedRectangleBorder - 圆角矩形边框
 * 6、ContinuousRectangleBorder - 圆角矩形边框
 *     注：ContinuousRectangleBorder 的边框一半在主图形内一半在主图形外，其他类型的边框均是在主图形内
 * 7、StadiumBorder - 跑道边框（左右是圆弧，上下是直线）
 * 8、OutlineInputBorder - 用于输入框的边框
 * 9、UnderlineInputBorder - 用于输入框的下划线
 *
 * 注：
 * BorderSide - 用于定义边框的大小和颜色
 * BorderRadius - 用于定义边框的半径
 */

import 'package:flutter/material.dart';

class BorderDemo extends StatelessWidget {
  const BorderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const MyBox(
          /// BeveledRectangleBorder - 边可倾斜的矩形框
          ///   side - 边框的大小和颜色，一个 BorderSide 对象
          ///   borderRadius - 边框的半径，一个 BorderRadius 对象
          shape: BeveledRectangleBorder(
            /// style - 边框样式
            ///   BorderStyle.solid - 有边框
            ///   BorderStyle.none - 无边框
            /// strokeAlign - 边框位置
            ///   BorderSide.strokeAlignInside - 边框在主图形之内
            ///   BorderSide.strokeAlignOutside - 边框在主图形之外
            ///   BorderSide.strokeAlignCenter - 边框一半在主图形之内，一半在主图形之外
            side: BorderSide(width: 2, color: Colors.green, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        MyBox(
          /// BeveledRectangleBorder - 边可倾斜的矩形框（指定边框半径为 0 时就是一个标准矩形框）
          shape: BeveledRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.green),
            borderRadius: BorderRadius.circular(0)
          ),
        ),
        const MyBox(
          /// Border - 边框，允许分别设置每个边的大小和颜色，如果每个边都一样的话就用 Border.all()
          /// BorderDirectional - 同 Border，只不过因为文字方向的原因，没有 left 和 right 了，改为 start 和 end 了
          shape: Border(
            top: BorderSide(width: 5, color: Colors.green),
            right: BorderSide(width: 5, color: Colors.blue),
            bottom: BorderSide(width: 5, color: Colors.yellow),
            /// 无边框，等同于 BorderSide(width: 0.0, style: BorderStyle.none);
            left: BorderSide.none,
          ),
        ),
        const MyBox(
          /// CircleBorder - 圆形边框
          ///   side - 边框的大小和颜色，一个 BorderSide 对象
          shape: CircleBorder(
            side: BorderSide(width: 5, color: Colors.green)
          ),
        ),
        MyBox(
          /// RoundedRectangleBorder - 圆角矩形边框
          ///   side - 边框的大小和颜色，一个 BorderSide 对象
          ///   borderRadius - 边框的半径，一个 BorderRadius 对象
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 5, color: Colors.green),
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        MyBox(
          /// ContinuousRectangleBorder - 圆角矩形边框
          ///   side - 边框的大小和颜色，一个 BorderSide 对象
          ///   borderRadius - 边框的半径，一个 BorderRadius 对象
          /// 注：ContinuousRectangleBorder 的边框一半在主图形内一半在主图形外，其他类型的边框均是在主图形内
          shape: ContinuousRectangleBorder(
            side: const BorderSide(width: 5, color: Colors.green),
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        const MyBox(
          /// StadiumBorder - 跑道边框（左右是圆弧，上下是直线）
          ///   side - 边框的大小和颜色，一个 BorderSide 对象
          shape: StadiumBorder(
            side: BorderSide(width: 5, color: Colors.green),
          ),
        ),
        MyBox(
          /// OutlineInputBorder - 用于输入框的边框（参见：lib/widget/text/text_field.dart）
          ///   borderSide - 边框的大小和颜色，一个 BorderSide 对象
          ///   borderRadius - 边框的半径，一个 BorderRadius 对象
          shape: OutlineInputBorder(
            borderSide: const BorderSide(width: 5, color: Colors.green),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const MyBox(
          /// UnderlineInputBorder - 用于输入框的下划线（参见：lib/widget/text/text_field.dart）
          ///   borderSide - 边框的大小和颜色，一个 BorderSide 对象
          shape: UnderlineInputBorder(
            borderSide: BorderSide(width: 5, color: Colors.green),
          ),
        ),
      ],
    );
  }
}

class MyBox extends StatelessWidget {
  final ShapeBorder shape;

  const MyBox({
    Key? key,
    required this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 20,
      child: Material(
        shape: shape,
        child: Container(color: Colors.red,),
      ),
    );
  }
}