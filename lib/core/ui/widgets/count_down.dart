import 'dart:async';

import 'package:flutter/material.dart';

class CountDownView extends StatefulWidget {
  final DateTime time;
  CountDownView(this.time);
  @override
  _CountDownViewState createState() => _CountDownViewState();
}

class _CountDownViewState extends State<CountDownView> {
  Timer? _timer;
  String remain = '59:59:59';
  @override
  Widget build(BuildContext context) {
    startTimer();
    return Text(
      remain,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          setState(
            () {
              if (remain == '00:00:00') {
                timer.cancel();
              } else {
                remain = printDuration((context.widget as CountDownView).time.difference(DateTime.now()));
              }
            },
          );
        }
      },
    );
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    //return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
