import 'package:flutter/material.dart';
import 'package:adhkar/features/adhkar/ui/pages/categories_page.dart';
import 'package:adhkar/features/asmaa/asmaa.dart';
import 'package:adhkar/features/counter/counter_page.dart';
// import 'package:adhkar/features/prayer/praytimes.dart';
// import 'package:adhkar/features/qibla/main.dart';
import 'package:adhkar/features/quran/quran.dart';
import 'package:adhkar/features/settings/settings_screen.dart';
// import 'package:adhkar/generated/l10n.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:adhkar/core/app/constants.dart';

Map<String, WidgetBuilder> myRoutes = {
  '/adhkar': (context) => CategoriesPage(),
  '/quran': (context) => SowarScreen(),
  // '/qibla': (context) => QiblaPage(),
  // '/praytimes': (context) => PrayTimesPage(),
  '/counter': (context) => CounterPage(),
  '/asmaa': (context) => AsmaaPage(),
  '/settings': (context) => SettingsScreen(),
  // '/aboutus': (c) => new WebviewScaffold(
  //       url: kLinkAboutUs,
  //       appBar: new AppBar(
  //         title: Text(S.of(c).introduction),
  //       ),
  //       withZoom: false,
  //       withLocalStorage: false,
  //       hidden: true,
  //       initialChild: Container(
  //         //color: Color(0xff28374a),
  //         child: Center(
  //           child: Text('${S.of(c).waiting}...'),
  //         ),
  //       ),
  //     ),
};
