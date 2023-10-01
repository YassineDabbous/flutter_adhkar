// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:adhkar/core/notifications/local_notifications.dart';
// import 'package:adhkar/core/ui/widgets/loading_indicator.dart';
// import 'package:adhkar/features/prayer/lib/libpray.dart';
// import 'package:adhkar/features/prayer/utils.dart';
// import 'package:adhkar/features/settings/settings_models.dart';
// import 'package:adhkar/generated/l10n.dart';
// import 'package:settings_ui/settings_ui.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:geolocator/geolocator.dart';

// class SettingsPrayerScreen extends StatefulWidget {
//   @override
//   _SettingsPrayerScreenState createState() => _SettingsPrayerScreenState();
// }

// class _SettingsPrayerScreenState extends State<SettingsPrayerScreen> {
//   SettingsPrayerModel? mySettings;
//   Prayers? prayers;

//   @override
//   void initState() {
//     super.initState();
//     _locate();
//   }

//   Future<void> _locate() async {
//     //print("PrayTimesWidget locating ...");
//     Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     //print("PrayTimesWidget location ${position.toJson()}");

//     _loadPreferences();
//     prayers = PrayerTimeCalc(position.latitude, position.longitude, CalculationMethodPreset.muslimWorldLeague).getPrayers();
//     print("PrayTimesWidget calculated");
//   }

//   void _loadPreferences() async {
//     final sp = await SharedPreferences.getInstance();
//     final s = sp.getString(SettingsPrayerModel.key);
//     setState(() {
//       if (s != null)
//         mySettings = SettingsPrayerModel.fromJson(jsonDecode(s));
//       else
//         mySettings = SettingsPrayerModel.elDefault();
//     });
//   }

//   _savePreferences() async {
//     final sp = await SharedPreferences.getInstance();
//     sp.setString(SettingsPrayerModel.key, mySettings.toJson());
//   }

//   showPicker({required bool value, required String notificationTitle, required Daily id, required DateTime date, required Function action}) async {
//     if (value) {
//       DatePicker.showTime12hPicker(
//         context,
//         showTitleActions: true,
//         currentTime: date,
//         onConfirm: (date) async {
//           await LocalNotificationHelper().daily(id, date, notificationTitle, S.of(context).dontForgetAdhkarSalah);
//           action();
//         },
//         locale: LocaleType.en,
//       );
//     } else {
//       await LocalNotificationHelper().cancel(id);
//       action();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return prayers == null
//         ? LoadingIndicator()
//         : Scaffold(
//             appBar: AppBar(
//               title: Text(S.of(context).notification_prayers),
//             ),
//             body: SettingsList(
//               //backgroundColor: Theme.of(context).backgroundColor,
//               //darkBackgroundColor: Theme.of(context).backgroundColor,
//               //lightBackgroundColor: Theme.of(context).backgroundColor,
//               // backgroundColor: Colors.orange,
//               sections: [
//                 SettingsSection(
//                   title: S.of(context).notification_prayers,
//                   tiles: [
//                     // FAJR

//                     SettingsTile.switchTile(
//                       title: S.of(context).prayer_fajr,
//                       leading: Icon(Icons.wb_sunny),
//                       switchValue: mySettings.fajr,
//                       onToggle: (bool value) {
//                         showPicker(
//                             value: value,
//                             date: prayers.fajr,
//                             id: Daily.SALAT_SUBH,
//                             notificationTitle: S.of(context).prayer_fajr,
//                             action: () {
//                               setState(() {
//                                 mySettings.fajr = value;
//                                 _savePreferences();
//                               });
//                             });
//                       },
//                     ),

//                     // DHUHR

//                     SettingsTile.switchTile(
//                       title: S.of(context).prayer_dhuhr,
//                       leading: Icon(Icons.wb_sunny),
//                       switchValue: mySettings.dhuhr,
//                       onToggle: (bool value) {
//                         showPicker(
//                             value: value,
//                             date: prayers.dhuhr,
//                             id: Daily.SALAT_DHUHR,
//                             notificationTitle: S.of(context).prayer_dhuhr,
//                             action: () {
//                               setState(() {
//                                 mySettings.dhuhr = value;
//                                 _savePreferences();
//                               });
//                             });
//                       },
//                     ),

//                     // ASR

//                     SettingsTile.switchTile(
//                       title: S.of(context).prayer_asr,
//                       leading: Icon(Icons.wb_sunny),
//                       switchValue: mySettings.asr,
//                       onToggle: (bool value) {
//                         showPicker(
//                             value: value,
//                             date: prayers.asr,
//                             id: Daily.SALAT_ASR,
//                             notificationTitle: S.of(context).prayer_asr,
//                             action: () {
//                               setState(() {
//                                 mySettings.asr = value;
//                                 _savePreferences();
//                               });
//                             });
//                       },
//                     ),

//                     // maghreb

//                     SettingsTile.switchTile(
//                       title: S.of(context).prayer_maghreb,
//                       leading: Icon(Icons.wb_sunny),
//                       switchValue: mySettings.maghreb,
//                       onToggle: (bool value) {
//                         showPicker(
//                             value: value,
//                             date: prayers.maghrib,
//                             id: Daily.SALAT_MAGHREB,
//                             notificationTitle: S.of(context).prayer_maghreb,
//                             action: () {
//                               setState(() {
//                                 mySettings.maghreb = value;
//                                 _savePreferences();
//                               });
//                             });
//                       },
//                     ),

//                     // isha

//                     SettingsTile.switchTile(
//                       title: S.of(context).prayer_isha,
//                       leading: Icon(Icons.wb_sunny),
//                       switchValue: mySettings.isha,
//                       onToggle: (bool value) {
//                         showPicker(
//                             value: value,
//                             date: prayers.isha,
//                             id: Daily.SALAT_ISHA,
//                             notificationTitle: S.of(context).prayer_isha,
//                             action: () {
//                               setState(() {
//                                 mySettings.isha = value;
//                                 _savePreferences();
//                               });
//                             });
//                       },
//                     ),

//                     // end
//                   ],
//                 ),
//               ],
//             ),
//           );
//   }
// }
