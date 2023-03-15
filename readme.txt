1、flutter 官网 https://flutter.dev/
2、windows 环境的 flutter sdk 下载地址和安装说明 https://docs.flutter.dev/get-started/install/windows
  注：别忘了在 File->Settings->Languages & Frameworks->Flutter 中指定 flutter sdk 的路径
3、android studio 的 settings 的 plugins 中安装 flutter 插件
4、macos 环境的 flutter sdk 下载地址和安装说明 https://docs.flutter.dev/get-started/install/macos
  我在 macos 中用的是 vscode
  a) 下载 flutter sdk 并配置环境变量
  b) 安装 vscode，以及 flutter 插件和 dart 插件
  c) 在 vscode 的右下角可以选择调试的设备或模拟器
  d) 以本例为例，通过 ctrl + ~ 打开终端窗口，然后进入 FlutterDemo 目录
    1. 然后运行 flutter run，但是这个不会自动 hot reload，需要运行后通过输入 r 做手动 hot reload
    2. 直接通过 ctrl + f5 运行，这个是自动 hot reload 的
  注：如果运行报错，比如 Target of URI doesn't exist 'package:xxx'，则在终端窗口运行一下 flutter pub get 即可
5、启动 web 的命令为 flutter run -d chrome
6、在已有的 flutter 项目中追加 windows, macos, linux 的支持需要先执行 flutter create --platforms=windows,macos,linux .
  如果出现 "..." is not a valid Dart package name. 错误，是因为项目的根目录的目录名有大写字母，都改成小写就好了
7、启动 windows 的命令为 flutter run -d windows
  如果出现 Unable to find suitable Visual Studio toolchain. 错误，则需要在安装 visual studio 的时候勾选“使用 C++ 的桌面开发”


提示：
1、如果运行时卡在 Running Gradle task 'assembleDebug' 的话，则翻墙跑一遍即可
2、查看 flutter 版本用 flutter --version，更新 flutter 版本用 flutter upgrade，获取 pub 包用 flutter pub get，更新 pub 包用 flutter pub upgrade
3、更新 dart 版本时，除了要更新 pub 包外，还要在 pubspec.yaml 中指定你的 dart 的版本，需要修改的地方如下
environment:
  sdk: ">=2.19.2 <3.0.0"

镜像：
不能翻墙的话就镜像，执行如下命令即可
set PUB_HOSTED_URL=https://pub.flutter-io.cn
set FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn