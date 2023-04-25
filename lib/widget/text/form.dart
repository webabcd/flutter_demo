/*
 * Form - 表单
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {

  /// 用于验证指定的表单是否合法
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 表单元素有 TextFormField, InputDatePickerFormField, DropdownButtonFormField 等
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'hintText',
              ),
              /// 用于验证当前输入是否合法
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  /// 不合法，返回错误的提示信息
                  return "请输入内容";
                }
                /// 合法
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'hintText',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty || value.length <= 10) {
                  return "输入内容的字符数要大于 10";
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  /// 验证表单是否合法
                  if (_formKey.currentState!.validate()) {
                    log("已通过验证");
                  } else {
                    log("未通过验证");
                  }
                },
                child: const Text('提交'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}