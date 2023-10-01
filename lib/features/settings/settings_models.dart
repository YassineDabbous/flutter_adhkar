class SettingsModel {
  static String key = 'SettingsModel';

  bool notificationsPrayer;
  bool notificationsAdhkarSabah;
  bool notificationsAdhkarMasaa;
  bool notificationsWetr;
  bool notificationsJumaa;
  bool notificationsDhuha;

  SettingsModel(this.notificationsPrayer, this.notificationsAdhkarSabah, this.notificationsAdhkarMasaa, this.notificationsWetr, this.notificationsJumaa,
      this.notificationsDhuha);

  factory SettingsModel.elDefault() {
    return SettingsModel(true, false, false, false, false, false);
  }

  factory SettingsModel.fromJson(dynamic json) {
    return SettingsModel(json['notificationsPrayer'] as bool, json['notificationsAdhkarSabah'] as bool, json['notificationsAdhkarMasaa'] as bool,
        json['notificationsWetr'] as bool, json['notificationsJumaa'] as bool, json['notificationsDhuha'] as bool);
  }

  String toJson() {
    //Map<String, dynamic>
    final j = '''{
      "notificationsPrayer": $notificationsPrayer,
      "notificationsAdhkarSabah": $notificationsAdhkarSabah,
      "notificationsAdhkarMasaa": $notificationsAdhkarMasaa,
      "notificationsWetr": $notificationsWetr,
      "notificationsJumaa": $notificationsJumaa,
      "notificationsDhuha": $notificationsDhuha
    }''';
    print('save' + j.toString());
    return j.toString();
  }
}

class SettingsPrayerModel {
  static String key = 'SettingsPrayerModel';
  bool fajr;
  bool dhuhr;
  bool asr;
  bool maghreb;
  bool isha;

  SettingsPrayerModel(this.fajr, this.dhuhr, this.asr, this.maghreb, this.isha);

  factory SettingsPrayerModel.elDefault() {
    return SettingsPrayerModel(true, true, true, true, true);
  }

  factory SettingsPrayerModel.fromJson(dynamic json) {
    return SettingsPrayerModel(
      json['fajr'],
      json['dhuhr'] as bool,
      json['asr'] as bool,
      json['maghreb'] as bool,
      json['isha'] as bool,
    );
  }

  String toJson() {
    //Map<String, dynamic>
    final j = '''{
      "fajr": $fajr,
      "dhuhr": $dhuhr,
      "asr": $asr,
      "maghreb": $maghreb,
      "isha": $isha
    }''';
    print('save' + j.toString());
    return j.toString();
  }
}
