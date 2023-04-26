/*
 * Autocomplete - 自动完成
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class AutocompleteDemo extends StatefulWidget {
  const AutocompleteDemo({Key? key}) : super(key: key);

  @override
  _AutocompleteDemoState createState() => _AutocompleteDemoState();
}

class _AutocompleteDemoState extends State<AutocompleteDemo> {

  static const List<String> _options = <String>[
    'aaaaaa',
    'aaabbb',
    'aabbcc',
    '111111',
    '111222',
    '112233',
  ];

  static const List<_MyUser> _options2 = <_MyUser>[
    _MyUser(name: 'aaaaaa', email: 'aaaaaa@xxxxxx.com'),
    _MyUser(name: 'aaabbb', email: 'aaabbb@xxxyyy.com'),
    _MyUser(name: 'aabbcc', email: 'aabbcc@xxyyzz.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// 自动完成的可选数据是 String 类型的数据
          Autocomplete<String>(
            /// 根据用户的输入，构造可选数据的数据源
            optionsBuilder: (TextEditingValue textEditingValue) {
              /// 获取用户的输入内容
              log('input: ${textEditingValue.text}');
              /// 用户输入的内容为空时，则可选数据为空
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              /// 根据用户的输入，返回符合要求的可选数据列表
              return _options.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            /// 从可选数据列表框中选中某一项时的回调
            onSelected: (String selection) {
              log('onSelected: $selection');
            },
            /// 可选数据列表框的最大高度
            optionsMaxHeight: 100,
            /// 初始的输入内容
            initialValue: const TextEditingValue(text: "1"),
          ),

          /// 自动完成的可选数据是 _MyUser 类型的数据
          Autocomplete<_MyUser>(
            /// 根据用户的输入，构造可选数据的数据源
            optionsBuilder: (TextEditingValue textEditingValue) {
              log('input: ${textEditingValue.text}');
              if (textEditingValue.text == '') {
                return const Iterable<_MyUser>.empty();
              }
              return _options2.where((_MyUser user) {
                return user.toString().contains(textEditingValue.text.toLowerCase());
              });
            },
            /// 自定义可选数据列表框的显示内容和样式等
            ///   options 是 optionsBuilder 筛选出的可选数据
            ///   onSelected 用于选中某一项时触发回调
            optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<_MyUser> onSelected, Iterable<_MyUser> options) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var user = options.elementAt(index);
                      return ListTile(
                        onTap: () {
                          /// 回调，Autocomplete 的 onSelected() 会收到此回调
                          onSelected.call(user);
                        },
                        title: Text('name:${user.name}, email:${user.email}'),
                      );
                    },
                    itemCount: options.length,
                  ),
                ),
              );
            },

            /// 从可选数据列表框中选中某一项后，可以通过这里格式化选中的内容
            displayStringForOption: (_MyUser user) => "selected: " + user.toString(),
            /// 自定义 Autocomplete 的样式和行为等
            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                onFieldSubmitted: (String value) {
                  /// 调用 onFieldSubmitted() 之后才能走到 Autocomplete 的 optionsBuilder()
                  onFieldSubmitted();
                },
                /// 用于定义 Autocomplete 的样式
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.green),
                  ),
                ),
              );
            },

            /// 从可选数据列表框中选中某一项时的回调
            onSelected: (_MyUser user) {
              log('onSelected: ${user.toString()}');
            },
          ),
        ],
      ),
    );
  }
}

class _MyUser {
  const _MyUser({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  String toString() {
    return '$name, $email';
  }
}