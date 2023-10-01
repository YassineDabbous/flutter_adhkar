// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Adhkar`
  String get app_name {
    return Intl.message(
      'Adhkar',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `& Ruqia`
  String get app_slogon {
    return Intl.message(
      '& Ruqia',
      name: 'app_slogon',
      desc: '',
      args: [],
    );
  }

  /// `ADhkar is one of the best applications for the daily prayers of a Muslim. Download Link:`
  String get app_share_message {
    return Intl.message(
      'ADhkar is one of the best applications for the daily prayers of a Muslim. Download Link:',
      name: 'app_share_message',
      desc: '',
      args: [],
    );
  }

  /// `{quantity, plural, one{Repeated One time.} other{Repeated: {repeated} times}}`
  String repeatedTimes(num quantity, Object repeated) {
    return Intl.plural(
      quantity,
      one: 'Repeated One time.',
      other: 'Repeated: $repeated times',
      name: 'repeatedTimes',
      desc: '',
      args: [quantity, repeated],
    );
  }

  /// `Adhkar`
  String get adhkar {
    return Intl.message(
      'Adhkar',
      name: 'adhkar',
      desc: '',
      args: [],
    );
  }

  /// `Counter`
  String get counter {
    return Intl.message(
      'Counter',
      name: 'counter',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Times`
  String get prayerTimes {
    return Intl.message(
      'Prayer Times',
      name: 'prayerTimes',
      desc: '',
      args: [],
    );
  }

  /// `Holy Quran`
  String get quran {
    return Intl.message(
      'Holy Quran',
      name: 'quran',
      desc: '',
      args: [],
    );
  }

  /// `Qibla`
  String get qibla {
    return Intl.message(
      'Qibla',
      name: 'qibla',
      desc: '',
      args: [],
    );
  }

  /// `Names of God`
  String get asmaa {
    return Intl.message(
      'Names of God',
      name: 'asmaa',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get introduction {
    return Intl.message(
      'Introduction',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `Don't forget adhkar salah`
  String get dontForgetAdhkarSalah {
    return Intl.message(
      'Don\'t forget adhkar salah',
      name: 'dontForgetAdhkarSalah',
      desc: '',
      args: [],
    );
  }

  /// `Fajr prayer`
  String get prayer_fajr {
    return Intl.message(
      'Fajr prayer',
      name: 'prayer_fajr',
      desc: '',
      args: [],
    );
  }

  /// `Dhuhr  prayer`
  String get prayer_dhuhr {
    return Intl.message(
      'Dhuhr  prayer',
      name: 'prayer_dhuhr',
      desc: '',
      args: [],
    );
  }

  /// `Asr  prayer`
  String get prayer_asr {
    return Intl.message(
      'Asr  prayer',
      name: 'prayer_asr',
      desc: '',
      args: [],
    );
  }

  /// `Maghreb prayer`
  String get prayer_maghreb {
    return Intl.message(
      'Maghreb prayer',
      name: 'prayer_maghreb',
      desc: '',
      args: [],
    );
  }

  /// `Isha prayer`
  String get prayer_isha {
    return Intl.message(
      'Isha prayer',
      name: 'prayer_isha',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get fajr {
    return Intl.message(
      'Fajr',
      name: 'fajr',
      desc: '',
      args: [],
    );
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message(
      'Dhuhr',
      name: 'dhuhr',
      desc: '',
      args: [],
    );
  }

  /// `Asr`
  String get asr {
    return Intl.message(
      'Asr',
      name: 'asr',
      desc: '',
      args: [],
    );
  }

  /// `Maghreb`
  String get maghreb {
    return Intl.message(
      'Maghreb',
      name: 'maghreb',
      desc: '',
      args: [],
    );
  }

  /// `Isha`
  String get isha {
    return Intl.message(
      'Isha',
      name: 'isha',
      desc: '',
      args: [],
    );
  }

  /// `Imsak`
  String get imsak {
    return Intl.message(
      'Imsak',
      name: 'imsak',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message(
      'Sunrise',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Dhuha`
  String get dhuha {
    return Intl.message(
      'Dhuha',
      name: 'dhuha',
      desc: '',
      args: [],
    );
  }

  /// `Sunset`
  String get sunset {
    return Intl.message(
      'Sunset',
      name: 'sunset',
      desc: '',
      args: [],
    );
  }

  /// `Midnight`
  String get midnight {
    return Intl.message(
      'Midnight',
      name: 'midnight',
      desc: '',
      args: [],
    );
  }

  /// `Sowar`
  String get sowar {
    return Intl.message(
      'Sowar',
      name: 'sowar',
      desc: '',
      args: [],
    );
  }

  /// `Downloads`
  String get downloads {
    return Intl.message(
      'Downloads',
      name: 'downloads',
      desc: '',
      args: [],
    );
  }

  /// `Please grant accessing storage permission to continue.`
  String get grant_storage_permission {
    return Intl.message(
      'Please grant accessing storage permission to continue.',
      name: 'grant_storage_permission',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get ready {
    return Intl.message(
      'Ready',
      name: 'ready',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Favoris`
  String get favoris {
    return Intl.message(
      'Favoris',
      name: 'favoris',
      desc: '',
      args: [],
    );
  }

  /// `waiting`
  String get waiting {
    return Intl.message(
      'waiting',
      name: 'waiting',
      desc: '',
      args: [],
    );
  }

  /// `Themes`
  String get themes {
    return Intl.message(
      'Themes',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Prayer notifications`
  String get notification_prayers {
    return Intl.message(
      'Prayer notifications',
      name: 'notification_prayers',
      desc: '',
      args: [],
    );
  }

  /// `Salat Dhuha`
  String get notification_dhuha {
    return Intl.message(
      'Salat Dhuha',
      name: 'notification_dhuha',
      desc: '',
      args: [],
    );
  }

  /// `Adhkar sabah`
  String get notification_adhkar_sabah {
    return Intl.message(
      'Adhkar sabah',
      name: 'notification_adhkar_sabah',
      desc: '',
      args: [],
    );
  }

  /// `Adhkar masaa`
  String get notification_adhkar_masaa {
    return Intl.message(
      'Adhkar masaa',
      name: 'notification_adhkar_masaa',
      desc: '',
      args: [],
    );
  }

  /// `Wetr`
  String get notification_wetr {
    return Intl.message(
      'Wetr',
      name: 'notification_wetr',
      desc: '',
      args: [],
    );
  }

  /// `jumaa`
  String get notification_jumaa {
    return Intl.message(
      'jumaa',
      name: 'notification_jumaa',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Empty class ☺`
  String get empty_adhkar {
    return Intl.message(
      'Empty class ☺',
      name: 'empty_adhkar',
      desc: '',
      args: [],
    );
  }

  /// `There is no bookmarked Dhikr currently`
  String get empty_favoris {
    return Intl.message(
      'There is no bookmarked Dhikr currently',
      name: 'empty_favoris',
      desc: '',
      args: [],
    );
  }

  /// `Share app`
  String get share_app {
    return Intl.message(
      'Share app',
      name: 'share_app',
      desc: '',
      args: [],
    );
  }

  /// `Rate App`
  String get rate_app {
    return Intl.message(
      'Rate App',
      name: 'rate_app',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'TN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
