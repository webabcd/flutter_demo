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
6. 函数（函数基础，箭头函数，可选参数，命名参数，函数作为参数，匿名函数，嵌套函数，闭包函数，回调函数）
- lib/dart/function.dart
7. 类（类基础，构造函数，枚举）
- lib/dart/class1.dart
8. 类（抽象类，接口，继承，混入，扩展方法）
- lib/dart/class2.dart
9. 泛型（泛型类，泛型属性，泛型方法，泛型扩展方法）
- lib/dart/generic.dart
10. 单线程异步编程（async/await/Future/Stream/StreamSubscription/Completer/Timer）
- lib/dart/async.dart
11. 多线程异步编程（isolate/compute）
- lib/dart/isolate.dart
12. 库的开发和使用
- lib/dart/package/demo.dart
- lib/dart/package/lib1.dart
- lib/dart/package/lib2.dart
- lib/dart/package/lib3.dart
- lib/dart/package/lib4.dart
- lib/dart/package/lib5.dart
- lib/dart/package/lib6.dart
- lib/dart/package/lib7.dart
- lib/dart/package/lib8.dart
- lib/dart/package/lib9.dart
- lib/dart/package/lib10.dart
- lib/dart/package/lib11.dart
- lib/dart/package/mylib.dart
- lib/dart/package/mylib2.dart
- lib/dart/package/mylib3.dart
13. 其它（用调用函数的方式调用类的实例，生成器）
- lib/dart/other.dart
14. dart 3 新特性（元组，解构，switch 的模式匹配）
- lib/dart/dart3feature1.dart
15. dart 3 新特性（类相关）
- lib/dart/dart3feature2.dart

### widget 基础
1. StatelessWidget - 无状态 widget
- lib/widget/basic/stateless_widget.dart
2. StatefulWidget - 有状态 widget
- lib/widget/basic/stateful_widget.dart
3. constraint - 约束
- lib/widget/basic/constraint.dart
4. 焦点
- lib/widget/basic/focus.dart
5. 三棵树
- lib/widget/basic/tree.dart
6. 生命周期
- lib/widget/basic/lifecycle.dart
7. Key - 键
- lib/widget/basic/key.dart

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
7. IndexedStack - 从多个子中选择一个显示
- lib/widget/layout/indexed_stack.dart
8. CustomMultiChildLayout - 自定义多组件布局
- lib/widget/layout/custom_multi_child_layout.dart

### widget 容器类（只能有一个子）
1. Align - 对齐方式
- lib/widget/container/align.dart
2. Center - 居中对齐
- lib/widget/container/center.dart
3. Padding - 内边距
- lib/widget/container/padding.dart
4. ConstrainedBox - 约束范围
- lib/widget/container/constrained_box.dart
5. SizedBox - 确定宽高
- lib/widget/container/sized_box.dart
6. UnconstrainedBox - 无约束
- lib/widget/container/unconstrained_box.dart
7. DecoratedBox - 装饰（用于绘制背景，边框，渐变，阴影，矩形或圆形等效果）
- lib/widget/container/decorated_box.dart
8. Container - 综合容器（综合了各种效果的容器）
- lib/widget/container/container.dart
9. Opacity - 不透明度
- lib/widget/container/opacity.dart
10. LimitedBox - 限制最大尺寸
- lib/widget/container/limited_box.dart
11. OverflowBox - 可溢出
- lib/widget/container/overflow_box.dart
12. FittedBox - 自适应
- lib/widget/container/fitted_box.dart
13. AspectRatio - 宽高比
- lib/widget/container/aspect_ratio.dart
14. RotatedBox - 旋转
- lib/widget/container/rotated_box.dart
15. Material - Material 组件
- lib/widget/container/material.dart
16. InteractiveViewer - 手动拖动/手动缩放
- lib/widget/container/interactive_viewer.dart
17. FractionallySizedBox - 按比值占用可用空间
- lib/widget/container/fractionally_sized_box.dart
18. Card - 阴影边框
- lib/widget/container/card.dart
19. CustomSingleChildLayout - 自定义单组件布局
- lib/widget/container/custom_single_child_layout.dart

