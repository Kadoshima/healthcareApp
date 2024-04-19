import 'package:flutter/material.dart';
import 'dart:async';
import 'second_screen.dart';

void main() {
  runApp(StopwatchApp());
}

class StopwatchApp extends StatefulWidget {
  @override
  _StopwatchAppState createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_stopwatch.isRunning) {
        setState(() {
          // 毎秒UIを更新
        });
      }
    });
  }

  String _formattedTime() {
    final duration = _stopwatch.elapsed;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('時間計測')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _formattedTime(),
                style: TextStyle(fontSize: 48),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_stopwatch.isRunning) {
                      _stopwatch.stop();
                      _timer?.cancel();
                    } else {
                      _stopwatch.start();
                      _startTimer();
                    }
                  });
                },
                child: Text(_stopwatch.isRunning ? '停止' : '開始'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _stopwatch.reset();
                  });
                },
                child: Text('リセット'),
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
