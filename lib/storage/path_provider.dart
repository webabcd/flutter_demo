/*
 * path_provider - 用于获取不同平台的本地存储的路径
 *
 * 在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dev_dependencies:
 *   flutter_test:
 *     sdk: flutter
 *   path_provider: ^2.0.0
 *
 *
 * 常用的目录如下：
 * getTemporaryDirectory()
 *   ios 的 NSCachesDirectory - 在设备可用空间极少时，可能会被系统清除
 *   android 的 getCacheDir() - 存放的数据可能会被系统主动删除（比如系统认为存储空间不够的时候），用户在设置中的“应用信息”中单击“清除缓存”后会删除
 * getApplicationSupportDirectory()
 *   ios 的 NSApplicationSupportDirectory - 不会被系统清除，会被自动 iCloud/iTunes 备份（不需要的话可以通过接口禁用指定路径的自动备份），一般用于保存非用户生成的必需数据
 *   android 的 getFilesDir() - 存放的数据系统不会主动删除，用户在设置中的“应用信息”中单击“清除数据”后会删除
 * getApplicationDocumentsDirectory()
 *   ios 的 NSDocumentDirectory - 不会被系统清除，会被自动 iCloud/iTunes 备份（不需要的话可以通过接口禁用指定路径的自动备份），一般用于保存用户生成的必需数据
 *   android 的 getDataDir() + "/app_flutter/" - 内部存储根目录（类似 /data/data/packagename/app_flutter/）
 *
 * 不常用的目录如下：
 * getLibraryDirectory() - 获取 ios 的 Library 目录
 * getExternalStorageDirectory(), getExternalStorageDirectories(), getExternalCacheDirectories() - 获取 android 的外部存储相关的目录
 * getDownloadsDirectory() - 获取桌面程序的下载目录
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../helper.dart';

class PathProviderDemo extends StatefulWidget {
  const PathProviderDemo({Key? key}) : super(key: key);

  @override
  _PathProviderDemoState createState() => _PathProviderDemoState();
}

class _PathProviderDemoState extends State<PathProviderDemo> {
  Future<Directory?>? _tempDirectory;
  Future<Directory?>? _appSupportDirectory;
  Future<Directory?>? _appDocumentsDirectory;

  Widget _buildDirectory(BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    var result = "";
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        result = 'error: ${snapshot.error}';
      } else if (snapshot.hasData) {
        result = 'path: ${snapshot.data!.path}';
      } else {
        result = 'path unavailable';
      }
    }
    return MyTextSmall(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      /// ios 地址类似 xxx/Library/Caches
                      /// android 地址类似 /data/user/0/packagename/cache
                      _tempDirectory = getTemporaryDirectory();
                    });
                  },
                  child: const Text('getTemporaryDirectory()',),
                ),
                FutureBuilder<Directory?>(
                  future: _tempDirectory,
                  builder: _buildDirectory,
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      /// ios 地址类似 xxx/Library/Application Support
                      /// android 地址类似 /data/user/0/packagename/files
                      _appSupportDirectory = getApplicationSupportDirectory();
                    });
                  },
                  child: const Text('getApplicationSupportDirectory()',),
                ),
                FutureBuilder<Directory?>(
                  future: _appSupportDirectory,
                  builder: _buildDirectory,
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      /// ios 地址类似 xxx/Documents
                      /// android 地址类似 /data/user/0/packagename/app_flutter
                      _appDocumentsDirectory = getApplicationDocumentsDirectory();
                    });
                  },
                  child: const Text('getApplicationDocumentsDirectory()',),
                ),
                FutureBuilder<Directory?>(
                  future: _appDocumentsDirectory,
                  builder: _buildDirectory,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}