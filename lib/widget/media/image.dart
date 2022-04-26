/*
 * Image - 图片
 *
 * 注：
 * 1、在 pubspec.yaml 中配置好要打包的文件
 * 2、在 pubspec.yaml 中配置好 path_provider 插件，其用于获取不同平台的本地存储的路径
 */

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {

  var _blendMode = BlendMode.dst;
  var _boxFit = BoxFit.none;
  var _imageRepeat = ImageRepeat.noRepeat;

  void _changeBlendMode() {
    setState(() {
      var index = _blendMode.index + 1;
      if (index >= BlendMode.values.length) {
        index = 0;
      }
      _blendMode = BlendMode.values[index];
    });
  }

  void _changeBoxFit() {
    setState(() {
      var index = _boxFit.index + 1;
      if (index >= BoxFit.values.length) {
        index = 0;
      }
      _boxFit = BoxFit.values[index];
    });
  }

  void _changeImageRepeat() {
    setState(() {
      var index = _imageRepeat.index + 1;
      if (index >= ImageRepeat.values.length) {
        index = 0;
      }
      _imageRepeat = ImageRepeat.values[index];
    });
  }

  String _imagePath = "";
  Uint8List _imageData = Uint8List.fromList([]);

  /// 从 assets 中复制图片文件到本地存储，并获取图片的本地存储路径
  Future<void> loadImagePath() async {
    var bytes = await rootBundle.load("assets/son.jpg");
    String dir = (await getApplicationDocumentsDirectory()).path;
    _imagePath = '$dir/son.jpg';
    File(_imagePath).writeAsBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  }

  /// 从 assets 中获取图片的二进制数据
  Future<void> loadImageData() async {
    var bytes = await rootBundle.load("assets/son.jpg");
    _imageData = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// Image.asset() - 显示 assets 中的图片，也可以用类似这种方式 Image(image: AssetImage("assets/son.jpg"))
            Image.asset("assets/son.jpg",
              width: 100,                   /// 宽
              height: 50,                   /// 高
              color: Colors.red,            /// 颜色
              colorBlendMode: _blendMode,   /// 颜色与图片的混合模式（好多种，可以运行本例看不同模式的效果）
              fit: _boxFit,                 /// 拉伸方式
                                            ///   BoxFit.fill = 拉伸到目标大小
                                            ///   BoxFit.contain = 等比拉伸到目标大小，不剪裁，可能有黑边
                                            ///   BoxFit.cover = 等比拉伸到目标大小，并剪裁，不会有黑边
                                            ///   BoxFit.fitWidth = 等比拉伸，并保证宽度与目标宽度相同，需要则剪裁
                                            ///   BoxFit.fitHeight = 等比拉伸，并保证高度与目标高度相同，需要则剪裁
                                            ///   BoxFit.none = 与 BoxFit.cover 的逻辑相同
                                            ///   BoxFit.scaleDown = 与 BoxFit.contain 的逻辑相同
              repeat: _imageRepeat,         /// 拉伸方式为 BoxFit.contain 时，黑边的填充方式
                                            ///   ImageRepeat.repeat = 在 x 方向和 y 方向均重复图像，直到填满黑边为止
                                            ///   ImageRepeat.repeatX = 在 x 方向重复图像，直到填满 x 方向的黑边为止
                                            ///   ImageRepeat.repeatY = 在 y 方向重复图像，直到填满 y 方向的黑边为止
                                            ///   ImageRepeat.noRepeat = 不重复图像
              alignment: Alignment.center,  /// 图片的对齐方式，此值用于影响 fit 逻辑和 repeat 逻辑
                                            ///   比如此值为 center，则 fit 时需要剪裁则会剪裁四周，有黑边则在四周，repeat 会填充四周
                                            ///   比如此值为 topLeft，则 fit 时需要剪裁则会剪裁右下部分，有黑边则在右下部分，repeat 会填充右下部分
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  onPressed: _changeBlendMode,
                  child: Text("$_blendMode"),
                ),
                MyButton(
                  onPressed: _changeBoxFit,
                  child: Text("$_boxFit"),
                ),
                MyButton(
                  onPressed: _changeImageRepeat,
                  child: Text("$_imageRepeat"),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 300,
          height: 50,
          /// 本例用于演示图片的 9 切片的使用
          child: Image.asset("assets/dialog.png",
            fit: BoxFit.fill,
            /// centerSlice - 指定 9 切片矩形框
            /// Rect.fromLTWH(25, 25, 5, 5) 等同于 Rect.fromLTRB(25, 25, 30, 30)
            /// 原始图的尺寸是 113 * 48，矩形框是相对于原始图 25,25 点为起点，宽为 5 高为 5 的矩形框
            /// 9 切片的意思是，矩形框分出的 9 宫格，其中 4 个角不拉伸，左右块只垂直拉伸，上下块只水平拉伸，中间块全方向拉伸
            /// 所以 9 切片有个条件，即原始图片尺寸减去矩形框尺寸必须小于输出图片尺寸
            /// 本例原始图片高为 48，矩形高为 5，所以输出图片的高必须大于 48 - 5，也就是输出图片的高必须大于 43，否则会报错
            centerSlice: Rect.fromLTWH(25, 25, 5, 5),
          ),
        ),
        /// Image.network() - 显示网络图片，也可以用类似这种方式 Image(image: NetworkImage("http://xxx")),
        Image.network("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
          width: 100,
          height: 50,
          fit: BoxFit.fill,
        ),
        FutureBuilder(
          future: loadImagePath(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const MyText("loading");
            }
            /// Image.file() - 显示本地存储的图片，也可以用类似这种方式 Image(image: FileImage(file))
            return Image.file(File.fromUri(Uri.file(_imagePath)),
              width: 50,
              height: 50,
            );
          },
        ),
        FutureBuilder(
          future: loadImageData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const MyText("loading");
            }
            /// Image.file() - 显示内存中的图片，也可以用类似这种方式 Image(image: MemoryImage(bytes))
            return Image.memory(_imageData,
              width: 50,
              height: 50,
            );
          },
        ),
      ],
    );
  }
}