# Flutter Demo


### dart
1. 概述
- lib/dart/summary.dart
2. 数据类型（num, int, double, bool, String, List, Set, Map, Object, dynamic, 数据类型转换与判断，可空类型）
- lib/dart/datatype.dart
3. 运算符
- lib/dart/operator.dart
4. 控制语句（if/else, switch/case, while/do-while, for）
- lib/dart/statement.dart
5. 错误处理（assert, try/on/catch/finally）
- lib/dart/exception.dart
6. 函数（函数基础，箭头函数，可选参数，命名参数，函数作为参数，匿名函数，嵌套函数，闭包函数）
- lib/dart/function.dart
7. 类（类基础，构造函数，枚举）
- lib/dart/class1.dart
8. 类（抽象类，接口，继承，混入，扩展方法）
- lib/dart/class2.dart
9. 泛型（泛型类，泛型属性，泛型方法，泛型扩展方法）
- lib/dart/generic.dart
10. 异步编程（async/await/Future<T>/Stream<T>）
- lib/dart/async.dart
11. 库的开发和使用
- lib/dart/package/demo.dart
- lib/dart/package/lib1.dart
- lib/dart/package/lib2.dart
- lib/dart/package/lib3.dart
- lib/dart/package/lib4.dart
- lib/dart/package/lib5.dart
- lib/dart/package/lib6.dart
- lib/dart/package/lib7.dart
- lib/dart/package/mylib.dart
12. 其它（用调用函数的方式调用类的实例，生成器）
- lib/dart/other.dart

### widget 基础
1. StatelessWidget - 无状态 widget
- lib/widget/basic/statelessWidget.dart
2. StatefulWidget - 有状态 widget
- lib/widget/basic/statefulWidget.dart
3. constraint - 约束
- lib/widget/basic/constraint.dart
4. 焦点
- lib/widget/basic/focus.dart
5. Widget 的 key 与三棵树
- lib/widget/basic/widget_key.dart

### widget 布局类（可以有多个子）
1. Row - 水平弹性布局
- lib/widget/layout/row.dart
2. Column - 垂直弹性布局
- lib/widget/layout/column.dart
3. Flex - 水平弹性布局或垂直弹性布局
- lib/widget/layout/flex.dart
4. Wrap - 可换行的水平布局，可换列的垂直布局
- lib/widget/layout/wrap.dart
5. Flow - 自定义流式布局
- lib/widget/layout/flow.dart
6. Stack - 层叠布局
- lib/widget/layout/stack.dart

### widget 容器类（只能有一个子）
1. Align - 对齐方式
- lib/widget/container/align.dart
2. Center - 居中对齐
- lib/widget/container/center.dart
3. Padding - 内边距
- lib/widget/container/padding.dart
4. ConstrainedBox - 约束范围
- lib/widget/container/constrainedBox.dart
5. SizedBox - 确定宽高
- lib/widget/container/sizedBox.dart
6. UnconstrainedBox - 无约束
- lib/widget/container/unconstrainedBox.dart
7. DecoratedBox - 装饰（用于绘制背景，边框，渐变，阴影，矩形或圆形等效果）
- lib/widget/container/decoratedBox.dart
8. Container - 综合容器（综合了各种效果的容器）
- lib/widget/container/container.dart
9. Opacity - 不透明度
- lib/widget/container/opacity.dart

### widget 文本类
1. Text - 文本显示框
- lib/widget/text/text.dart
2. 字体
- lib/widget/text/font.dart
3. TextField - 文本输入框
- lib/widget/text/textField.dart

### widget 按钮类
1. TextButton - 文本按钮
- lib/widget/button/textButton.dart
2. OutlinedButton - 自带边框按钮
- lib/widget/button/outlinedButton.dart
3. ElevatedButton - 自带背景色按钮
- lib/widget/button/elevatedButton.dart
4. IconButton - 图标按钮
- lib/widget/button/iconButton.dart

### widget 媒体类
1. Image - 图片
- lib/widget/media/image.dart
2. Icon - 图标
- lib/widget/media/icon.dart

### widget 架构类
1. Scaffold - 脚手架
- lib/widget/structure/scaffold.dart

### UI
1. 状态栏
- lib/ui/statusBar.dart
2. android 底部导航栏
- lib/ui/navigationBar.dart

### 图形
1. 边框
- lib/shape/border.dart
2. 剪裁
- lib/shape/clip.dart
3. 渐变
- lib/shape/gradient.dart
4. 变换
- lib/shape/transform.dart
5. 阴影
- lib/shape/shadow.dart
6. Paint
- lib/shape/paint.dart