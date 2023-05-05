/*
 * rootBundle - 访问程序内资源
 *
 * 在 pubspec.yaml 中配置需要打包的程序内资源，可以按文件配置，也可以按文件夹配置，类似如下
 * flutter:
 *   assets:
 *     - assets/README.md
 *     - assets/son.jpg
 *     - assets/i18n/
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper.dart';

class RootBundleDemo extends StatefulWidget {
  const RootBundleDemo({Key? key}) : super(key: key);

  @override
  _RootBundleDemoState createState() => _RootBundleDemoState();
}

class _RootBundleDemoState extends State<RootBundleDemo> {

  Future<String> _loadStringData() async {
    /// rootBundle.loadString() 以文本的方式读取程序内的指定的资源
    return rootBundle.loadString('assets/README.md');
  }

  Future<Uint8List> _loadBinaryData() async {
    /// rootBundle.load() 以二进制的方式读取程序内的指定的资源
    var byteData = await rootBundle.load("assets/son.jpg");
    return byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: _loadStringData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return MyTextSmall(snapshot.data!.substring(0, 200));
                  } else if (snapshot.hasError) {
                    return MyText('error: ${snapshot.error}');
                  }
                }
                return const MyText('loading');
              },
            ),
            FutureBuilder(
              future: _loadBinaryData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Image.memory(snapshot.data!,
                      width: 50,
                      height: 50,
                    );
                  } else if (snapshot.hasError) {
                    return MyText('error: ${snapshot.error}');
                  }
                }
                return const MyText('loading');
              },
            ),
          ],
        ),
      ),
    );
  }
}