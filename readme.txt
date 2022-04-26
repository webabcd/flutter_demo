1、flutter 官网 https://flutter.dev/
2、windows 环境的 flutter sdk 下载地址和安装说明 https://docs.flutter.dev/get-started/install/windows
3、android studio 的 settings 的 plugins 中安装 flutter 插件
  注：如果运行时卡在 Running Gradle task 'assembleDebug' 的话，则翻墙跑一遍即可
4、macos 环境的 flutter sdk 下载地址和安装说明 https://docs.flutter.dev/get-started/install/macos
  我在 macos 中用的是 vscode
  a) 下载 flutter sdk 并配置环境变量
  b) 安装 vscode，以及 flutter 插件和 dart 插件
  c) 在 vscode 的右下角可以选择调试的设备或模拟器
  d) 以本例为例，通过 ctrl + ~ 打开终端窗口，然后进入 FlutterDemo 目录
    1. 然后运行 flutter run，但是这个不会自动 hot reload，需要运行后通过输入 r 做手动 hot reload
    2. 直接通过 ctrl + f5 运行，这个是自动 hot reload 的
  注：如果运行报错，比如 Target of URI doesn't exist 'package:xxx'，则在终端窗口运行一下 flutter packages get 即可