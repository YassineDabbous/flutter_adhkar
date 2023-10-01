import 'package:flutter/material.dart';
import 'package:adhkar/core/ui/widgets/flare.dart';

class FlareStack {
  static Widget mystack(double width, double height, Widget child) {
    return Stack(
      children: [child, ...Flare.list(width, height)],
    );
  }

  static Widget stack(double width, double height, List<Widget> children) {
    return Stack(
      children: [...children, ...Flare.list(width, height)],
    );
  }

  static Widget column(double width, double height, List<Widget> children) {
    return Column(
      children: [...children, ...Flare.list(width, height)],
    );
  }
}
