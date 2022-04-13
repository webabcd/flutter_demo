/*
 * 剪裁
 *
 * ClipRect - 矩形剪裁
 * ClipRRect - 圆角矩形剪裁
 * ClipOval - 椭圆形剪裁
 * ClipPath - 自定义路径剪裁
 * ClipPath.shape() - 根据指定的 ShapeBorder 对象剪裁
 *
 * 另外，部分 Widget 会有一个 clipBehavior 属性，其用于指定超出范围的子元素的剪裁方式
 * 1、Clip.none - 不剪裁
 * 2、Clip.hardEdge - 裁剪但不抗锯齿，速度比 none 慢
 * 3、Clip.antiAlias - 裁剪而且抗锯齿，速度比 hardEdge 慢
 * 4、Clip.antiAliasWithSaveLayer - 裁剪而且抗锯齿，并分配一个缓冲区，速度比 antiAlias 慢
 */

import 'package:flutter/material.dart';

var image = Image.asset(
  'assets/son.jpg',
  fit: BoxFit.cover,
  width: 50,
  height: 50,
);

class ClipDemo extends StatelessWidget {
  const ClipDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// 原始图片
        image,
        /// ClipRect - 矩形剪裁
        /// 本例剪裁后的结果为：只显示图片的上半部分
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: SizedBox(
              height: 50,
              width: 50,
              child: image,
            ),
          ),
        ),
        /// ClipRRect - 圆角矩形剪裁
        /// 本例剪裁后的结果为：显示圆角图片
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 50,
            width: 50,
            child: image,
          ),
        ),
        /// ClipOval - 椭圆形剪裁
        /// 本例剪裁后的结果为：显示圆形图片
        ClipOval(
          child: SizedBox(
            height: 50,
            width: 50,
            child: image,
          ),
        ),
        /// ClipPath.shape() - 根据指定的 ShapeBorder 对象剪裁
        ///   shape - 指定用于剪裁的 ShapeBorder 对象（关于 ShapeBorder 的说明请参见 /lib/shape/border.dart）
        /// 本例剪裁后的结果为：显示圆形图片
        ClipPath.shape(
          shape: const CircleBorder(),
          child: SizedBox(
            height: 50,
            width: 50,
            child: image,
          ),
        ),
        /// ClipPath - 自定义路径剪裁
        ///   clipper - 自定义剪裁路径，需要自定义 CustomClipper<Path> 对象
        /// 本例剪裁后的结果为：显示三角图片
        ClipPath(
          clipper: _MyClipper(),
          child: SizedBox(
            height: 50,
            width: 50,
            child: image,
          ),
        ),
      ],
    );
  }
}

/// 自定义的 CustomClipper<Path> 对象，用于实现三角形剪裁
class _MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}