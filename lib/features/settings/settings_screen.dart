import 'dart:convert';

import 'package:adhkar/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:adhkar/core/app/constants.dart';
import 'package:adhkar/core/notifications/local_notifications.dart';
import 'package:adhkar/core/ui/themes/app_theme.dart';
import 'package:adhkar/features/settings/settings_models.dart';
import 'package:adhkar/features/settings/settings_prayer.dart';
import 'package:adhkar/features/settings/themes_settings_page.dart';
import 'package:adhkar/generated/l10n.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? themeName;
  SettingsModel mySettings = SettingsModel.elDefault();

  @override
  void initState() {
    super.initState();
    themeName = 'Default.';
    _loadPreferences();
  }

  void _loadPreferences() async {
    themeName = appThemeData[await getDefaultTheme()]?.name;
    final sp = await SharedPreferences.getInstance();
    final s = sp.getString(SettingsModel.key);
    if (s != null)
      setState(() {
        mySettings = SettingsModel.fromJson(jsonDecode(s));
      });
  }

  _savePreferences() async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(SettingsModel.key, mySettings.toJson());
  }

  showPicker({required bool value, required String notificationTitle, required Daily id, required Function action}) async {
    if (value) {
      DatePicker.showTime12hPicker(
        context,
        showTitleActions: true,
        onConfirm: (date) async {
          print('confirm $date');
          await LocalNotificationHelper().daily(id, date, notificationTitle, '');
          action();
        },
        locale: LocaleType.en,
      );
    } else {
      await LocalNotificationHelper().cancel(id);
      action();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
        centerTitle: true,
      ),
      body: SettingsList(
        //backgroundColor: Theme.of(context).backgroundColor,
        sections: [
          SettingsSection(
            title: Text(S.of(context).general),
            // titleTextStyle: TextStyle(fontSize: 30),
            tiles: [
              SettingsTile(
                title: Text(S.of(context).language),
                description: Text(Localizations.localeOf(context).languageCode),
                leading: const Icon(Icons.language),
                onPressed: (ctx) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              SettingsTile(
                title: Text(S.of(context).themes),
                description: BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return Text(state.theme.name);
                  },
                ),
                leading: const Icon(Icons.color_lens),
                onPressed: (ctx) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ThemeSettingsPage()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(S.of(context).notifications),
            tiles: [
              SettingsTile(
                title: Text(S.of(context).notification_prayers),
                leading: Icon(Icons.notifications),
                onPressed: (ctx) {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SettingsPrayerScreen()));
                },
              ),
              SettingsTile.switchTile(
                title: Text(S.of(context).notification_prayers),
                leading: Icon(Icons.timer),
                initialValue: mySettings.notificationsAdhkarSabah,
                onToggle: (bool value) {
                  setState(() {
                    mySettings.notificationsPrayer = value;
                    _savePreferences();
                  });
                },
              ),
              SettingsTile.switchTile(
                title: Text(S.of(context).notification_adhkar_sabah),
                leading: Icon(Icons.wb_sunny),
                initialValue: mySettings.notificationsAdhkarSabah,
                onToggle: (bool value) {
                  showPicker(
                      value: value,
                      id: Daily.ADHKAR_SABAH,
                      notificationTitle: S.of(context).notification_adhkar_sabah,
                      action: () {
                        setState(() {
                          mySettings.notificationsAdhkarSabah = value;
                          _savePreferences();
                        });
                      });
                },
              ),
              SettingsTile.switchTile(
                title: Text(S.of(context).notification_adhkar_masaa),
                leading: Icon(Icons.airline_seat_flat),
                initialValue: mySettings.notificationsAdhkarMasaa,
                onToggle: (bool value) {
                  showPicker(
                      value: value,
                      id: Daily.ADHKAR_MASAA,
                      notificationTitle: S.of(context).notification_adhkar_masaa,
                      action: () {
                        setState(() {
                          mySettings.notificationsAdhkarMasaa = value;
                          _savePreferences();
                        });
                      });
                },
              ),
              SettingsTile.switchTile(
                title: Text(S.of(context).notification_dhuha),
                leading: Icon(Icons.signal_cellular_null),
                initialValue: mySettings.notificationsDhuha,
                onToggle: (bool value) {
                  showPicker(
                      value: value,
                      id: Daily.ADHKAR_DHUHA,
                      notificationTitle: S.of(context).notification_dhuha,
                      action: () {
                        setState(() {
                          mySettings.notificationsDhuha = value;
                          _savePreferences();
                        });
                      });
                },
              ),
              SettingsTile.switchTile(
                title: Text(S.of(context).notification_jumaa),
                leading: Icon(Icons.today),
                initialValue: mySettings.notificationsJumaa,
                onToggle: (bool value) {
                  showPicker(
                      value: value,
                      id: Daily.ADHKAR_JUMAA,
                      notificationTitle: S.of(context).notification_jumaa,
                      action: () {
                        setState(() {
                          mySettings.notificationsJumaa = value;
                          _savePreferences();
                        });
                      });
                },
              ),
              SettingsTile.switchTile(
                title: Text(S.of(context).notification_wetr),
                leading: Icon(Icons.access_time),
                initialValue: mySettings.notificationsWetr,
                onToggle: (bool value) {
                  showPicker(
                      value: value,
                      id: Daily.ADHKAR_WETR,
                      notificationTitle: S.of(context).notification_wetr,
                      action: () {
                        setState(() {
                          mySettings.notificationsWetr = value;
                          _savePreferences();
                        });
                      });
                },
              ),
            ],
          ),
/*
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          ),
          */

          CustomSettingsSection(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 8),
                  child: Image.asset(
                    'assets/quranRail.png',
                    height: 50,
                    width: 50,
                    color: Color(0xFF777777),
                  ),
                ),
                Text(
                  'Version: $kAppVersionNumber (2020)',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