### widget 文本类
1. Text - 文本显示框
- lib/widget/text/text.dart
2. 字体
- lib/widget/text/font.dart
3. TextField - 文本输入框
- lib/widget/text/text_field.dart
4. RichText - 富文本
- lib/widget/text/rich_text.dart
5. Tooltip - 长按提示或鼠标悬浮提示
- lib/widget/text/tooltip.dart
6. Form - 表单
- lib/widget/text/form.dart
7. Autocomplete - 自动完成
- lib/widget/text/autocomplete.dart

### widget 按钮类
1. TextButton - 文本按钮
- lib/widget/button/text_button.dart
2. OutlinedButton - 自带边框按钮
- lib/widget/button/outlined_button.dart
3. ElevatedButton - 自带背景色按钮
- lib/widget/button/elevated_button.dart
4. IconButton - 图标按钮
- lib/widget/button/icon_button.dart
5. Ink/InkWell/InkResponse - 让任意组件支持点击事件和点击效果
- lib/widget/button/ink.dart

### widget Chip 类
1. Chip - Chip（背景上有文字，文字左边有图标，文字右边有删除按钮）
- lib/widget/chip/chip.dart
2. ActionChip - Chip 按钮
- lib/widget/chip/action_chip.dart
3. ChoiceChip - Chip 双状态按钮
- lib/widget/chip/choice_chip.dart
4. FilterChip - Chip 双状态按钮（选中时有对钩）
- lib/widget/chip/filter_chip.dart
5. InputChip - Chip 双状态按钮（选中时有对钩，文字右边有删除按钮）
- lib/widget/chip/input_chip.dart

### widget 媒体类
1. Image - 图片
- lib/widget/media/image.dart
2. Icon - 图标
- lib/widget/media/icon.dart
3. Divider - 分隔线
- lib/widget/media/divider.dart
4. CircleAvatar - 圆形头像
- lib/widget/media/circle_avatar.dart
5. RawImage - 用于显示 dart:ui 库中的 Image
- lib/widget/media/raw_image.dart

### widget 架构类
1. Scaffold - 脚手架
- lib/widget/structure/scaffold.dart
2. Scaffold 的 AppBar - 顶部导航栏
- lib/widget/structure/scaffold_app_bar.dart
3. Scaffold 的 BottomNavigationBar - 底部导航栏
- lib/widget/structure/scaffold_bottom_navigation_bar.dart
4. Scaffold 的 Drawer - 侧滑菜单（左侧抽屉/右侧抽屉）
- lib/widget/structure/scaffold_drawer.dart
5. Scaffold 的 FloatingActionButton - 悬浮按钮
- lib/widget/structure/scaffold_floating_action_button.dart
6. Scaffold 的 TabBar - 选项卡（基础）
- lib/widget/structure/scaffold_tab_bar.dart
7. Scaffold 的 TabBar - 选项卡（自定义 TabController，通过程序切换选项卡，以及如何保持每个 Tab 对应的内容的状态）
- lib/widget/structure/scaffold_tab_bar2.dart
8. MaterialApp - 符合 Material Design 的根组件
- lib/widget/structure/material_app.dart
9. BottomSheet - 底部弹出框
- lib/widget/structure/scaffold_bottom_sheet.dart

### widget 弹出类
1. AlertDialog - 弹出框（包括标题，内容，多个按钮）
- lib/widget/flyout/alert_dialog.dart
2. SimpleDialog - 弹出框（包括标题，多个选项）
- lib/widget/flyout/simple_dialog.dart
3. SnackBar - 底部弹出条
- lib/widget/flyout/snack_bar.dart
4. MaterialBanner - 顶部弹出条
- lib/widget/flyout/material_banner.dart
5. PopupMenuButton - 弹出菜单按钮
- lib/widget/flyout/popup_menu_button.dart

