import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adhkar/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => ResponsiveHomeScreen()));
    });

    return Container(
      child: Image(
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        image: AssetImage('assets/images/launch_background.jpg'),
      ),
    );
  }
}
