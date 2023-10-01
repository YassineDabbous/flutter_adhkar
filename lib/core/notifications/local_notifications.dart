import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

enum Daily {
  ADHKAR_SABAH,
  ADHKAR_MASAA,
  ADHKAR_WETR,
  ADHKAR_JUMAA,
  ADHKAR_DHUHA,
  SALAT_SUBH,
  SALAT_DHUHR,
  SALAT_ASR,
  SALAT_MAGHREB,
  SALAT_ISHA,
}

// for plugin https://pub.dev/packages/flutter_local_notifications
class LocalNotificationHelper {
  static FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  static Future init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = const IOSInitializationSettings(onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin?.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );
    print('Notifications initialized :D');
  }

  static void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
    print('_onDidReceiveLocalNotification');
    print('id $id, title $title, body $body, payload $payload');
  }

  static Future _onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    /*await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen(payload)),
    );*/
  }

  Future push(String title, String body, String data, [String ticker = '']) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'single channel id',
      'single channel name',
      channelDescription: 'single channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: ticker,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin?.show(0, title, body, platformChannelSpecifics, payload: data);
  }

  Future daily(Daily id, DateTime dateTime, String title, String body, {String? payload}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'daily_channel_id',
      'daily_channel_name',
      channelDescription: 'daily_channel_description',
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    var time = toTime(dateTime); //Time(10, 0, 0);
    await flutterLocalNotificationsPlugin?.showDailyAtTime(Daily.values.indexOf(id), title, body, time, platformChannelSpecifics, payload: payload);
  }

  Future dailyAdhkar(int id, DateTime dateTime, String title, String body, {String? payload}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'adhkar_channel_id',
      'Duaa Channel',
      channelDescription: 'custom Duaa notification',
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    var time = toTime(dateTime); //Time(10, 0, 0);
    await flutterLocalNotificationsPlugin?.showDailyAtTime(id, title, body, time, platformChannelSpecifics, payload: payload);
  }

  Future scheduling(Time time) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      channelDescription: 'your other channel description',
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    // schedule
    var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 5));
    await flutterLocalNotificationsPlugin?.schedule(0, 'scheduled title', 'scheduled body', scheduledNotificationDateTime, platformChannelSpecifics);
    // repeating EveryMinute
    await flutterLocalNotificationsPlugin?.periodicallyShow(0, 'repeating title', 'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics);
    // weekly on Friday
    await flutterLocalNotificationsPlugin?.showWeeklyAtDayAndTime(
        0,
        'show weekly title',
        'Weekly notification shown on Monday at approximately ${_toTwoDigitString(time.hour)}:${_toTwoDigitString(time.minute)}:${_toTwoDigitString(time.second)}',
        Day.friday,
        time,
        platformChannelSpecifics);
  }

  Future cancelById(int id) async {
    // cancel the notification with id value of zero
    await flutterLocalNotificationsPlugin?.cancel(id);
  }

  Future cancel(Daily id) async {
    // cancel the notification with id value of zero
    await flutterLocalNotificationsPlugin?.cancel(Daily.values.indexOf(id));
  }

  cancelPrayers() {
    cancel(Daily.SALAT_SUBH);
    cancel(Daily.SALAT_DHUHR);
    cancel(Daily.SALAT_ASR);
    cancel(Daily.SALAT_MAGHREB);
    cancel(Daily.SALAT_ISHA);
  }

  Future cancelAll() async {
    //Cancelling/deleting all notifications #
    await flutterLocalNotificationsPlugin?.cancelAll();
  }

  Time toTime(DateTime dateTime) => Time(dateTime.hour, dateTime.minute, dateTime.second);

  String _toTwoDigitString(int o) => '$o';
}