### widget 选择类
1. Radio - 单选框
- lib/widget/selection/radio.dart
2. Checkbox - 复选框
- lib/widget/selection/checkbox.dart
3. DropdownButton - 下拉框
- lib/widget/selection/dropdown_button.dart
4. Switch - 开关
- lib/widget/selection/switch.dart
5. ToggleButtons - 一组多状态按钮
- lib/widget/selection/toggle_buttons.dart
6. showDatePicker()/showTimePicker/CalendarDatePicker - 日期选择和时间选择
- lib/widget/selection/time_picker.dart
7. Stepper - 步骤选择
- lib/widget/selection/stepper.dart

### widget 进度类
1. CircularProgressIndicator - 圆形进度条
- lib/widget/progress/circular_progress_indicator.dart
2. LinearProgressIndicator - 条形进度条
- lib/widget/progress/linear_progress_indicator.dart
3. RefreshIndicator - 下拉刷新进度条
- lib/widget/progress/refresh_indicator.dart
4. Slider - 可拖动进度条
- lib/widget/progress/slider.dart

### widget 滚动类
1. SingleChildScrollView, Scrollbar - 可滚动组件，滚动条
- lib/widget/scroll/single_child_scroll_view.dart
2. ScrollController - 用于控制可滚动组件和滚动条
- lib/widget/scroll/scroll_controller.dart
3. ScrollNotification - 滚动通知
- lib/widget/scroll/scroll_notification.dart
4. DraggableScrollableSheet - 可滚动组件，并且支持通过拖拽的方式上下展开
- lib/widget/scroll/draggable_scrollable_sheet.dart
5. PageView - 页面滚动切换
- lib/widget/scroll/page_view.dart

### widget 列表类
1. ListView - 列表（基础）
- lib/widget/list/list_view.dart
2. ListView - 列表（动态生成）
- lib/widget/list/list_view2.dart
3. ListView - 列表（下拉刷新和上拉加载）
- lib/widget/list/list_view3.dart
4. ListTile - 列表项
- lib/widget/list/list_tile.dart
5. ExpansionTile - 列表项（可展开）
- lib/widget/list/expansion_tile.dart
6. GridView - 网格
- lib/widget/list/grid_view.dart
7. Table - 表格
- lib/widget/list/table.dart
8. ReorderableListView - 可拖拽排序的列表
- lib/widget/list/reorderable_list_view.dart
9. ExpansionPanelList - 可展开列表
- lib/widget/list/expansion_panel_list.dart
10. Dismissible - 滑动删除
- lib/widget/list/dismissible.dart
11. DataTable - 数据表格
- lib/widget/list/data_table.dart

### widget Sliver
1. CustomScrollView/SliverPadding/SliverSafeArea - 通过 slivers 实现滚动效果
- lib/widget/sliver/custom_scroll_view.dart
2. SliverList, SliverFixedExtentList - 列表（需要在 CustomScrollView 中使用）
- lib/widget/sliver/sliver_list.dart
3. SliverGrid - 网格（需要在 CustomScrollView 中使用）
- lib/widget/sliver/sliver_grid.dart
4. SliverAppBar/FlexibleSpaceBar - 可展开/收缩的标题栏（需要在 CustomScrollView 中使用）
- lib/widget/sliver/sliver_app_bar.dart
5. SliverToBoxAdapter - 为不可滚动组件提供 sliver 效果
- lib/widget/sliver/sliver_to_box_adapter.dart
6. NestedScrollView - 为可滚动组件提供 sliver 效果
- lib/widget/sliver/nested_scroll_view.dart
7. SliverPersistentHeader - 自定义可展开/收缩的标题栏
- lib/widget/sliver/sliver_persistent_header.dart

### widget Builder
1. Builder - 在指定的位置构造上下文
- lib/widget/builder/builder.dart
2. StatefulBuilder - 有状态的 Builder
- lib/widget/builder/stateful_builder.dart
3. LayoutBuilder - 可以拿到父亲的尺寸的 Builder
- lib/widget/builder/layout_builder.dart
4. FutureBuilder - 跟踪 Future 的变化并构造 Widget
- lib/widget/builder/future_builder.dart
5. StreamBuilder - 跟踪 Stream 的变化并构造 Widget
- lib/widget/builder/stream_builder.dart

