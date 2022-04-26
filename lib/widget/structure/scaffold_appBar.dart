/*
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class ScaffoldAppBarDemo extends StatefulWidget {
  const ScaffoldAppBarDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldAppBarDemoState createState() => _ScaffoldAppBarDemoState();
}

class _ScaffoldAppBarDemoState extends State<ScaffoldAppBarDemo> {
  var _primary = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        /// leading: const Icon(Icons.arrow_back),
        title: const Text('title'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () { },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () { },
          ),
        ],
        flexibleSpace: const Icon(Icons.wifi),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('bottom'),
        ),
        shape: BeveledRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(0)
        ),

        backgroundColor: Colors.green,
        shadowColor: Colors.black,
        elevation: 100,
        foregroundColor: Colors.red,

        primary: _primary,
        centerTitle: false,
        titleSpacing: 20,
        toolbarOpacity: 1,
        bottomOpacity: 1,
        toolbarHeight: 100,
        leadingWidth: 100,


        toolbarTextStyle: TextStyle(color: Colors.purple),
        titleTextStyle: TextStyle(color: Colors.purple),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: Center(
        child: MyButton(
          child: MyText("primary: $_primary"),
          onPressed: () {
            setState(() {
              _primary ^= true;
            });
          },
        ),
      ),
    );
  }
}