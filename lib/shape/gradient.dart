/*
 * 渐变
 *
 * LinearGradient - 线性渐变
 * RadialGradient - 放射渐变
 * SweepGradient - 扫描式渐变
 */

import 'package:flutter/material.dart';
import 'dart:math' as math;

class GradientDemo extends StatefulWidget {
  const GradientDemo({Key? key}) : super(key: key);

  @override
  _GradientDemoState createState() => _GradientDemoState();
}

class _GradientDemoState extends State<GradientDemo> {
  var _tileModeLinear = TileMode.clamp;
  var _tileModeGradient = TileMode.clamp;
  var _tileModeSweep = TileMode.clamp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 200,
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              /// LinearGradient - 线性渐变
              ///   colors - 渐变色的关键色值列表
              gradient: LinearGradient(
                colors: [Colors.red, Colors.green]
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 200,
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              /// LinearGradient - 线性渐变
              ///   colors - 渐变色的关键色值列表
              ///   stops - 每个关键色值的位置（0 - 1 之间）
              ///     不指定此属性，则默认会等分每个关键色值的位置
              ///     指定此属性，请注意必须要与 colors 的长度相同
              ///   begin - 渐变色起始的位置，默认值为 Alignment.centerLeft
              ///   end - 渐变色结束的位置，默认值为 Alignment.centerRight
              gradient: LinearGradient(
                colors: [Colors.red, Colors.green],
                stops: [0, 0.3],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        GestureDetector(
          child: SizedBox(
            width: 200,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                /// LinearGradient - 线性渐变
                ///   tileMode - 渐变色的平铺模式
                ///     clamp - 外围用最接近的颜色填充，默认值
                ///     repeated - 外围会重复渐变色
                ///     mirror - 外围会先镜像渐变色，然后再重复
                ///     decal - 外围用透明色填充
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.green],
                    begin: Alignment(-0.1, 0),
                    end: Alignment(0.1, 0),
                    tileMode: _tileModeLinear,
                ),
              ),
              child: Text(
                "$_tileModeLinear",
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              var index = _tileModeLinear.index + 1;
              if (index >= TileMode.values.length) {
                index = 0;
              }
              _tileModeLinear = TileMode.values[index];
            });
          },
        ),
        GestureDetector(
          child: SizedBox(
            width: 200,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                /// RadialGradient - 放射渐变
                ///   colors - 渐变色的关键色值列表
                ///   stops - 每个关键色值的位置（0 - 1 之间）
                ///     不指定此属性，则默认会等分每个关键色值的位置
                ///     指定此属性，请注意必须要与 colors 的长度相同
                ///   radius - 渐变色半径（0 - 1 之间），默认值为 0.5
                ///   tileMode - 渐变色的平铺模式
                ///     clamp - 外围用最接近的颜色填充，默认值
                ///     repeated - 外围会重复渐变色
                ///     mirror - 外围会先镜像渐变色，然后再重复
                ///     decal - 外围用透明色填充
                gradient: RadialGradient(
                  colors:[Colors.red, Colors.green],
                  radius: 0.2,
                  tileMode: _tileModeGradient
                ),
              ),
              child: Text(
                "$_tileModeGradient",
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              var index = _tileModeGradient.index + 1;
              if (index >= TileMode.values.length) {
                index = 0;
              }
              _tileModeGradient = TileMode.values[index];
            });
          },
        ),
        GestureDetector(
          child: SizedBox(
            width: 200,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                /// SweepGradient - 扫描式渐变
                ///   colors - 渐变色的关键色值列表
                ///   stops - 每个关键色值的位置（0 - 1 之间）
                ///     不指定此属性，则默认会等分每个关键色值的位置
                ///     指定此属性，请注意必须要与 colors 的长度相同
                ///   center - 扫描的中心点（渐变会围绕着此点做渐变），默认值为 Alignment.center
                ///   startAngle - 扫描的起始弧度（pi * 2 就是 360 度）
                ///   endAngle - 扫描的结束弧度（pi * 2 就是 360 度）
                ///   tileMode - 渐变色的平铺模式
                ///     clamp - 外围用最接近的颜色填充，默认值
                ///     repeated - 外围会重复渐变色
                ///     mirror - 外围会先镜像渐变色，然后再重复
                ///     decal - 外围用透明色填充
                gradient: SweepGradient(
                  colors: [Colors.red, Colors.green],
                  center: Alignment.center,
                  tileMode: _tileModeSweep,
                  startAngle: 0.0,
                  endAngle: math.pi / 2,
                ),
              ),
              child: Text(
                "$_tileModeSweep",
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              var index = _tileModeSweep.index + 1;
              if (index >= TileMode.values.length) {
                index = 0;
              }
              _tileModeSweep = TileMode.values[index];
            });
          },
        ),
      ],
    );
  }
}