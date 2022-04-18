// https://blog.csdn.net/yuzhiqiang_1993/article/details/88204031
/*
 *
 *
 */

import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  String _errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            onSubmitted: (String text) {
              setState(() {
                if (text != "abc") {
                  _errorText = 'Error: This is not an email';
                } else {
                  _errorText = "";
                }
              });
            },
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: "labelText",
              labelStyle: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.purple,//绿色
                fontSize: 40,//字体变大
              ),
              helperText: "helperText",
              helperStyle: TextStyle(
                color: Colors.green,//绿色
                fontSize: 20,//字体变大
              ),
              errorText: _errorText, // /定义时,helperText会被替换掉,并修改labelTextStyle
              errorStyle: TextStyle(
                color: Colors.orange,//绿色
                fontSize: 20,//字体变大
              ),
              hintText: "hintText",
            ),
          ),
          TextField(
            decoration: InputDecoration(

            ),
          ),
        ],
      ),
    );
  }
}