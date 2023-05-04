/*
 * File - 文件操作
 * Directory - 目录操作
 * File 和 Directory 都继承自 FileSystemEntity
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;

import '../helper.dart';

class FileDemo extends StatefulWidget {
  const FileDemo({Key? key}) : super(key: key);

  @override
  _FileDemoState createState() => _FileDemoState();
}

class _FileDemoState extends State<FileDemo> {

  String _content = "";
  Uint8List _imageData = Uint8List.fromList([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                /// 根据文件路径实例化 File 对象
                final file = File('${dir.path}/data.txt');
                /// 在指定的文件写入指定内容的文本，文件不存在则创建，文件存在则重写
                await file.writeAsString("hello ${currentTimestamp()}", encoding: utf8);
              },
              child: const Text('写文本文件',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                /// 根据文件路径实例化 File 对象
                final file = File('${dir.path}/data.txt');
                /// 从指定的文件读取文本内容
                final content = await file.readAsString(encoding: utf8);
                setState(() {
                  _content = content;
                });
              },
              child: const Text('读文本文件',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                /// 根据目录路径实例化 Directory 对象
                final myDir = Directory('${dir.path}/a/b/c');
                /// 判断目录是否存在
                var myDirExists = await myDir.exists();
                if (!myDirExists) {
                  /// 创建目录
                  /// recursive 为 true 则会递归创建多级目录
                  await myDir.create(recursive: true);
                }
              },
              child: const Text('创建目录',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                for (int i = 1; i < 10; i++) {
                  /// 根据文件路径实例化 File 对象
                  final file = File('${dir.path}/x/y/z/data$i.txt');
                  /// 判断文件是否存在
                  var fileExists = await file.exists();
                  /// 创建文件
                  /// recursive 为 true 则会递归创建多级目录
                  /// exclusive 为 true 则当文件存在时，会抛出异常
                  /// exclusive 为 false 则当文件存在时，不会做任何处理
                  file.create(recursive: true, exclusive: false);
                }
              },
              child: const Text('创建文件',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                /// 遍历指定的目录
                /// recursive 为 true 则会递归遍历多级目录
                var stream = dir.list(recursive: true);
                await for (final FileSystemEntity fse in stream) {
                  if (fse is File) {              /// 当前遍历出的结果是 File 对象
                    log('file: ${fse.path}');     /// File 的路径
                  } else if (fse is Directory) {  /// 当前遍历出的结果是 Directory 对象
                    log('dir: ${fse.path}');      /// Directory 的路径
                  }
                }
              },
              child: const Text('遍历目录和文件',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                final file = File('${dir.path}/son.jpg');
                var bytes = await rootBundle.load("assets/son.jpg");
                var imageData = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                /// 写入指定的二进制数据
                file.writeAsBytes(imageData);
              },
              child: const Text('写二进制数据',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                final file = File('${dir.path}/son.jpg');
                if (await file.exists()) {
                  /// 从指定的文件读取二进制内容
                  _imageData = await file.readAsBytes();
                  setState(() {});
                }
              },
              child: const Text('读二进制数据',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                final file = File('${dir.path}/son.jpg');
                if (await file.exists()) {
                  /// 删除指定的文件
                  await file.delete();
                }
                /// 删除指定的目录
                /// recursive 为 true 则会递归删除多级目录以及目录中的文件
                await dir.delete(recursive: true);
              },
              child: const Text('删除目录和文件',),
            ),
            ElevatedButton(
              onPressed: () async {
                var dir = await getApplicationDocumentsDirectory();
                final file = File('${dir.path}/son.jpg');
                /// 重命名
                /// await file.rename("new name");
                /// 复制文件
                /// await file.copy("new path");
                /// 获取当前文件的目录
                /// var parentDir = file.parent;
                /// 获取文件的大小
                /// var length = await file.length();
                /// 获取文件的最近访问时间
                /// var lastAccessed = await file.lastAccessed();
                /// 获取文件的最近修改时间
                /// var lastModified = await file.lastModified();
                /// 设置文件的最近访问时间
                /// await file.setLastAccessed(DateTime.now());
                /// 设置文件的最近修改时间
                /// await file.setLastModified(DateTime.now());

                /// 获取当前文件的状态
                var stat = await file.stat();
                setState(() {
                  /// size - 文件大小
                  /// accessed - 最近访问时间
                  /// modified - 最近修改时间
                  /// type - 当前 FileSystemEntity 的类型
                  ///   FileSystemEntityType.file - 文件
                  ///   FileSystemEntityType.directory - 目录
                  ///   FileSystemEntityType.notFound - 不存在
                  _content = 'size:${stat.size}, accessed:${stat.accessed}, modified:${stat.modified}, type:${stat.type}';
                });
              },
              child: const Text('其他操作',),
            ),

            MyTextSmall(_content),
            Builder(
              builder: (BuildContext context) {
                if (_imageData.isEmpty) {
                  return Container();
                } else {
                  return Image.memory(_imageData,
                    width: 50,
                    height: 50,
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}