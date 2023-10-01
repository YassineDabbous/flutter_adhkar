// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(quantity, repeated) =>
      "${Intl.plural(quantity, one: 'Repeated One time.', other: 'Repeated: ${repeated} times')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adhkar": MessageLookupByLibrary.simpleMessage("Adhkar"),
        "app_name": MessageLookupByLibrary.simpleMessage("Adhkar"),
        "app_share_message": MessageLookupByLibrary.simpleMessage(
            "ADhkar is one of the best applications for the daily prayers of a Muslim. Download Link:"),
        "app_slogon": MessageLookupByLibrary.simpleMessage("& Ruqia"),
        "asmaa": MessageLookupByLibrary.simpleMessage("Names of God"),
        "asr": MessageLookupByLibrary.simpleMessage("Asr"),
        "canceled": MessageLookupByLibrary.simpleMessage("Canceled"),
        "counter": MessageLookupByLibrary.simpleMessage("Counter"),
        "dhuha": MessageLookupByLibrary.simpleMessage("Dhuha"),
        "dhuhr": MessageLookupByLibrary.simpleMessage("Dhuhr"),
        "dontForgetAdhkarSalah":
            MessageLookupByLibrary.simpleMessage("Don\'t forget adhkar salah"),
        "downloads": MessageLookupByLibrary.simpleMessage("Downloads"),
        "empty_adhkar": MessageLookupByLibrary.simpleMessage("Empty class ☺"),
        "empty_favoris": MessageLookupByLibrary.simpleMessage(
            "There is no bookmarked Dhikr currently"),
        "failed": MessageLookupByLibrary.simpleMessage("Failed"),
        "fajr": MessageLookupByLibrary.simpleMessage("Fajr"),
        "favoris": MessageLookupByLibrary.simpleMessage("Favoris"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "grant_storage_permission": MessageLookupByLibrary.simpleMessage(
            "Please grant accessing storage permission to continue."),
        "help": MessageLookupByLibrary.simpleMessage("Help"),
        "imsak": MessageLookupByLibrary.simpleMessage("Imsak"),
        "introduction": MessageLookupByLibrary.simpleMessage("Introduction"),
        "isha": MessageLookupByLibrary.simpleMessage("Isha"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading"),
        "maghreb": MessageLookupByLibrary.simpleMessage("Maghreb"),
        "midnight": MessageLookupByLibrary.simpleMessage("Midnight"),
        "notification_adhkar_masaa":
            MessageLookupByLibrary.simpleMessage("Adhkar masaa"),
        "notification_adhkar_sabah":
            MessageLookupByLibrary.simpleMessage("Adhkar sabah"),
        "notification_dhuha":
            MessageLookupByLibrary.simpleMessage("Salat Dhuha"),
        "notification_jumaa": MessageLookupByLibrary.simpleMessage("jumaa"),
        "notification_prayers":
            MessageLookupByLibrary.simpleMessage("Prayer notifications"),
        "notification_wetr": MessageLookupByLibrary.simpleMessage("Wetr"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "prayerTimes": MessageLookupByLibrary.simpleMessage("Prayer Times"),
        "prayer_asr": MessageLookupByLibrary.simpleMessage("Asr  prayer"),
        "prayer_dhuhr": MessageLookupByLibrary.simpleMessage("Dhuhr  prayer"),
        "prayer_fajr": MessageLookupByLibrary.simpleMessage("Fajr prayer"),
        "prayer_isha": MessageLookupByLibrary.simpleMessage("Isha prayer"),
        "prayer_maghreb":
            MessageLookupByLibrary.simpleMessage("Maghreb prayer"),
        "qibla": MessageLookupByLibrary.simpleMessage("Qibla"),
        "quran": MessageLookupByLibrary.simpleMessage("Holy Quran"),
        "rate_app": MessageLookupByLibrary.simpleMessage("Rate App"),
        "ready": MessageLookupByLibrary.simpleMessage("Ready"),
        "repeatedTimes": m0,
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "settings": MessageLookupByLibrary.simpleMessage("settings"),
        "share_app": MessageLookupByLibrary.simpleMessage("Share app"),
        "sowar": MessageLookupByLibrary.simpleMessage("Sowar"),
        "sunrise": MessageLookupByLibrary.simpleMessage("Sunrise"),
        "sunset": MessageLookupByLibrary.simpleMessage("Sunset"),
        "themes": MessageLookupByLibrary.simpleMessage("Themes"),
        "waiting": MessageLookupByLibrary.simpleMessage("waiting")
      };
}
