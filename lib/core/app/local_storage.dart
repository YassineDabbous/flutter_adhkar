import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<String> getLang() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString('lang') ?? 'en';
  }

  static Future setLang(String local) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString('lang', local);
  }
}
