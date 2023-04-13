/*
 * Draggable/DragTarget - 拖拽
 *
 * Draggable - 按下后可拖拽的对象
 * LongPressDraggable - 长按后可拖拽的对象
 * DragTarget - 拖拽目标，可拖拽对象拖拽到 DragTarget 后可以有交互
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DragDemo extends StatelessWidget {
  const DragDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Container(
        color: Colors.orange,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,
              left: 10,
              /// 按下后可拖拽的对象
              child: Draggable(
                /// 传递给 DragTarget 的数据，其类型是泛型 T 也就是说可以传递任意类型的数据
                data: "abc",
                /// 未拖拽时显示的组件
                child: Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const MyTextSmall('未拖拽'),
                ),
                /// 拖拽中时显示的组件
                feedback: Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const MyTextSmall('拖拽中'),
                ),
                /// 拖拽中时，初始位置显示的组件
                /// 如果不指定 childWhenDragging 则拖拽中时，初始位置会显示 child
                childWhenDragging: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const MyTextSmall('拖拽中时，初始位置显示的组件'),
                ),

                /// 可拖拽的方向
                /// null - 任意方向
                /// Axis.horizontal - 仅水平方向
                /// Axis.vertical - 仅垂直方向
                axis: null,
                /// 拖拽中时显示的组件与触摸点的行为
                /// pointerDragAnchorStrategy - 拖拽中时显示的组件的左上角的坐标与触摸点的坐标一致
                /// childDragAnchorStrategy - 正常行为
                dragAnchorStrategy: childDragAnchorStrategy,
                /// 最大支持的可同时拖拽的数量
                maxSimultaneousDrags: null,

                /// 开始拖拽时（按下）
                onDragStarted: () {
                  log("onDragStarted");
                },
                /// 拖拽结束时（抬起）
                onDragEnd: (DraggableDetails details) {
                  /// velocity - 用于描述拖拽动作的触摸点的位移速度
                  /// offset - 拖拽动作的触摸点的全局坐标
                  log("onDragEnd velocity:${details.velocity},offset:${details.offset}");
                },
                /// 拖拽结束时（抬起），但是没有在 DragTarget 中释放
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  /// velocity - 用于描述拖拽动作的触摸点的位移速度
                  /// offset - 拖拽动作的触摸点的全局坐标
                  log('onDraggableCanceled velocity:$velocity,offset:$offset');
                },
                /// 拖拽结束时（抬起），并且在 DragTarget 中释放了
                onDragCompleted: () {
                  log('onDragCompleted');
                },
              ),
            ),

            Positioned(
              top: 10,
              right: 10,
              /// 长按后可拖拽的对象（其他行为和 Draggable 一致，请参见上面关于 Draggable 的说明）
              child: LongPressDraggable(
                /// 传递给 DragTarget 的数据，其类型是泛型 T 也就是说可以传递任意类型的数据
                data: "xyz",
                /// 未拖拽时显示的组件
                child: Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const MyTextSmall('未拖拽'),
                ),
                /// 拖拽中时显示的组件
                feedback: Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const MyTextSmall('拖拽中'),
                ),
              ),
            ),

            Positioned(
              /// 拖拽目标，可拖拽对象拖拽到 DragTarget 后可以有交互
              child: DragTarget(
                /// 有 4 种情况会执行到这里
                /// 1、初始时
                /// 2、拖拽动作的触摸点进入时
                /// 3、拖拽动作的触摸点进入后释放时
                /// 4、拖拽动作的触摸点离开时
                builder: (BuildContext context, List<String?> candidateData, List<dynamic> rejectedData) {
                  /// candidateData - 当拖拽动作的触摸点进入时，且 onWillAccept() 返回了 true 则可拖拽对象传来的数据会保存在这里，否则这里是空数据
                  /// rejectedData - 当拖拽动作的触摸点进入时，且 onWillAccept() 返回了 false 则可拖拽对象传来的数据会保存在这里，否则这里是空数据
                  log("candidateData: ${candidateData.isNotEmpty ? candidateData.first : ""}");
                  
                  return Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: const MyTextSmall("拖拽目标"),
                  );
                },
                /// 拖拽动作的触摸点进入时，其中的 data 是可拖拽对象传来的数据
                onWillAccept: (data) {
                  log('onWillAccept $data');
                  /// 返回 true 则 data 会保存到 builder 的 candidateData 中
                  /// 返回 false 则 data 会保存到 builder 的 rejectedData 中
                  return true;
                },
                /// 拖拽动作的触摸点进入后释放时，其中的 data 是可拖拽对象传来的数据
                onAccept: (data) {
                  log('onAccept $data');
                },
                /// 拖拽动作的触摸点进入后释放时
                onAcceptWithDetails: (DragTargetDetails<String> details) {
                  /// details.data - 可拖拽对象传来的数据
                  /// details.offset - 拖拽动作的触摸点的全局坐标
                  log('onAcceptWithDetails ${details.data}, ${details.offset}');
                },
                /// 拖拽动作的触摸点离开时，其中的 data 是可拖拽对象传来的数据
                onLeave: (data) {
                  log('onLeave $data');
                },
                /// 拖拽动作的触摸点进入后并移动时
                onMove: (DragTargetDetails<String> details) {
                  /// details.data - 可拖拽对象传来的数据
                  /// details.offset - 拖拽动作的触摸点的全局坐标
                  log('onMove ${details.data}, ${details.offset}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}