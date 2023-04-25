/*
 * RawImage - 用于显示 dart:ui 库中的 Image
 *
 * Image 常用的显示图片的组件
 * RawImage 用于显示 dart:ui 库中的 Image，这个不常用
 *
 * 注：也可以通过 CustomPaint 绘制 dart:ui 库中的 Image，参见 /lib/shape/paint.dart
 */

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class RawImageDemo extends StatefulWidget {
  const RawImageDemo({Key? key}) : super(key: key);

  @override
  _RawImageDemoState createState() => _RawImageDemoState();
}

class _RawImageDemoState extends State<RawImageDemo> {

  /// 用于演示如何通过 RawImage 显示指定的图像（注：这个 Image 是 dart:ui 库中的 Image）
  ui.Image? _image;

  /// 获取图像数据
  Future<void> _loadImage() async {
    ByteData data = await rootBundle.load("assets/son.jpg");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    _image = fi.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: FutureBuilder(
          future: _loadImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const MyText("loading");
            }
            /// 通过 RawImage 显示 dart:ui 库中的 Image
            /// RawImage 的大部分参数 Image 差不多，请参见 image.dart
            return RawImage(
              image: _image, /// dart:ui 库中的 Image
              width: 200,
              height: 100,
              colorBlendMode: null,
              fit: BoxFit.fill,
              repeat: ImageRepeat.noRepeat,
              alignment: Alignment.center,
            );
          },
        ),
      ),
    );
  }
}