import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vibration/vibration.dart';

class CircleCounter extends StatefulWidget {
  final Color counterColor = Colors.green;
  final Color backgroundColor = Colors.white;
  final int max;
  final Function onComplete;
  CircleCounter(this.max, this.onComplete);

  @override
  _CircleCounterState createState() => _CircleCounterState();
}

class _CircleCounterState extends State<CircleCounter> {
  double _percent = 0;
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final width = sizingInformation.localWidgetSize.width;
        return Stack(
          children: [
            Positioned(
              left: 0,
              top: width / 22,
              child: Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: Colors.white),
                  borderRadius: BorderRadius.circular(width),
                ),
              ),
            ),
            Positioned(
              child: GestureDetector(
                child: CircularPercentIndicator(
                  progressColor: widget.counterColor,
                  animation: true,
                  animateFromLastPercent: current == 1 ? false : true,
                  animationDuration: 500,
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: width,
                  lineWidth: width / 10,
                  backgroundWidth: width / 22,
                  percent: _percent,
                  center: Text(
                    '$current/${widget.max}',
                    style: TextStyle(fontSize: width / 4, color: Colors.black),
                  ),
                ),
                onTap: _incriment,
              ),
            ),
          ],
        );
      },
    );
  }

  void _reset() {
    setState(() {
      _percent = 0;
      current = 0;
    });
  }

  void _incriment() async {
    if (_percent >= 1.0) {
      _reset();
    }
    current++;
    _percent = current / widget.max;
    print("max: ${widget.max} current: $current , percent: $_percent %");
    setState(() {});
    if (_percent == 1.0 && (await Vibration.hasVibrator() ?? false)) {
      Vibration.vibrate();
      widget.onComplete();
    }
  }
}
