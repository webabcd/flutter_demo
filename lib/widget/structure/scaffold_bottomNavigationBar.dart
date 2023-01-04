/*
 *
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ScaffoldBottomNavigationBarDemo extends StatefulWidget {
  const ScaffoldBottomNavigationBarDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldBottomNavigationBarDemo createState() => _ScaffoldBottomNavigationBarDemo();
}

class _ScaffoldBottomNavigationBarDemo extends State<ScaffoldBottomNavigationBarDemo> {

  var _currentIndex = 0;
  var _type = BottomNavigationBarType.fixed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: _type,
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
            tooltip: 'i am home',
            backgroundColor: Colors.red,
            activeIcon: MyText("xdx"),
          ),
          BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(Icons.favorite),
            tooltip: 'i am favorite',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            label: 'share',
            icon: Icon(Icons.share),
            tooltip: 'i am share',
            backgroundColor: Colors.blue,
          ),
        ],
        iconSize: 24,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 14,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        selectedItemColor: Colors.yellow,
        selectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: Center(
        child: DropdownButton<BottomNavigationBarType>(
          value: _type,
          onChanged: (BottomNavigationBarType? value) {
            setState(() {
              _type = value ?? BottomNavigationBarType.fixed;
            });
          },
          items: <BottomNavigationBarType>[BottomNavigationBarType.fixed, BottomNavigationBarType.shifting].map<DropdownMenuItem<BottomNavigationBarType>>((BottomNavigationBarType value) {
            return DropdownMenuItem<BottomNavigationBarType>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
      ),
      backgroundColor: Colors.orange,
    );
  }
}