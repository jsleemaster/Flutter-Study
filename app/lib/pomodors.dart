import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const maxValue = 1500;
  int totalSeconds = maxValue;
  int totalCount = 0;
  late Timer timer;
  bool isRunning = false;

  void onTic(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = maxValue;
        totalCount = totalCount + 1;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTic);
    setState(() {
      isRunning = true;
    });
  }

  void onStopPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onReset() {
    timer.cancel();
    setState(() {
      totalSeconds = maxValue;
      isRunning = false;
    });
  }

  String format(int seconds) {
    var time =
        Duration(seconds: seconds).toString().split('.').first.substring(2);

    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(format(totalSeconds)),
              )),
          Flexible(
            flex: 2,
            child: Center(
              child: Column(children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onStopPressed : onStartPressed,
                  icon: Icon(isRunning
                      ? Icons.pause_circle_rounded
                      : Icons.play_circle_outlined),
                ),
                IconButton(
                    onPressed: onReset,
                    icon: const Icon(Icons.rotate_90_degrees_ccw_rounded))
              ]),
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("$totalCount",
                              style: TextStyle(
                                fontSize: 28,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.color,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