### widget 自定义
1. 通过 SingleChildRenderObjectWidget 实现自定义组件
- lib/widget/custom/single_child_render_object_widget.dart
2. 通过 CustomPaint 实现自定义组件
- lib/widget/custom/custom_paint.dart
3. 通过组合多个 Widget 的方式实现自定义组件
- lib/widget/custom/custom_widget.dart

### widget 状态管理
1. 状态管理 - ChangeNotifier（多 Widget 之间的多数据的状态管理）
- lib/state/change_notifier.dart
2. 状态管理 - ValueNotifier（多 Widget 之间的单值的状态管理）
- lib/state/value_notifier.dart
3. 状态管理 - InheritedWidget（在树上，父共享数据后，任意子可获取此数据）
- lib/state/inherited_widget.dart
4. 状态管理 - 在树上，子获取父的数据
- lib/state/find_ancestor.dart
5. 状态管理 - 在树上，父监听子的通知
- lib/state/notification_listener.dart
6. 状态管理 - 自定义 controller
- lib/state/controller.dart
7. 状态管理 - Redux
- lib/state/redux.dart

### 输入
1. Listener - 指针
- lib/input/listener.dart
2. GestureDetector - 手势
- lib/input/gesture_detector.dart
3. RawKeyboardListener - 按键
- lib/input/raw_keyboard_listener.dart
4. Draggable/DragTarget - 拖拽
- lib/input/drag.dart
5. 软键盘相关
- lib/input/soft_keyboard.dart
6. 命中测试（hit test）
- lib/input/hit_test.dart

### 路由和导航
1. 路由和导航的基础
- lib/route/navigator.dart
- lib/route/route1.dart
- lib/route/route2.dart
- lib/route/route3.dart
2. 路由和导航的进阶
- lib/route/navigator2.dart
- lib/route/route_a.dart
- lib/route/route_b.dart
- lib/route/route_c.dart
- lib/route/route_d.dart
3. PageRouteBuilder - 路由跳转动画
- lib/route/page_route_builder.dart
4. PageRouteBuilder - 路由跳转动画（让 pushNamed() 实现转场动画）
- lib/route/page_route_builder2.dart
5. WillPopScope - 出栈拦截
- lib/route/will_pop_scope.dart

### UI
1. 状态栏
- lib/ui/status_bar.dart
2. android 底部导航栏
- lib/ui/navigation_bar.dart
3. 主题（基础）
- lib/ui/theme.dart
4. 主题（Material Design 3 规范，亮色主题，暗色主题）
- lib/ui/theme2.dart
5. 屏幕方向
- lib/ui/orientation.dart
6. 安全区域
- lib/ui/safe_area.dart
7. 闪屏页，程序名称，程序图标
- lib/ui/splash_screen.dart
8. 其它
- lib/ui/other.dart
9. MediaQuery - 获取屏幕的相关信息，使系统设置中的字体大小无效
- lib/ui/media_query.dart

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
6. 绘制
- lib/shape/paint.dart

