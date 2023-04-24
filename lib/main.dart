// https://flutter.github.io/samples/
// https://dart.dev/
// https://flutter.dev/
// https://pub.dev/

/*
 * flutter 使用的是声明式 UI（declarative UI），不是传统的命令式编程
 * 1、UI 的命令式编程：先实例化一个 UI 对象，然后按需求更改这个对象
 * 2、UI 的声明式编程：描述你需要的 UI 即可（构造 Widget 实例），需要修改时就重新描述 UI（构造新的 Widget 实例）
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'helper.dart';

import 'dart/summary.dart';
import 'dart/datatype.dart';
import 'dart/operator.dart';
import 'dart/statement.dart';
import 'dart/exception.dart';
import 'dart/function.dart';
import 'dart/class1.dart';
import 'dart/class2.dart';
import 'dart/generic.dart';
import 'dart/other.dart';
import 'dart/async.dart';
import 'dart/isolate.dart';
import 'dart/package/demo.dart';

import 'widget/basic/stateless_widget.dart';
import 'widget/basic/stateful_widget.dart';
import 'widget/basic/constraint.dart';
import 'widget/basic/focus.dart';
import 'widget/basic/tree.dart';
import 'widget/basic/lifecycle.dart';

import 'widget/layout/row.dart';
import 'widget/layout/column.dart';
import 'widget/layout/flex.dart';
import 'widget/layout/wrap.dart';
import 'widget/layout/flow.dart';
import 'widget/layout/stack.dart';

import 'widget/container/padding.dart';
import 'widget/container/align.dart';
import 'widget/container/center.dart';
import 'widget/container/constrained_box.dart';
import 'widget/container/sized_box.dart';
import 'widget/container/unconstrained_box.dart';
import 'widget/container/decorated_box.dart';
import 'widget/container/container.dart';
import 'widget/container/opacity.dart';
import 'widget/container/limited_box.dart';
import 'widget/container/overflow_box.dart';
import 'widget/container/fitted_box.dart';
import 'widget/container/aspect_ratio.dart';

import 'widget/text/text.dart';
import 'widget/text/font.dart';
import 'widget/text/text_field.dart';
import 'widget/text/rich_text.dart';
import 'widget/text/tooltip.dart';

import 'widget/button/text_button.dart';
import 'widget/button/outlined_button.dart';
import 'widget/button/elevated_button.dart';
import 'widget/button/icon_button.dart';
import 'widget/button/ink.dart';

import 'widget/chip/chip.dart';
import 'widget/chip/action_chip.dart';
import 'widget/chip/choice_chip.dart';
import 'widget/chip/filter_chip.dart';
import 'widget/chip/input_chip.dart';

import 'widget/media/image.dart';
import 'widget/media/icon.dart';
import 'widget/media/circle_avatar.dart';
import 'widget/media/divider.dart';

import 'widget/structure/scaffold.dart';
import 'widget/structure/scaffold_app_bar.dart';
import 'widget/structure/scaffold_bottom_navigation_bar.dart';
import 'widget/structure/scaffold_drawer.dart';
import 'widget/structure/material_app.dart';
import 'widget/structure/scaffold_floating_action_button.dart';
import 'widget/structure/scaffold_tab_bar.dart';
import 'widget/structure/scaffold_tab_bar2.dart';

import 'widget/flyout/alert_dialog.dart';
import 'widget/flyout/simple_dialog.dart';
import 'widget/flyout/snack_bar.dart';
import 'widget/flyout/material_banner.dart';
import 'widget/flyout/popup_menu_button.dart';

import 'widget/selection/radio.dart';
import 'widget/selection/checkbox.dart';
import 'widget/selection/dropdown_button.dart';
import 'widget/selection/switch.dart';
import 'widget/selection/toggle_buttons.dart';
import 'widget/selection/time_picker.dart';

import 'widget/progress/circular_progress_indicator.dart';
import 'widget/progress/linear_progress_indicator.dart';
import 'widget/progress/refresh_indicator.dart';
import 'widget/progress/slider.dart';

import 'widget/scroll/single_child_scroll_view.dart';
import 'widget/scroll/scroll_controller.dart';
import 'widget/scroll/scroll_notification.dart';
import 'widget/scroll/draggable_scrollable_sheet.dart';
import 'widget/scroll/page_view.dart';

import 'widget/list/list_view.dart';
import 'widget/list/list_view2.dart';
import 'widget/list/list_view3.dart';
import 'widget/list/list_tile.dart';
import 'widget/list/expansion_tile.dart';
import 'widget/list/grid_view.dart';

import 'widget/sliver/custom_scroll_view.dart';
import 'widget/sliver/sliver_list.dart';
import 'widget/sliver/sliver_grid.dart';
import 'widget/sliver/sliver_app_bar.dart';
import 'widget/sliver/sliver_to_box_adapter.dart';
import 'widget/sliver/sliver_persistent_header.dart';
import 'widget/sliver/nested_scroll_view.dart';

import 'widget/builder/builder.dart';
import 'widget/builder/stateful_builder.dart';
import 'widget/builder/layout_builder.dart';
import 'widget/builder/future_builder.dart';
import 'widget/builder/stream_builder.dart';

import 'state/change_notifier.dart';
import 'state/value_notifier.dart';
import 'state/inherited_widget.dart';
import 'state/find_ancestor.dart';
import 'state/controller.dart';
import 'state/notification_listener.dart';
import 'state/redux.dart';

import 'input/listener.dart';
import 'input/gesture_detector.dart';
import 'input/raw_keyboard_listener.dart';
import 'input/drag.dart';
import 'input/soft_keyboard.dart';
import 'input/hit_test.dart';

import 'route/navigator.dart';
import 'route/navigator2.dart';
import 'route/page_route_builder.dart';
import 'route/page_route_builder2.dart';
import 'route/will_pop_scope.dart';

import 'ui/status_bar.dart';
import 'ui/navigation_bar.dart';
import 'ui/theme.dart';
import 'ui/theme2.dart';
import 'ui/orientation.dart';
import 'ui/safe_area.dart';
import 'ui/splash_screen.dart';
import 'ui/media_query.dart';
import 'ui/other.dart';

import 'shape/border.dart';
import 'shape/clip.dart';
import 'shape/gradient.dart';
import 'shape/transform.dart';
import 'shape/shadow.dart';
import 'shape/paint.dart';

import 'animation/animation.dart';
import 'animation/curved_animation.dart';
import 'animation/tween.dart';
import 'animation/tween2.dart';
import 'animation/tween3.dart';
import 'animation/transition.dart';
import 'animation/animated_widget.dart';
import 'animation/animated_builder.dart';
import 'animation/animated.dart';
import 'animation/hero.dart';
import 'animation/stagger.dart';

import 'localization/localization.dart';

import 'network/http.dart';

import 'plugin/plugin.dart';
import 'plugin/plugin2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
      routes:{
        "lib.dart.summary.dart":(context) => const DartSummary(),
        "lib.dart.datatype.dart":(context) => const DartDatatype(),
        "lib.dart.operator.dart":(context) => const DartOperator(),
        "lib.dart.statement.dart":(context) => const DartStatement(),
        "lib.dart.exception.dart":(context) => const DartException(),
        "lib.dart.function.dart":(context) => const DartFunction(),
        "lib.dart.class1.dart":(context) => const DartClass1(),
        "lib.dart.class2.dart":(context) => const DartClass2(),
        "lib.dart.generic.dart":(context) => const DartGeneric(),
        "lib.dart.other.dart":(context) => const DartOther(),
        "lib.dart.package.demo.dart":(context) => const DartPackage(),
        "lib.dart.async.dart":(context) => const DartAsync(),
        "lib.dart.isolate.dart":(context) => const DartIsolate(),
        "lib.widget.basic.stateless_widget.dart":(context) => const StatelessWidgetDemo(),
        "lib.widget.basic.stateful_widget.dart":(context) => const StatefulWidgetDemo(),
        "lib.widget.basic.constraint.dart":(context) => const ConstraintDemo(),
        "lib.widget.basic.focus.dart":(context) => const FocusDemo(),
        "lib.widget.basic.tree.dart":(context) => const TreeDemo(),
        "lib.widget.basic.lifecycle.dart":(context) => const LifecycleDemo(),
        "lib.widget.layout.row.dart":(context) => const RowDemo(),
        "lib.widget.layout.column.dart":(context) => const ColumnDemo(),
        "lib.widget.layout.flex.dart":(context) => const FlexDemo(),
        "lib.widget.layout.wrap.dart":(context) => const WrapDemo(),
        "lib.widget.layout.flow.dart":(context) => const FlowDemo(),
        "lib.widget.layout.stack.dart":(context) => const StackDemo(),
        "lib.widget.container.padding.dart":(context) => const PaddingDemo(),
        "lib.widget.container.align.dart":(context) => const AlignDemo(),
        "lib.widget.container.center.dart":(context) => const CenterDemo(),
        "lib.widget.container.constrained_box.dart":(context) => const ConstrainedBoxDemo(),
        "lib.widget.container.sized_box.dart":(context) => const SizedBoxDemo(),
        "lib.widget.container.unconstrained_box.dart":(context) => const UnconstrainedBoxDemo(),
        "lib.widget.container.decorated_box.dart":(context) => const DecoratedBoxDemo(),
        "lib.widget.container.container.dart":(context) => const ContainerDemo(),
        "lib.widget.container.opacity.dart":(context) => const OpacityDemo(),
        "lib.widget.container.limited_box.dart":(context) => const LimitedBoxDemo(),
        "lib.widget.container.overflow_box.dart":(context) => const OverflowBoxDemo(),
        "lib.widget.container.fitted_box.dart":(context) => const FittedBoxDemo(),
        "lib.widget.container.aspect_ratio.dart":(context) => const AspectRatioDemo(),
        "lib.widget.text.text.dart":(context) => const TextDemo(),
        "lib.widget.text.font.dart":(context) => const FontDemo(),
        "lib.widget.text.text_field.dart":(context) => const TextFieldDemo(),
        "lib.widget.text.rich_text.dart":(context) => const RichTextDemo(),
        "lib.widget.text.tooltip.dart":(context) => const TooltipDemo(),
        "lib.widget.button.text_button.dart":(context) => const TextButtonDemo(),
        "lib.widget.button.outlined_button.dart":(context) => const OutlinedButtonDemo(),
        "lib.widget.button.elevated_button.dart":(context) => const ElevatedButtonDemo(),
        "lib.widget.button.icon_button.dart":(context) => const IconButtonDemo(),
        "lib.widget.button.ink.dart":(context) => const InkDemo(),
        "lib.widget.chip.chip.dart":(context) => const ChipDemo(),
        "lib.widget.chip.action_chip.dart":(context) => const ActionChipDemo(),
        "lib.widget.chip.choice_chip.dart":(context) => const ChoiceChipDemo(),
        "lib.widget.chip.filter_chip.dart":(context) => const FilterChipDemo(),
        "lib.widget.chip.input_chip.dart":(context) => const InputChipDemo(),
        "lib.widget.media.image.dart":(context) => const ImageDemo(),
        "lib.widget.media.icon.dart":(context) => const IconDemo(),
        "lib.widget.media.circle_avatar.dart":(context) => const CircleAvatarDemo(),
        "lib.widget.media.divider.dart":(context) => const DividerDemo(),
        "lib.widget.structure.scaffold.dart":(context) => const ScaffoldDemo(),
        "lib.widget.structure.scaffold_app_bar.dart":(context) => const ScaffoldAppBarDemo(),
        "lib.widget.structure.scaffold_bottom_navigation_bar.dart":(context) => const ScaffoldBottomNavigationBarDemo(),
        "lib.widget.structure.scaffold_drawer.dart":(context) => const ScaffoldDrawerDemo(),
        "lib.widget.structure.scaffold_floating_action_button.dart":(context) => const ScaffoldFloatingActionButtonDemo(),
        "lib.widget.structure.scaffold_tab_bar.dart":(context) => const ScaffoldTabBarDemo(),
        "lib.widget.structure.scaffold_tab_bar2.dart":(context) => const ScaffoldTabBarDemo2(),
        "lib.widget.structure.material_app.dart":(context) => const MaterialAppDemo(),
        "lib.widget.flyout.alert_dialog.dart":(context) => const AlertDialogDemo(),
        "lib.widget.flyout.simple_dialog.dart":(context) => const SimpleDialogDemo(),
        "lib.widget.flyout.snack_bar.dart":(context) => const SnackBarDemo(),
        "lib.widget.flyout.material_banner.dart":(context) => const MaterialBannerDemo(),
        "lib.widget.flyout.popup_menu_button.dart":(context) => const PopupMenuButtonDemo(),
        "lib.widget.selection.radio.dart":(context) => const RadioDemo(),
        "lib.widget.selection.checkbox.dart":(context) => const CheckboxDemo(),
        "lib.widget.selection.dropdown_button.dart":(context) => const DropdownButtonDemo(),
        "lib.widget.selection.switch.dart":(context) => const SwitchDemo(),
        "lib.widget.selection.toggle_buttons.dart":(context) => const ToggleButtonsDemo(),
        "lib.widget.selection.time_picker.dart":(context) => const TimePickerDemo(),
        "lib.widget.progress.circular_progress_indicator.dart":(context) => const CircularProgressIndicatorDemo(),
        "lib.widget.progress.linear_progress_indicator.dart":(context) => const LinearProgressIndicatorDemo(),
        "lib.widget.progress.refresh_indicator.dart":(context) => const RefreshIndicatorDemo(),
        "lib.widget.progress.slider.dart":(context) => const SliderDemo(),
        "lib.widget.scroll.single_child_scroll_view.dart":(context) => const SingleChildScrollViewDemo(),
        "lib.widget.scroll.scroll_controller.dart":(context) => const ScrollControllerDemo(),
        "lib.widget.scroll.scroll_notification.dart":(context) => const ScrollNotificationDemo(),
        "lib.widget.scroll.draggable_scrollable_sheet.dart":(context) => const DraggableScrollableSheetDemo(),
        "lib.widget.scroll.page_view.dart":(context) => const PageViewDemo(),
        "lib.widget.list.list_view.dart":(context) => const ListViewDemo(),
        "lib.widget.list.list_view2.dart":(context) => const ListView2Demo(),
        "lib.widget.list.list_view3.dart":(context) => const ListView3Demo(),
        "lib.widget.list.list_tile.dart":(context) => const ListTileDemo(),
        "lib.widget.list.expansion_tile.dart":(context) => const ExpansionTileDemo(),
        "lib.widget.list.grid_view.dart":(context) => const GridViewDemo(),
        "lib.widget.sliver.custom_scroll_view.dart":(context) => const CustomScrollViewDemo(),
        "lib.widget.sliver.sliver_list.dart":(context) => const SliverListDemo(),
        "lib.widget.sliver.sliver_grid.dart":(context) => const SliverGridDemo(),
        "lib.widget.sliver.sliver_app_bar.dart":(context) => const SliverAppBarDemo(),
        "lib.widget.sliver.sliver_to_box_adapter.dart":(context) => const SliverToBoxAdapterDemo(),
        "lib.widget.sliver.sliver_persistent_header.dart":(context) => const SliverPersistentHeaderDemo(),
        "lib.widget.sliver.nested_scroll_view.dart":(context) => const NestedScrollViewDemo(),
        "lib.widget.builder.builder.dart":(context) => const BuilderDemo(),
        "lib.widget.builder.stateful_builder.dart":(context) => const StatefulBuilderDemo(),
        "lib.widget.builder.layout_builder.dart":(context) => const LayoutBuilderDemo(),
        "lib.widget.builder.future_builder.dart":(context) => const FutureBuilderDemo(),
        "lib.widget.builder.stream_builder.dart":(context) => const StreamBuilderDemo(),
        "lib.state.change_notifier.dart":(context) => const ChangeNotifierDemo(),
        "lib.state.value_notifier.dart":(context) => const ValueNotifierDemo(),
        "lib.state.inherited_widget.dart":(context) => const InheritedWidgetDemo(),
        "lib.state.find_ancestor.dart":(context) => const FindAncestorDemo(),
        "lib.state.controller.dart":(context) => const ControllerDemo(),
        "lib.state.notification_listener.dart":(context) => const NotificationListenerDemo(),
        "lib.state.redux.dart":(context) => const ReduxDemo(),
        "lib.input.listener.dart":(context) => const ListenerDemo(),
        "lib.input.gesture_detector.dart":(context) => const GestureDetectorDemo(),
        "lib.input.raw_keyboard_listener.dart":(context) => const RawKeyboardListenerDemo(),
        "lib.input.drag.dart":(context) => const DragDemo(),
        "lib.input.soft_keyboard.dart":(context) => const SoftKeyboardDemo(),
        "lib.input.hit_test.dart":(context) => const HitTestDemo(),
        "lib.route.navigator.dart":(context) => const NavigatorDemo(),
        "lib.route.navigator2.dart":(context) => const Navigator2Demo(),
        "lib.route.page_route_builder.dart":(context) => const PageRouteBuilderDemo(),
        "lib.route.page_route_builder2.dart":(context) => const PageRouteBuilder2Demo(),
        "lib.route.will_pop_scope.dart":(context) => const WillPopScopeDemo(),
        "lib.ui.status_bar.dart":(context) => const StatusBarDemo(),
        "lib.ui.navigation_bar.dart":(context) => const NavigationBarDemo(),
        "lib.ui.theme.dart":(context) => const ThemeDemo(),
        "lib.ui.theme2.dart":(context) => const Theme2Demo(),
        "lib.ui.orientation.dart":(context) => const OrientationDemo(),
        "lib.ui.safe_area.dart":(context) => const SafeAreaDemo(),
        "lib.ui.splash_screen.dart":(context) => const SplashScreenDemo(),
        "lib.ui.media_query.dart":(context) => const MediaQueryDemo(),
        "lib.ui.other.dart":(context) => const OtherDemo(),
        "lib.shape.border.dart":(context) => const BorderDemo(),
        "lib.shape.clip.dart":(context) => const ClipDemo(),
        "lib.shape.gradient.dart":(context) => const GradientDemo(),
        "lib.shape.transform.dart":(context) => const TransformDemo(),
        "lib.shape.shadow.dart":(context) => const ShadowDemo(),
        "lib.shape.paint.dart":(context) => const PaintDemo(),
        "lib.animation.animation.dart":(context) => const AnimationDemo(),
        "lib.animation.curved_animation.dart":(context) => const CurvedAnimationDemo(),
        "lib.animation.tween.dart":(context) => const TweenDemo(),
        "lib.animation.tween2.dart":(context) => const Tween2Demo(),
        "lib.animation.tween3.dart":(context) => const Tween3Demo(),
        "lib.animation.transition.dart":(context) => const TransitionDemo(),
        "lib.animation.animated_widget.dart":(context) => const AnimatedWidgetDemo(),
        "lib.animation.animated_builder.dart":(context) => const AnimatedBuilderDemo(),
        "lib.animation.animated.dart":(context) => const AnimatedDemo(),
        "lib.animation.hero.dart":(context) => const HeroDemo(),
        "lib.animation.stagger.dart":(context) => const StaggerDemo(),
        "lib.localization.localization.dart":(context) => const LocalizationDemo(),
        "lib.network.http.dart":(context) => const HttpDemo(),
        "lib.plugin.plugin.dart":(context) => const PluginDemo(),
        "lib.plugin.plugin2.dart":(context) => const Plugin2Demo(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Node>? _siteMap;

  Future<void> _loadSiteMap() async {
    _siteMap = <Node>[];

    var str = await rootBundle.loadString('assets/README.md');
    var list = str.split("\n");
    Node? n;
    for (int i = 0; i < list.length; i++) {
      var line = list[i];
      if (line.startsWith("###")) {
        n = Node(line.substring(4).trim(), "", <Node>[]);
        _siteMap!.add(n);
      } else if (n != null && line.contains(". ")) {
        n.node.add(Node(
            line.trim(),
            list[++i].substring(list[i].indexOf("-") + 2).trim().replaceAll("/", "."),
            <Node>[]
        ));
      }
    }
  }

  @override
  void initState() {

    /// 每帧都回调，经测试 flutter 是 60 帧刷新率
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      /// log("$timeStamp");
      /// 有下面这句则每帧回调，没有下面这句则每次渲染时回调
      SchedulerBinding.instance.scheduleFrame();
    });

    /// 判断当前是否是 release 模式
    if (kReleaseMode) {
      log("release 模式");
    } else {
      log("debug 模式");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _loadSiteMap(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container(
            color: Colors.orange,
            child: const Center(
              child: MyText("loading"),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          backgroundColor: Colors.yellow[200],
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ExpansionTile(
                initiallyExpanded: false,
                title: Text(
                  _siteMap![index].title,
                ),
                collapsedBackgroundColor: Colors.yellow[200],
                backgroundColor: Colors.green[200],
                collapsedTextColor: Colors.black,
                textColor: Colors.black,
                collapsedIconColor: Colors.black,
                iconColor: Colors.black,
                children: _siteMap![index].node.map((e) =>
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          child: Text(
                            e.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, e.url);
                      },
                    ),
                ).toList(),
              );
            },
            itemCount: _siteMap!.length,
          ),
        );
      }
    );
  }
}

class Node {
  String title;
  String url;
  List<Node> node;
  Node(this.title, this.url, this.node);
}
