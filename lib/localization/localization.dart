/*
 * Localization - 国际化
 *
 * 1、在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dependencies:
 *   flutter_localizations:
 *     sdk: flutter
 *   localization: ^2.1.0
 * 2、在 pubspec.yaml 中配置国际化文件的存放位置（i18n 的意思是 internationalization 的首末字符i和n，18为中间的字符数）
 * flutter:
 *   assets:
 *     - assets/i18n/
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

class LocalizationDemo extends StatefulWidget {
  const LocalizationDemo({Key? key}) : super(key: key);

  @override
  _LocalizationDemoState createState() => _LocalizationDemoState();
}

class _LocalizationDemoState extends State<LocalizationDemo> {

  late Locale _locale;

  /// 手动切换语言
  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {

    _locale = const Locale("en");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    /// 设置 json 文件（国际化文件）的目录，需要先在 pubspec.yaml 中配置好
    LocalJsonLocalization.delegate.directories = ['assets/i18n'];
    
    return MaterialApp(

      /// 可支持的语言
      supportedLocales: const [
        Locale("en"),
        Locale("zh"),
      ],

      /// 当前需要使用的语言
      locale: _locale,

      localizationsDelegates: [
        /// 为 Material 组件库提供国际化的支持（比如组件上的文字，左右方向之类的会自动使用你 locale 指定的语言）
        GlobalMaterialLocalizations.delegate,
        /// 为 Widgets 组件库提供国际化的支持（比如组件上的文字，左右方向之类的会自动使用你 locale 指定的语言）
        GlobalWidgetsLocalizations.delegate,
        /// 为 Cupertino 组件库提供国际化的支持（比如组件上的文字，左右方向之类的会自动使用你 locale 指定的语言）
        GlobalCupertinoLocalizations.delegate,

        /// 使用 json 文件配置的自定义国际化
        LocalJsonLocalization.delegate,
      ],

      /// 切换语言后触发的事件（如果在 localeListResolutionCallback 做处理了则不会走到这里）
      ///   locale - 用户选中的语言
      ///   supportedLocales - 可支持的语言集合
      localeResolutionCallback: (locale, supportedLocales) {
        log("localeResolutionCallback: $locale, $supportedLocales");
        if (supportedLocales.contains(locale)) {
          /// 使用此语言的国际化
          return locale;
        }
        /// 使用此语言的国际化
        return const Locale('en');
      },

      /// 切换语言后触发的事件（如果在这里处理了，则不会走到 localeResolutionCallback）
      ///   locales - 用户的首选语言集合
      ///   supportedLocales - 可支持的语言集合
      localeListResolutionCallback: (locales, supportedLocales) {
        log("localeListResolutionCallback: $locales, $supportedLocales");
        if (supportedLocales.contains(locales![0])) {
          /// 使用此语言的国际化
          return locales![0];
        }
        /// 使用此语言的国际化
        return const Locale('en');
      },

      home: const _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {

    /// 获取当前使用的语言
    final locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText("locale: $locale"),
                /// 使用 json 文件中配置的国际化
                MyText("hello".i18n()),
                /// 使用 json 文件中配置的国际化（支持 %s 格式化）
                MyText("wh".i18n(['200', '100'])),
              ],
            ),
          );
        },
      ),
      persistentFooterButtons: [
        MyButton(
          onPressed: () {
            final myApp = context.findAncestorStateOfType<_LocalizationDemoState>()!;
            /// 切换为中文
            myApp.changeLocale(const Locale('zh'));
          },
          child: const Text("中文"),
        ),
        MyButton(
          onPressed: () {
            final myApp = context.findAncestorStateOfType<_LocalizationDemoState>()!;
            /// 切换为英文
            myApp.changeLocale(const Locale('en'));
          },
          child: const Text("英文"),
        ),
      ],
    );
  }
}