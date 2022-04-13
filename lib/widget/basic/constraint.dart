/*
 * constraint - 约束
 * 本例通过一些示例介绍了 flutter 中的约束
 *
 *
 * 约束的流程是这样的：
 * 1、子先从父那里拿到约束条件，所谓的约束条件就是：最小宽/最小高/最大宽/最大高
 * 2、然后子一个一个地告诉孙们，它们的约束都是什么，并且询问孙们想要多大的尺寸
 * 3、然后子一个一个地安排孙们的位置
 * 4、最后子告诉父自己的尺寸
 *
 * 也就是说：
 * 1、子只能在父给他的约束条件下决定自己的尺寸
 * 2、子的显示位置是由父决定的
 *
 * 也就是说：
 * 1、约束是从上向下传递的
 * 2、尺寸是从下向上传递的
 * 3、父决定子的位置
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

const red = Colors.red;
const green = Colors.green;

class ConstraintDemo extends StatefulWidget {
  const ConstraintDemo({Key? key}) : super(key: key);

  final List<StatelessWidget> examples = const [
    Example1(),
    Example2(),
    Example3(),
    Example4(),
    Example5(),
    Example6(),
    Example7(),
    Example8(),
    Example9(),
    Example10(),
    Example11(),
    Example12(),
    Example13(),
    Example14(),
    Example15(),
    Example16(),
    Example17(),
    Example18(),
    Example19(),
    Example20(),
    Example21(),
  ];

  /// 所谓的 tight 约束，就是严格约束，比如
  /// BoxConstraints.tight(Size size)
  ///   : minWidth = size.width,
  ///     maxWidth = size.width,
  ///     minHeight = size.height,
  ///     maxHeight = size.height;
  ///
  /// 所谓的 loose 约束，就是宽松约束，比如
  /// BoxConstraints.loose(Size size)
  ///   : minWidth = 0.0,
  ///     maxWidth = size.width,
  ///     minHeight = 0.0,
  ///     maxHeight = size.height;

  @override
  _ConstraintDemoState createState() => _ConstraintDemoState();
}

class _ConstraintDemoState extends State<ConstraintDemo> {
  late int count;
  late Widget example;

  @override
  void initState() {
    super.initState();

    count = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: double.infinity,
                height: double.infinity
              ),
              child: widget.examples[count - 1],
            ),
          ),
          Wrap(
              children: [
                for (int i = 0; i < widget.examples.length; i++)
                  Container(
                    width: 58,
                    padding:
                    const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: getButton(i + 1),
                  ),
              ],
          ),
        ],
      ),
    );
  }

  Widget getButton(int exampleNumber) {
    return MyButton(
      isSelected: count == exampleNumber,
      exampleNumber: exampleNumber,
      onPressed: () {
        showExample(
          exampleNumber,
        );
      },
    );
  }

  void showExample(int exampleNumber) {
    setState(() {
      count = exampleNumber;
    });
  }
}

class MyButton extends StatelessWidget {
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.isSelected,
    required this.exampleNumber,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: isSelected ? Colors.orange[400] : Colors.orange[900],
      ),
      child: Text(exampleNumber.toString()),
      onPressed: () {
        onPressed();
      },
    );
  }
}

class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// Container 的父亲是屏幕，屏幕会强制 Container 的宽高与屏幕相同
    return Container(color: red);
  }
}

class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 此处指定 Container 的宽高是无效的，因为 Container 的父亲是屏幕，屏幕会强制 Container 的宽高与屏幕相同
    return Container(width: 100, height: 100, color: red);
  }
}

class Example3 extends StatelessWidget {
  const Example3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 Center 的宽高与屏幕相同
    /// Center 会让 Container 自行决定宽高，只要不超过 Center 的宽高即可
    return Center(
      child: Container(width: 100, height: 100, color: red),
    );
  }
}

class Example4 extends StatelessWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 Center 的宽高与屏幕相同
    /// Center 会让 Container 自行决定宽高，只要不超过 Center 的宽高即可
    /// 这里指定了 Container 的宽高为无穷大，但是因为不能超过 Center 的宽高，所以 Container 的宽高会与 Center 的宽高相同
    return Center(
      child: Container(width: double.infinity, height: double.infinity, color: red),
    );
  }
}

class Example5 extends StatelessWidget {
  const Example5({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 Center 的宽高与屏幕相同
    /// Center 会让 Container 自行决定宽高，只要不超过 Center 的宽高即可
    /// 这里没有指定 Container 的宽高，且 Container 也没有子，那么它就会尽可能的大，但是因为不能超过 Center 的宽高，所以 Container 的宽高会与 Center 的宽高相同
    return Center(
      child: Container(color: red),
    );
  }
}

class Example6 extends StatelessWidget {
  const Example6({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 Center 的宽高与屏幕相同
    /// Center 会让父 Container 自行决定宽高，只要不超过 Center 的宽高即可
    /// 这里没有指定父 Container 的宽高，但是父 Container 有一个子 Container，那么父 Container 会决定要与子 Container 的宽高相同
    /// 父 Container 会让子 Container 自行决定宽高，只要不超过 Center 的宽高即可
    /// 结果就是父 Container 与子 Container 的宽高相同，都是 30 × 30
    return Center(
      child: Container(
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

class Example7 extends StatelessWidget {
  const Example7({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 首先参见 Example6 的说明
    /// 父 Container 在决定与子 Container 的宽高相同时，还会考虑自己的 padding 属性
    /// 结果就是子 Container 的宽高是 30 × 30，而父 Container 的宽高是 70 × 70
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

class Example8 extends StatelessWidget {
  const Example8({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 ConstrainedBox 的宽高与屏幕相同
    /// ConstrainedBox 会强制 Container 的宽高与 ConstrainedBox 相同
    /// 也就是说下面指定的那些宽高都是没用的，要想这些宽高设置有用，可以考虑在外层加一个 Align, Center 之类的，具体说明可以参考上面的那些示例
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 50,
        minHeight: 50,
        maxWidth: 100,
        maxHeight: 100,
      ),
      child: Container(color: red, width: 20, height: 20),
    );
  }
}

class Example9 extends StatelessWidget {
  const Example9({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 UnconstrainedBox 的宽高与屏幕相同
    /// UnconstrainedBox 会让 Container 自行决定宽高，且没有任何限制
    return UnconstrainedBox(
      child: Container(color: red, width: 20, height: 20),
    );
  }
}

class Example10 extends StatelessWidget {
  const Example10({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 UnconstrainedBox 的宽高与屏幕相同
    /// UnconstrainedBox 会让 Container 自行决定宽高，且没有任何限制，但是如果超过了 UnconstrainedBox 的宽高则会有溢出警告
    return UnconstrainedBox(
      child: Container(color: red, width: 999999, height: 50),              // 有溢出警告
      // child: Container(color: red, width: double.infinity, height: 50),  // 如果你把宽高设置为 double.infinity 无限大，则会因 flutter 无法渲染而导致错误
    );
  }
}

class Example11 extends StatelessWidget {
  const Example11({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 OverflowBox 的宽高与屏幕相同
    /// OverflowBox 会让 Container 自行决定宽高，且没有任何限制，即使超过了 OverflowBox 的宽高也不会有溢出警告
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(color: red, width: 999999, height: 50),              // 无溢出警告
      // child: Container(color: red, width: double.infinity, height: 50),  // 如果你把宽高设置为 double.infinity 无限大，则会因 flutter 无法渲染而导致错误
    );
  }
}

class Example12 extends StatelessWidget {
  const Example12({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      /// LimitedBox 用于限制 UnconstrainedBox 的最大宽和最大高
      child: LimitedBox(
        maxWidth: 100,
        maxHeight: 100,
        child: Container(
          color: Colors.red,
          width: double.infinity,
          height: 200,
        ),
      ),
    );
  }
}

class Example13 extends StatelessWidget {
  const Example13({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 FittedBox 的宽高与屏幕相同
    /// FittedBox 会对 Text 做缩放，使其适应 FittedBox 的宽高
    return const FittedBox(
      child: MyText('abc'),
    );
  }
}

class Example14 extends StatelessWidget {
  const Example14({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 Center 的宽高与屏幕相同
    /// Center 会让 FittedBox 自行决定宽高，只要不超过 Center 的宽高即可
    /// FittedBox 的宽高会调整为与 Text 一致，也就是说不会缩放
    return const Center(
      child: FittedBox(
        child: MyText('abc'),
      ),
    );
  }
}

class Example15 extends StatelessWidget {
  const Example15({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 首先参见 Example14 的说明
    /// 如果 Text 过长，则 FittedBox 会先调整自己的宽高（本例中 FittedBox 的宽会调整为与 Center 一致），然后再对 Text 做缩放，使其适应 FittedBox 的宽高
    return const Center(
      child: FittedBox(
        child: MyText('abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
      ),
    );
  }
}

class Example16 extends StatelessWidget {
  const Example16({Key? key}) : super(key: key);
  /// 首先参见 Example15 的说明
  /// 如果没有 FittedBox 则 Text 会自动换行以便适应 Center 的宽高
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyText('abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
    );
  }
}

class Example17 extends StatelessWidget {
  const Example17({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// FittedBox 不能缩放 double.infinity 否则会报错
    return FittedBox(
      child: Container(
        height: 20,
        width: double.infinity,
        color: Colors.red,
      ),
    );
  }
}

class Example18 extends StatelessWidget {
  const Example18({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 Row 的宽高与屏幕相同
    /// Row 的子元素自己管理自己的宽度，这样会导致过长的数据会有内容溢出的警告
    return Row(
      children: [
        Container(
          color: red,
          child: const MyText('abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
        ),
        Container(color: green, child: const MyText('xyz')),
      ],
    );
  }
}

class Example19 extends StatelessWidget {
  const Example19({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 首先参见 Example18 的说明
    /// 如果在 Row 的子元素外加一层 Expanded 则由 Expanded 管理宽度，像下面这样写就不会有内容溢出的警告了
    /// 第 2 个子元素是 Container 自己管理自己的宽度，剩下的宽度都归第 1 个子元素 Expanded 管理
    return Row(
      children: [
        Expanded(
          child: Container(
            color: red,
            child: const MyText('abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
          ),
        ),
        Container(color: green, child: const MyText('xyz')),
      ],
    );
  }
}

class Example20 extends StatelessWidget {
  const Example20({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 首先参见 Example19 的说明
    /// Row 的两个子元素都是 Expanded，其默认 flex 均为 1，也就是说他们会平分宽度
    /// 注：
    /// 1、Expanded 会强制其子元素与 Expanded 同宽
    /// 2、Flexible 会让其子元素自行决定宽度，然后调整为与其子元素同宽，但是宽度不能超过 Flexible 的 flex 指定的权重
    return Row(
      children: [
        Expanded(
          child: Container(
            color: red,
            child: const MyText('abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
          ),
        ),
        Expanded(
          child: Container(color: green, child: const MyText('xyz')),
        )
      ],
    );
  }
}

class Example21 extends StatelessWidget {
  const Example21({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// 首先参见 Example20 的说明
    /// Row 的两个子元素都是 Flexible，其默认 flex 均为 1，也就是说他们会平分宽度
    //// 注：
    /// 1、Expanded 会强制其子元素与 Expanded 同宽
    /// 2、Flexible 会让其子元素自行决定宽度，然后调整为与其子元素同宽，但是宽度不能超过 Flexible 的 flex 指定的权重
    return Row(
      children: [
        Flexible(
          child: Container(
            color: red,
            child: const MyText('abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
          ),
        ),
        Flexible(
          child: Container(color: green, child: const MyText('xyz')),
        ),
      ],
    );
  }
}