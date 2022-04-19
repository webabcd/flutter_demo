/*
 * TextField - 文本输入框
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  String? _errorText;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// 注：TextField 必须放到一个 Material 组件内，否则会报错
    return Scaffold(
      /// resizeToAvoidBottomInset - 设置为 true 则会自动滚动，以避免弹出的软键盘遮住输入框的问题
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            onSubmitted: (String text) {
              setState(() {
                if (text == "" || text.length > 5) {
                  // InputDecoration 的 errorText 为 null 则 helperText 生效
                  _errorText = null;
                } else {
                  // InputDecoration 的 errorText 不为 null 则 errorText 生效，而 helperText 无效
                  _errorText = "errorText";
                }
              });
            },
            /// decoration - 用于定义 TextField 的装饰
            decoration: InputDecoration(
              labelText: "labelText",                                 /// 用于描述输入框的文本，也可以通过 label 属性指定一个自定义 Widget
              labelStyle: TextStyle(color: Colors.red,),              /// labelText 的样式
              floatingLabelStyle: TextStyle(color: Colors.green,),    /// labelText 上浮后的样式（默认行为是：输入框获取焦点后，labelText 会上浮）
              floatingLabelAlignment: FloatingLabelAlignment.start,   /// labelText 上浮后与输入框之间的对齐方式（start, center）
              floatingLabelBehavior: FloatingLabelBehavior.auto,      /// labelText 的上浮行为（auto获取焦点则上浮；always总是上浮；never获取焦点则隐藏）
              helperText: "helperText",                               /// 输入框左下角的文本
              helperStyle: TextStyle(color: Colors.blue,),            /// helperText 的样式
              helperMaxLines: 1,                                      /// helperText 的最大行数
              errorText: _errorText,                                  /// 输入框左下角的文本，指定了此值则 helperText 无效
              errorStyle: TextStyle(color: Colors.red,),             /// errorText 的样式
              errorMaxLines: 1,                                       /// errorText 的最大行数
              counterText: "counterText",                             /// 输入框右下角的文本，也可以通过 counter 属性指定一个自定义 Widget
              counterStyle: TextStyle(color: Colors.blue,),           /// counterText 的样式
              hintText: "hintText",                                   /// 输入的提示信息，就是 placeholder 的意思
              hintStyle: TextStyle(color: Colors.yellow,),            /// hintStyle 的样式
              hintMaxLines: 1,                                        /// hintStyle 的最大行数

              icon: Icon(Icons.person),                               /// 输入框整体左侧的图标
              prefixIcon: Icon(Icons.add),                            /// 输入框内部左侧的图标，可以通过 prefixIconConstraints 指定此图标的范围约束
              prefixText: "prefixText",                               /// 输入框内部左侧的文本，也可以通过 prefix 属性指定一个自定义 Widget
              prefixStyle: TextStyle(color: Colors.white,),           /// prefixText 的样式
              suffixIcon: Icon(Icons.circle),                         /// 输入框内部右侧的图标，可以通过 suffixIconConstraints 指定此图标的范围约束
              suffixText: "suffixText",                               /// 输入框内部右侧的文本，也可以通过 suffix 属性指定一个自定义 Widget
              suffixStyle: TextStyle(color: Colors.white,),           /// suffixText 的样式

              contentPadding: EdgeInsets.all(10),                     /// 内边距
              filled: true,                                           /// 是否使 fillColor 属性生效
              fillColor: Colors.orange,                               /// 输入框的背景色
              enabled: true,                                          /// 输入框是否可编辑

              enabledBorder: UnderlineInputBorder(                    /// enabled 为 true 时的边框（UnderlineInputBorder - 下划线边框）
                borderSide: BorderSide(width: 5, color: Colors.green),
              ),
              disabledBorder: InputBorder.none,                       /// enabled 为 false 时的边框（InputBorder.none - 无边框）
              errorBorder: OutlineInputBorder(                        /// errorText 有值时的边框（OutlineInputBorder - 四周边框）
                borderSide: const BorderSide(width: 5, color: Colors.green),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: UnderlineInputBorder(                    /// 获取焦点时的边框
                borderSide: BorderSide(width: 5, color: Colors.blue),
              ),
              focusedErrorBorder: UnderlineInputBorder(               /// 获取焦点时且 errorText 有值时的边框
                borderSide: BorderSide(width: 5, color: Colors.red),
              ),
            ),
          ),
          /// 注：为了避免弹出的软键盘遮住输入框，请设置 Scaffold 的 resizeToAvoidBottomInset 为 true（这样当弹出软键盘时，其会自动滚动，以避免弹出的软键盘遮住输入框的问题）
          TextField(
            keyboardType: TextInputType.text,                 /// 软键盘的类型（text, url, number 等），设置为 none 则不会弹出软键盘
            textInputAction: TextInputAction.search,          /// 软键盘的右下角的按钮的样式和行为（search, go, done, send 等）
            textCapitalization: TextCapitalization.none,      /// 大小写行为（none默认全小写；characters默认全大写；words每个单词的首字母大写；sentences每个句子的首字母大写）
            textAlign: TextAlign.start,                       /// 文字的对齐方式
            textDirection: TextDirection.ltr,                 /// 文字的方向
            obscureText: false,                               /// 是否是密码框（如果输入框是多行的则不能设置为密码框）
            obscuringCharacter: '*',                          /// 密码框的替代字符
            autocorrect: false,                               /// 是否自动校正
            style: TextStyle(color: Colors.red),              /// 样式
            readOnly: false,                                  /// 是否只读
            enabled: true,                                    /// 是否可以响应点击事件
            autofocus: true,                                  /// 是否自动获取焦点
            showCursor: true,                                 /// 是否显示光标
            cursorColor: Colors.red,                          /// 光标的颜色
            cursorWidth: 5,                                   /// 光标的宽度
            cursorRadius: Radius.circular(5),                 /// 光标的圆角
            enableInteractiveSelection: true,                 /// 长按时是否显示“剪切/复制/粘贴”菜单
            minLines: 4,                                      /// 最小行数（用于设置输入框的最小高度）
            maxLines: 10,                                     /// 最大行数（用于设置输入框的最大高度）
            maxLength: 100,                                   /// 最大字符数（输入框右下角会显示字符数量）
            maxLengthEnforcement: MaxLengthEnforcement.none,  /// 超过最大字符数时的处理方式（none不处理；enforced禁止输入）
            inputFormatters: [                                /// 输入数据限制器
              LengthLimitingTextInputFormatter(500),                /// 最大字符数限制
              FilteringTextInputFormatter.allow(RegExp(r'[a-z]')),  /// 自定义限制逻辑
            ],
          ),
          Container(
            height: 100,
            color: Colors.orange,
            child: TextField(
              textInputAction: TextInputAction.done,
              minLines: null,
              maxLines: null,
              expands: true,            /// expands 设置为 true 时（minLines 和 maxLines 必须要设置为 null），输入框的高度会自动与父同高
              controller: _controller,  /// 输入框的控制器，以便外部控制输入框
              onChanged: (v) {          /// 输入框中的文本发生变化时触发的事件
                log("onChanged: $v");
              },
              onSubmitted: (v) {        /// 用户按了软键盘右下角的 TextInputAction.done 按钮后触发的事件
                log("onSubmitted: $v");
              },
            ),
          ),
          MyButton(
            onPressed: () {
              _controller.text = "webabcd";             /// 通过 controller 设置输入框的文本
              setState(() {
                _controller.selection = TextSelection(  /// 通过 controller 设置输入框中被选中的文本
                    baseOffset: 3,                      ///   被选中文本的起始位置
                    extentOffset:6                      ///   被选中文本的结束位置
                );
              });
              log(_controller.text);                    /// 通过 controller 获取输入框的文本
            },
            child: Text("设置/选中/获取文本框的文本"),
          ),
        ],
      ),
    );
  }
}