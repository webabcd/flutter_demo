/*
 * 状态管理 - 在树上，父监听子的通知
 *
 * 在树上，子通过 Notification 触发通知，父通过 NotificationListener 监听通知
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class NotificationListenerDemo extends StatefulWidget {
  const NotificationListenerDemo({Key? key}) : super(key: key);

  @override
  _NotificationListenerDemoState createState() => _NotificationListenerDemoState();
}

class _NotificationListenerDemoState extends State<NotificationListenerDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 监听子触发的通知
      body: NotificationListener<_MyNotification>(
        onNotification: (notification) {
          log('aaa ${notification.id}, ${notification.message}');
          /// 是否已处理
          /// true - 不冒泡
          /// false - 冒泡
          return true;
        },
        /// 监听子触发的通知
        child: NotificationListener<_MyNotification>(
          onNotification: (notification) {
            log('bbb ${notification.id}, ${notification.message}');
            /// 是否已处理
            /// true - 不冒泡
            /// false - 冒泡
            return false;
          },
          child: Builder(builder: (context) {
            return Center(
              child: MyButton(
                onPressed: () {
                  /// 触发通知
                  _MyNotification(999, 'abc').dispatch(context);
                },
                child: const MyText('触发 _MyNotification 通知'),
              ),
            );
          }),
        ),
      ),
    );
  }
}

/// 自定义 Notification
class _MyNotification extends Notification {
  _MyNotification(this.id, this.message);

  final int id;
  final String message;
}