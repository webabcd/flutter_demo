/*
 * Slider - 可拖动进度条
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({Key? key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> with SingleTickerProviderStateMixin {

  var _value1 = 0.0;
  var _value2 = 0.0;
  var _value3 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Slider(
              /// 进度条的值
              value: _value1,
              /// 进度条的最小值（默认为 0）
              min: 0.0,
              /// 进度条的最大值（默认为 1）
              max: 1.0,
              /// 滑块以及滑块左侧的颜色
              activeColor: Colors.red,
              /// 滑块右侧的颜色
              inactiveColor: Colors.green,
              /// 进度值发生变化时触发的事件（注：把 onChanged 设置为 null 则说明 Slider 为不可用状态）
              onChanged: (value) =>
                  setState(() => _value1 = value),
              /// 手指按下滑块时触发的事件
              onChangeStart: (value) =>
                  log('onChangeStart: $value'),
              /// 手指从滑块抬起时触发的事件
              onChangeEnd: (value) =>
                  log('onChangeEnd: $value'),
            ),

            Slider(
              value: _value2,

              /// 把进度条平均分成 divisions 指定的份数，并显示分隔点
              /// 设置此值后，滑块的拖动将变为离散的，其只能在不同的分隔点上移动，同时会在滑块的上部显示 label 指定的内容
              divisions: 10,
              label: 'value:$_value2',

              onChanged: (value) =>
                  setState(() => _value2 = value),
            ),

            /// 通过 SliderTheme 设置 Slider 的样式
            SliderTheme(
              data: const SliderThemeData(
                /// 轨道的高度
                trackHeight: 10,

                /// 滑块左侧的颜色
                activeTrackColor: Colors.red,
                /// 滑块右侧的颜色
                inactiveTrackColor: Colors.green,
                /// 滑块的颜色
                thumbColor: Colors.purple,
                /// 滑块的形状和尺寸
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),

                /// 滑块左侧的分隔点的颜色
                activeTickMarkColor: Colors.white,
                /// 滑块右侧的分隔点的颜色
                inactiveTickMarkColor: Colors.red,
                /// 分隔点的形状和尺寸
                tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 2.0),

                /// 显示的 label 的背景色
                valueIndicatorColor: Colors.blue,
                /// 显示的 label 的文本样式
                valueIndicatorTextStyle: TextStyle(fontSize: 14.0),
                /// 显示的 label 的形状
                valueIndicatorShape: RectangularSliderValueIndicatorShape(),

                /// 点击滑块后的特效的颜色
                overlayColor: Colors.yellow,
                /// 点击滑块后的特效的形状和尺寸
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                value: _value3,
                divisions: 10,
                label: 'value:$_value3',
                onChanged: (value) =>
                    setState(() => _value3 = value),
              ),
            ),

            /// 设置不可用状态的 Slider 的样式
            const SliderTheme(
              data: SliderThemeData(
                /// 滑块左侧的颜色（当 Slider 为不可用状态的时候）
                disabledActiveTrackColor: Colors.black,
                /// 滑块右侧的颜色（当 Slider 为不可用状态的时候）
                disabledInactiveTrackColor: Colors.black,
                /// 滑块的颜色（当 Slider 为不可用状态的时候）
                disabledThumbColor: Colors.black,
                /// 滑块左侧的分隔点的颜色（当 Slider 为不可用状态的时候）
                disabledActiveTickMarkColor: Colors.transparent,
                /// 滑块右侧的分隔点的颜色（当 Slider 为不可用状态的时候）
                disabledInactiveTickMarkColor: Colors.transparent,
              ),
              child: Slider(
                value: 0.5,
                /// 把 onChanged 设置为 null 则说明 Slider 为不可用状态
                onChanged: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}