### 动画
1. Animation - 动画基础（以直线型动画为例）
- lib/animation/animation.dart
2. CurvedAnimation - 曲线型动画（缓动动画）
- lib/animation/curved_animation.dart
3. Tween - 补间动画（直线型动画）
- lib/animation/tween.dart
4. Tween - 补间动画（曲线型动画）
- lib/animation/tween2.dart
5. 自定义 Tween - ColorTween, CurveTween, SizeTween, RectTween, AlignmentTween, BorderTween, BoxConstraintsTween, DecorationTween, EdgeInsetsTween, TextStyleTween, IntTween 等
- lib/animation/tween3.dart
6. XxxTransition - 支持直接关联 Animation<T> 并自动重绘的 Widget（FadeTransition, SizeTransition, SlideTransition, AlignTransition, DecoratedBoxTransition, DefaultTextStyleTransition, PositionedTransition, RotationTransition, ScaleTransition 等）
- lib/animation/transition.dart
7. AnimatedWidget - 用于实现自定义的 Transition
- lib/animation/animated_widget.dart
8. AnimatedBuilder - 用于简化 AnimatedWidget 动画
- lib/animation/animated_builder.dart
9. AnimatedXxx - 极简动画 Widget（AnimatedContainer, AnimatedDefaultTextStyle, AnimatedOpacity, AnimatedPadding, AnimatedPositioned, AnimatedRotation, AnimatedScale, AnimatedSize, AnimatedSlide 等）
- lib/animation/animated.dart
10. Hero - 一个对象从一个页飞入另一个页的动画
- lib/animation/hero.dart
11. Stagger - 复合动画，即一个 AnimationController 控制多个动画
- lib/animation/stagger.dart

### 存储
1. shared_preferences - 用于操作 android 的 SharedPreferences, ios 的 NSUserDefaults, web 的 LocalStorage
- lib/storage/shared_preferences.dart
2. path_provider - 用于获取不同平台的本地存储的路径
- lib/storage/path_provider.dart
3. File, Directory - 文件操作, 目录操作
- lib/storage/file.dart

### 资源
1. Localization - 国际化
- lib/resource/localization.dart
2. rootBundle - 访问程序内资源
- lib/resource/root_bundle.dart

### 网络
1. http 库以及 json 和对象间的转换
- lib/network/http.dart

### 插件
1. flutter 与 android 原生之间的数据通信
- lib/plugin/plugin.dart
- android/app/src/main/kotlin/com/example/flutter_demo/MainActivity.kt
- android/app/src/main/kotlin/com/example/flutter_demo/MyFlutterPlugin1.kt
2. flutter 与 ios 原生之间的数据通信
- lib/plugin/plugin.dart
- ios/Runner/AppDelegate.swift
- ios/Runner/MyFlutterPlugin1.swift
3. flutter 使用 android 原生控件，并做数据通信
- lib/plugin/plugin2.dart
- android/app/src/main/kotlin/com/example/flutter_demo/MainActivity.kt
- android/app/src/main/kotlin/com/example/flutter_demo/MyFlutterPlugin2.kt
- android/app/src/main/kotlin/com/example/flutter_demo/MyView.kt
- android/app/src/main/res/layout/view_my.xml
4. flutter 使用 ios 原生控件，并做数据通信
- lib/plugin/plugin2.dart
- ios/Runner/AppDelegate.swift
- ios/Runner/MyFlutterPlugin2.swift
- ios/Runner/MyView.swift
5. flutter 与 web 原生之间的数据通信
- lib/plugin/plugin.dart
- lib/plugin/flutter_plugin_web.dart
- web/index.html
6. flutter 使用 web 原生控件，并做数据通信
- lib/plugin/plugin2.dart
- lib/plugin/flutter_plugin_web2_stub.dart
- lib/plugin/flutter_plugin_web2.dart
7. flutter 使用 web 原生控件（新版 flutter 的方式），并做数据通信（新版 flutter 的方式）
- lib/plugin/plugin2.dart(new)
- lib/plugin/flutter_plugin_web2_stub.dart
- lib/plugin/flutter_plugin_web2_new.dart

### 游戏
1. 俄罗斯方块
- lib/game/tetris/tetris.dart
- lib/game/tetris/core.dart
- lib/game/tetris/config.dart
- lib/game/tetris/controller.dart
- lib/game/tetris/shape/square.dart
- lib/game/tetris/shape/shape.dart
- lib/game/tetris/shape/i.dart
- lib/game/tetris/shape/l.dart
- lib/game/tetris/shape/l2.dart
- lib/game/tetris/shape/n.dart
- lib/game/tetris/shape/n2.dart
- lib/game/tetris/shape/o.dart
- lib/game/tetris/shape/t.dart