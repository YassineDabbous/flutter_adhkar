import 'package:adhkar/features/quran/data/datasources/local/database.dart';
import 'package:adhkar/features/quran/domain/entities/aya.dart';
import 'package:adhkar/features/quran/domain/entities/surah.dart';
import 'package:drift/drift.dart';

class SurahsList {
  final List<SurahModel> surahs;

  SurahsList({required this.surahs});

  factory SurahsList.fromJSON(Map<String, dynamic> json) {
    Iterable surahlist = json['data']['surahs'];
    List<SurahModel> surahsList = surahlist.map((i) => SurahModel.fromJSON(i)).toList();

    return SurahsList(surahs: surahsList);
  }
}

class SurahModel extends SurahClass {
  @override
  final int id;
  @override
  final String name;
  final int numberOfAyahs;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<AyahModel> ayahs;

  SurahModel({
    required this.id,
    required this.numberOfAyahs,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    this.ayahs = const [],
  });

  factory SurahModel.fromJSON(Map<String, dynamic> json) {
    Iterable ayahs = json['ayahs'] ?? [];
    int id = json['number'];
    List<AyahModel> ayahsList = ayahs.map((e) {
      e['surahId'] = id;
      return AyahModel.fromJSON((e));
    }).toList();

    //print('first aya ======> ${ayahsList[0].text}');

    return SurahModel(
        id: id,
        numberOfAyahs: json['numberOfAyahs'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        revelationType: json['revelationType'],
        ayahs: ayahsList);
  }

  factory SurahModel.fromDatabase(Surah db) {
    return SurahModel(
      id: db.id,
      numberOfAyahs: db.numberOfAyahs,
      name: db.name,
      englishName: db.englishName,
      englishNameTranslation: db.englishNameTranslation,
      revelationType: db.revelationType,
    );
  }

  Insertable<Surah> toDatabase() {
    throw UnimplementedError('need migration from moor to drift :( :(');
    // return SowarCompanion.insert(
    //   id: Value(number),
    //   numberOfAyahs: Value(numberOfAyahs),
    //   name: name,
    //   englishName: englishName,
    //   englishNameTranslation: englishNameTranslation,
    //   revelationType: revelationType,
    // );
  }

  @override
  set id(int _id) {
    // TODO: implement id
  }

  @override
  set name(String _name) {
    // TODO: implement name
  }
}

class AyahModel extends AyaClass {
  String text;
  final int number;
  final int surahId;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;

  AyahModel({
    required this.number,
    required this.text,
    required this.surahId,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  }) : super(
          number: number,
          text: text,
          surahId: surahId,
          numberInSurah: numberInSurah,
          juz: juz,
          manzil: manzil,
          page: page,
          ruku: ruku,
          hizbQuarter: hizbQuarter,
          sajda: sajda,
        );

  factory AyahModel.fromJSON(Map<String, dynamic> json) {
    print('parse THAT : ${json.toString()}');
    return AyahModel(
        number: json['number'],
        text: json['text'],
        surahId: json['surahId'],
        numberInSurah: json['numberInSurah'],
        juz: json['juz'],
        manzil: json['manzil'],
        page: json['page'],
        ruku: json['ruku'],
        hizbQuarter: json['hizbQuarter'],
        sajda: json['sajda']);
  }
  factory AyahModel.fromDatabase(Ayah ayah) {
    return AyahModel(
        number: ayah.number,
        text: ayah.content,
        surahId: ayah.surahId,
        numberInSurah: ayah.numberInSurah,
        juz: ayah.juz,
        manzil: ayah.manzil,
        page: ayah.page,
        ruku: ayah.ruku,
        hizbQuarter: ayah.hizbQuarter,
        sajda: ayah.sajda);
  }

  Insertable<Ayah> toDatabase() {
    throw UnimplementedError('need migration from moor to drift :( :(');
    // return AyatCompanion.insert(
    //     number: number,
    //     surahId: surahId,
    //     content: text,
    //     numberInSurah: numberInSurah,
    //     juz: juz,
    //     manzil: manzil,
    //     page: page,
    //     ruku: ruku,
    //     hizbQuarter: hizbQuarter,
    //     sajda: sajda);
  }
}
