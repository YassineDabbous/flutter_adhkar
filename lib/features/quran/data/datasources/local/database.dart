// These imports are only needed to open the database
//import 'package:moor/ffi.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';
part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'quran.sqlite'));
    return NativeDatabase(file);
  });
}

/*
  final String text;
  final int number;
  final int surahId;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;*/
@DataClassName("Ayah")
class Ayat extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  IntColumn get surahId => integer()();
  IntColumn get number => integer()();
  IntColumn get numberInSurah => integer()();
  IntColumn get juz => integer()();
  IntColumn get manzil => integer()();
  IntColumn get page => integer()();
  IntColumn get ruku => integer()();
  IntColumn get hizbQuarter => integer()();
  BoolColumn get sajda => boolean()();
  //TextColumn get audio => text().nullable()();
}

@DataClassName("Surah")
class Sowar extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get numberOfAyahs => integer().withDefault(const Constant(0))();
  TextColumn get name => text()();
  TextColumn get englishName => text()();
  TextColumn get englishNameTranslation => text()();
  TextColumn get revelationType => text()();
}

@DriftDatabase(tables: [
  Sowar,
  Ayat,
])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static MyDatabase? _database;
  static MyDatabase getInstance() {
    _database ??= MyDatabase();
    return _database!;
  }

  Future<List<Ayah>> getAyat(int sid) => (select(ayat)..where((tbl) => tbl.surahId.equals(sid))).get();
  Future<List<Surah>> getSowar() => select(sowar).get();

  Future<void> insertSowar(List<Insertable<Surah>> lista) async {
    print('cache sowar listaaa ${lista.length}');
    await batch((batch) {
      batch.insertAll(sowar, lista, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> insertAyat(List<Insertable<Ayah>> lista) async {
    print('cache ayat listaaa ${lista.length}');
    await batch((batch) {
      batch.insertAll(ayat, lista, mode: InsertMode.insertOrReplace);
    });
  }
}
