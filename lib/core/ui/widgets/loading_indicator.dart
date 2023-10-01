import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*final widget = (Platform.isAndroid)
        ? CircularProgressIndicator()
        : CupertinoActivityIndicator();*/
    final widget = SpinKitFadingCircle(
      color: Colors.green,
    );
    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}

class LoadingIndicatorQibla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = SpinKitChasingDots(
      color: Colors.green,
    );
    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}

class LoadingIndicatorPrayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = SpinKitCubeGrid(
      color: Colors.green,
    );
    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}
