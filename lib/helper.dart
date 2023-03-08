import 'package:flutter/material.dart';

void log(String message) {
  debugPrint(message);
}

int currentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.text,
  }):super(key:key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.white,
          decoration: TextDecoration.none
        ),
      ),
    );
  }
}

class MyText extends Text {
  const MyText(String data, {Key? key}) : super(
    data,
    key: key,
    style: const TextStyle(
      fontSize: 24.0,
      color: Colors.white,
      decoration: TextDecoration.none
    ),
  );
}

class MyTextSmall extends Text {
  const MyTextSmall(String data, {Key? key}) : super(
    data,
    key: key,
    style: const TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        decoration: TextDecoration.none
    ),
  );
}

class MyButton extends TextButton {
  MyButton({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required Widget child,
  }) : super(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: style ?? TextButton.styleFrom(
      padding: const EdgeInsets.all(5.0),
      primary: Colors.white,
      backgroundColor: Colors.blue,
      textStyle: const TextStyle(fontSize: 16),
    ),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    child: child,
  );
}