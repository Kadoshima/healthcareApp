import 'package:flutter/material.dart';
import 'dart:async';
import 'second_screen.dart';
import 'package:location/location.dart';

void main() {
  runApp(LocationApp());
}

class LocationApp extends StatefulWidget {
  @override
  _LocationApp createState() => _LocationApp();
}

class _LocationApp extends State<LocationApp> {
  late Timer _timer;
  late Location _location;

  @override
  void initState() {
    super.initState();
    _location = new Location();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('時間計測')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _location.getLocation().then((value) {
                    print(value);
                  });
                },
                child: Text('位置情報取得'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => second_screen()),
            );
          },
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
