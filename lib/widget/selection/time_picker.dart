/*
 * showDatePicker()/showTimePicker/CalendarDatePicker - 日期选择和时间选择
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({Key? key}) : super(key: key);

  @override
  _TimePickerDemoState createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {

  /// 切换语言
  var _locale = const Locale("en");
  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const _MyHomePage(),

      /// 国际化相关
      locale: _locale,
      supportedLocales: const [
        Locale("en"),
        Locale("zh"),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// 弹出日历选择控件
            _showDatePicker(context),
            /// 弹出日历选择控件，并指定其主题
            _showDatePickerUseTheme(context),
            /// 弹出时间选择控件
            _showTimePicker(context),
            /// 弹出时间选择控件，并指定其主题，并设置为 24 小时制
            _showTimePickerUseThemeAnd24HourFormat(context),
            /// 显示日历选择控件（直接在当前页面上显示，而不是弹出来）
            SizedBox(width: 300, height: 150, child: _calendarDatePicker(),),
          ],
        ),
      ),
      persistentFooterButtons: [
        MyButton(
          onPressed: () {
            final myApp = context.findAncestorStateOfType<_TimePickerDemoState>()!;
            myApp.changeLocale(const Locale('zh'));
          },
          child: const Text("中文"),
        ),
        MyButton(
          onPressed: () {
            final myApp = context.findAncestorStateOfType<_TimePickerDemoState>()!;
            myApp.changeLocale(const Locale('en'));
          },
          child: const Text("英文"),
        ),
      ],
    );
  }

  MyButton _showDatePicker(context) {
    return MyButton(
      child: const Text("showDatePicker"),
      onPressed: () async {
        /// 弹出日历选择控件
        var selectedDate = await showDatePicker(
          /// BuildContext
          context: context,
          /// 国际化
          locale: context.findAncestorStateOfType<_TimePickerDemoState>()!._locale,

          /// 日历选择框的样式
          ///   calendar - 默认日历选择，也可以手工输入
          ///   input - 默认手工输入，也可以日历选择
          ///   calendarOnly - 仅日历选择
          ///   inputOnly - 仅手工输入
          initialEntryMode: DatePickerEntryMode.calendar,
          /// day - 初始在选择日期的页面
          /// year - 初始在选择年份的页面
          initialDatePickerMode: DatePickerMode.day,

          /// 当前日期
          currentDate: DateTime.now(),
          /// 默认的选中日期
          initialDate: DateTime.now().add(const Duration(days: -10)),
          /// 支持的最小的可选日期
          firstDate: DateTime.now().add(const Duration(days: -365 * 2)),
          /// 支持的最大的可选日期
          lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
          /// 用于设置哪些日期可选，哪些日期不可选
          selectableDayPredicate: (dayTime) {
            if (dayTime.isAfter(DateTime.now().add(const Duration(days: 3))) &&
                dayTime.isBefore(DateTime.now().add(const Duration(days: 10))) ) {
              return false; /// 不可选
            }
            return true;    /// 可选
          },
          /// 左上角文字
          helpText: "helpText",
          /// 取消按钮文字
          cancelText: "cancelText",
          /// 确认按钮文字
          confirmText: "confirmText",
          /// 输入日期格式错误时的提示
          errorFormatText: "errorFormatText",
          /// 输入日期为不可选日期时的提示
          errorInvalidText: "errorInvalidText",
          /// 输入日期时，输入框上方的提示
          fieldLabelText: "fieldLabelText",
          /// 输入日期时，输入框内容为空时的提示，就是 placeholder 的意思
          fieldHintText: "fieldHintText",
        );

        /// 获取选中的日期
        showToast(context, "selectedDate:$selectedDate");
      },
    );
  }

  MyButton _showDatePickerUseTheme(context){
    return MyButton(
      child: const Text("showDatePicker（自定义主题）"),
      onPressed: () async {
        /// 弹出日历选择控件，并指定其主题
        var selectedDate = await showDatePicker(
          context: context,
          locale: context.findAncestorStateOfType<_TimePickerDemoState>()!._locale,
          initialDate: DateTime.now().add(const Duration(days: -10)),
          firstDate: DateTime.now().add(const Duration(days: -365 * 2)),
          lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
          builder: (context, child) {
            return Theme( /// 使用自定义主题
              data: ThemeData(
                cardColor: Colors.red,
                brightness: Brightness.dark,
              ),
              child: child!,
            );
          },
        );

        /// 获取选中的日期
        showToast(context, "selectedDate:$selectedDate");
      },
    );
  }

  MyButton _showTimePicker(context){
    return MyButton(
      child: const Text("showTimePicker"),
      onPressed: () async {
        /// 弹出时间选择控件
        var selectedTime = await showTimePicker(
          /// BuildContext
          context: context,
          /// 默认的选中时间
          initialTime: const TimeOfDay(hour: 10, minute: 30),
          /// 时间选择框的样式
          ///   dial - 默认表盘选择，也可以手工输入
          ///   input - 默认手工输入，也可以表盘选择
          ///   dialOnly - 仅表盘选择
          ///   inputOnly - 仅手工输入
          initialEntryMode: TimePickerEntryMode.dial,
          /// 左上角文字
          helpText: "helpText",
          /// 取消按钮文字
          cancelText: "cancelText",
          /// 确认按钮文字
          confirmText: "confirmText",
          /// 输入的时间非法时显示的信息
          errorInvalidText: "errorInvalidText",
          /// 输入时间时，小时框下的提示文字
          hourLabelText: "hourLabelText",
          /// 输入时间时，分钟框下的提示文字
          minuteLabelText: "minuteLabelText",
        );

        /// 获取选中的时间
        showToast(context, "selectedTime:$selectedTime");
      },
    );
  }

  MyButton _showTimePickerUseThemeAnd24HourFormat(context){
    return MyButton(
      child: const Text("showTimePicker（自定义主题，以及 24 小时制）"),
      onPressed: () async {
        /// 弹出时间选择控件，并指定其主题，并设置为 24 小时制
        var selectedTime = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 10, minute: 30),
          initialEntryMode: TimePickerEntryMode.dial,
          builder: (context, child) {
            return Theme( /// 使用自定义主题
              data: ThemeData(
                cardColor: Colors.red,
                brightness: Brightness.dark,
              ),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), /// 使用 24 小时制
                child: child!,
              ),
            );
          },
        );

        /// 获取选中的时间
        showToast(context, "selectedTime:$selectedTime");
      },
    );
  }

  /// 显示日历选择控件（直接在当前页面上显示，而不是弹出来）
  /// 类似的 ios 风格的控件有 CupertinoDatePicker, CupertinoTimerPicker
  CalendarDatePicker _calendarDatePicker() {
    return CalendarDatePicker(
      currentDate: DateTime.now(),
      initialDate: DateTime.now().add(const Duration(days: -10)),
      firstDate: DateTime.now().add(const Duration(days: -365 * 2)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      initialCalendarMode: DatePickerMode.day,
      /// 选择的日期发生变化时
      onDateChanged: (dateTime){
        log("onDateChanged:$dateTime");
      },
      /// 因为切换年或月导致的选择的日期发生变化时
      onDisplayedMonthChanged: (dateTime){
        log("onDisplayedMonthChanged:$dateTime");
      },
    );
  }
}

