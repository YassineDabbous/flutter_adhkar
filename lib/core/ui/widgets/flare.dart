import 'package:flutter/material.dart';
import 'package:adhkar/core/ui/animations/entranceFader.dart';

class Flare extends StatelessWidget {
  final Offset offset;
  final Color color;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? height;
  final double? width;
  final Duration flareDuration;

  Flare({this.bottom, this.height, this.width, this.top, required this.flareDuration, required this.color, this.left, this.right, required this.offset});

  static List<Flare> list(double width, double height) {
    return [
      Flare(
        color: const Color(0xfff9e9b8),
        offset: Offset(width, -height),
        bottom: -50,
        flareDuration: const Duration(seconds: 17),
        left: 100,
        height: 60,
        width: 60,
      ),
      Flare(
        color: const Color(0xfff9e9b8),
        offset: Offset(width, -height),
        bottom: -50,
        flareDuration: const Duration(seconds: 12),
        left: 10,
        height: 25,
        width: 25,
      ),
      Flare(
        color: const Color(0xfff9e9b8),
        offset: Offset(width, -height),
        bottom: -40,
        left: -100,
        flareDuration: const Duration(seconds: 18),
        height: 50,
        width: 50,
      ),
      Flare(
        color: const Color(0xfff9e9b8),
        offset: Offset(width, -height),
        bottom: -50,
        left: -80,
        flareDuration: const Duration(seconds: 15),
        height: 50,
        width: 50,
      ),
      Flare(
        color: const Color(0xfff9e9b8),
        offset: Offset(width, -height),
        bottom: -20,
        left: -120,
        flareDuration: const Duration(seconds: 12),
        height: 40,
        width: 40,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: EntranceFader(
        offset: offset,
        duration: flareDuration,
        delay: const Duration(milliseconds: 100),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                color,
                color.withAlpha(150),
                color.withAlpha(100),
                color.withAlpha(50),
                color.withAlpha(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
