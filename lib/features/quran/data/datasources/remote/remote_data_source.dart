import 'dart:convert';
import 'package:adhkar/features/quran/data/models/juzModel.dart';
import 'package:adhkar/features/quran/data/models/sajdaModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:adhkar/features/quran/data/models/surahModel.dart';

abstract class RemoteQuranDataSource {
  Future<List<SurahModel>> getFullQuran();
  Future<List<SurahModel>> getSowar();
  Future<SurahModel> getSurah(int id);
  Future<List<AyahModel>> getAyat(int id);
}

class RemoteQuranDSImpl extends RemoteQuranDataSource {
  @override
  Future<List<AyahModel>> getAyat(int id) async {
    String url = 'http://api.alquran.cloud/v1/surah/$id';
    debugPrint('url $url');
    final response = await http.get(Uri.tryParse(url)!);
    if (response.statusCode == 200) {
      SurahModel surahsList = SurahModel.fromJSON(json.decode(response.body)['data']);
      return surahsList.ayahs;
    } else {
      debugPrint("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }

  @override
  Future<SurahModel> getSurah(int id) async {
    String url = 'http://api.alquran.cloud/v1/surah/$id';
    final response = await http.get(Uri.tryParse(url)!);
    if (response.statusCode == 200) {
      SurahModel surahsList = SurahModel.fromJSON(json.decode(response.body)['data']);
      return surahsList;
    } else {
      debugPrint("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }

  @override
  Future<List<SurahModel>> getSowar() async {
    String url = 'http://api.alquran.cloud/v1/surah';
    final response = await http.get(Uri.tryParse(url)!);
    if (response.statusCode == 200) {
      Iterable surahlist = json.decode(response.body)['data'];
      List<SurahModel> surahsList = surahlist.map((i) => SurahModel.fromJSON(i)).toList();
      return surahsList;
    } else {
      debugPrint("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }

  @override
  Future<List<SurahModel>> getFullQuran() async {
    String url = "http://api.alquran.cloud/v1/quran/quran-uthmani";
    final response = await http.get(Uri.tryParse(url)!);
    if (response.statusCode == 200) {
      Iterable surahlist = json.decode(response.body)['data']['surahs'];
      List<SurahModel> surahsList = surahlist.map((i) => SurahModel.fromJSON(i)).toList();
      return surahsList;
    } else {
      debugPrint("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }

  Future<SajdaList> getSajda() async {
    String url = "http://api.alquran.cloud/v1/sajda/quran-uthmani";
    final response = await http.get(Uri.tryParse(url)!);

    if (response.statusCode == 200) {
      return SajdaList.fromJSON(json.decode(response.body));
    } else {
      debugPrint("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }

  Future<JuzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.tryParse(url)!);

    if (response.statusCode == 200) {
      return JuzModel.fromJSON(json.decode(response.body));
    } else {
      debugPrint("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }
}
