import 'package:flutter/material.dart';

class second_screen extends StatefulWidget {
  @override
  _second_screenState createState() => _second_screenState();
}

class _second_screenState extends State<second_screen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状態管理')),
      body: Center(
        child: Text('TEST') // ここに表示する内容を追加
        ),
    );
  }
}