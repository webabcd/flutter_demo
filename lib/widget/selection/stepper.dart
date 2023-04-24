/*
 * Stepper - 步骤选择
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({Key? key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {

  /// 步骤的排列方向（vertical 或 horizontal）
  StepperType _stepperType = StepperType.vertical;
  /// 当前编辑的步骤的索引
  int _currentStepIndex = 0;
  /// 数据源
  final List<_MyModel> _dataList = [];
  
  @override
  void initState(){
    super.initState();

    _dataList.add(_MyModel("title0", "subtitle0", "这是第一步"));
    _dataList.add(_MyModel("title1", "subtitle0", "这是第二步"));
    _dataList.add(_MyModel("title2", "subtitle0", "这是第三步"));
  }

  /// 用于定义每个步骤，是一个 Step 类型的集合
  List<Step> _getStepList() {
    List<Step> stepList = [];
    for (var i = 0; i < _dataList.length; i++) {
      var model = _dataList[i];
      /// 步骤的状态
      ///   indexed - 在小圆圈上显示步骤的索引
      ///   editing - 在小圆圈上显示铅笔图标
      ///   complete - 在小圆圈上显示对钩图标
      ///   disabled - 标题变为灰色
      ///   error - 显示错误图标，标题变为红色
      var state = StepState.indexed;
      if(_currentStepIndex == i) {
        state = StepState.editing;
      } else if(_currentStepIndex > i) {
        state = StepState.complete;
      }

      stepList.add(
        /// 用于定义每个步骤
        Step(
          title: Text(model.title),
          subtitle: Text(model.subtitle),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Text(model.content),
          ),
          /// true - 以本例为例，小圆圈为蓝色背景，可以通过主题修改这个颜色
          /// false - 以本例为例，小圆圈为灰色背景，可以通过主题修改这个颜色
          isActive: (_currentStepIndex >= _dataList.indexOf(model)),
          /// 步骤的状态
          state: state,
        ),
      );
    }
    return stepList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.white,
      /// Stepper - 步骤选择
      body: Stepper(
        /// 步骤的排列方向（vertical 或 horizontal）
        type: _stepperType,
        /// 滚动到边缘时的物理效果，参见 list_view.dart
        physics: const BouncingScrollPhysics(),
        /// 当前编辑的步骤在 steps 中的索引位置
        currentStep: _currentStepIndex,
        /// 所有的步骤集合，一个 Step 类型的集合
        steps: _getStepList(),
        /// 用于自定义编辑状态下的步骤中的控制按钮，如果不定义 controlsBuilder 则会显示默认的控制按钮
        controlsBuilder: (BuildContext context, ControlsDetails details)  {
          return Row(
            children: [
              MyButton(
                onPressed: details.onStepCancel,
                child: const Text('上一步'),
              ),
              Container(
                width: 10,
              ),
              MyButton(
                onPressed: details.onStepContinue,
                child: const Text('下一步'),
              ),
            ],
          );
        },
        /// 点击当前步骤时
        onStepTapped: (index) {
          setState(() {
            _currentStepIndex = index;
          });
        },
        /// 点击下一步时
        onStepContinue: () {
          setState(() {
            if (_currentStepIndex < _dataList.length - 1) {
              _currentStepIndex++;
            }
          });
        },
        /// 点击上一步时
        onStepCancel: () {
          setState(() {
            if (_currentStepIndex > 0) {
              _currentStepIndex--;
            }
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            /// 切换 StepperType（垂直排列每个步骤或水平排列每个步骤）
            _stepperType = _stepperType == StepperType.vertical ? StepperType.horizontal : StepperType.vertical;
          });
        },
        label: const Text("切换 StepperType"),
      ),
    );
  }
}

/// 用于数据源
class _MyModel {
  String title;
  String subtitle;
  String content;

  _MyModel(this.title, this.subtitle, this.content);
}