import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:adhkar/core/app/constants.dart';
import 'package:adhkar/features/asmaa/allasmaul.dart';

class LocalAsmaaRepository {
  static Future<List<AllAsmaul>> loadAsmaa() async {
    var response = await rootBundle.loadString(kAssetsAsmaa);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllAsmaul.fromJson(model)).toList();
  }
}
