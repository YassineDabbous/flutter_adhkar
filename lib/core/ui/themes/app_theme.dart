import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<MyAppTheme> getDefaultTheme() async {
  final sp = await SharedPreferences.getInstance();
  int themeIndex = 0;
  try {
    themeIndex = sp.getInt('theme') ?? 1; // second theme is the default
  } catch (Exception) {
    //themeIndex = 0;
  }
  print('theme INDEX $themeIndex');
  return MyAppTheme.values[themeIndex];
}

Future setDefaultTheme(int themeIndex) async {
  final sp = await SharedPreferences.getInstance();
  sp.setInt('theme', themeIndex);
}

enum MyAppTheme { Light, Dark, Green }

class CustomTheme {
  final String name;
  final ThemeData themeData;

  CustomTheme(this.name, this.themeData);
}

final Map<MyAppTheme, CustomTheme> appThemeData = {
  MyAppTheme.Light: CustomTheme(
      'Day Theme',
      ThemeData.light().copyWith(
        backgroundColor: const Color(0xFFFFFFFF),
      )),
  MyAppTheme.Dark: CustomTheme(
      'Dark Theme',
      ThemeData(
          /*
          primarySwatch: Colors.grey,
          dividerColor: Colors.black12,
          accentIconTheme: IconThemeData(color: Colors.black),*/
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(),
          backgroundColor: const Color(0xFF212121),
          primaryColor: Colors.grey[800], //Colors.black,
          accentColor: Colors.grey[700], //Color(0xff896277),
          cardColor: Colors.grey[700],
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.transparent,
            elevation: 0.0,
          ),
          fontFamily: 'LoransMuna', //'Sogeo',
          textTheme: myTextTheme)),
  MyAppTheme.Green: CustomTheme(
      'Akhdar',
      ThemeData.dark().copyWith(
        brightness: Brightness.light,
        backgroundColor: Colors.green[800],
        primaryColor: Colors.green[800],
        accentColor: Colors.green,
        scaffoldBackgroundColor: Colors.green[800],
        cardColor: Colors.green,
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        textTheme: myTextTheme.apply(fontFamily: 'Georgia', bodyColor: Colors.white, displayColor: Colors.greenAccent),
      )),
};

final myTextTheme = TextTheme(
    headline1: TextStyle(fontFamily: 'Sogeo', fontSize: 42, fontWeight: FontWeight.w600),
    headline2: TextStyle(fontFamily: 'Sogeo', fontSize: 28, fontWeight: FontWeight.w600),
    bodyText1: TextStyle(fontFamily: "Sogeo", fontSize: 18, fontWeight: FontWeight.w600),
    caption: TextStyle(fontFamily: "Sogeo", fontSize: 14));
