import 'package:adhkar/features/quran/data/datasources/local/database.dart';
import 'package:adhkar/features/quran/data/models/surahModel.dart';

abstract class LocalQuranDataSource {
  Future<List<SurahModel>> getCachedSowar();
  Future<List<AyahModel>> getCachedAyat(int id);
  Future cacheAyat(List<AyahModel> list);
  Future cacheSowar(List<SurahModel> list);
}

class LocalQuranDataSourceImpl extends LocalQuranDataSource {
  final db = MyDatabase.getInstance();

  @override
  Future cacheAyat(List<AyahModel> list) async {
    print('cacheAyat ☺ ' + list.toString());
    final lista = list.map((e) => e.toDatabase()).toList();
    db.insertAyat(lista);
  }

  @override
  Future cacheSowar(List<SurahModel> list) async {
    print('cacheSowar');
    final lista = list.map((e) => e.toDatabase()).toList();
    db.insertSowar(lista);
  }

  @override
  Future<List<AyahModel>> getCachedAyat(int id) async {
    final dbList = await db.getAyat(id);
    print(dbList.toString());
    final lista = dbList.map((it) => AyahModel.fromDatabase(it)).toList();
    print(lista.toString());
    return Future.value(lista);
  }

  @override
  Future<List<SurahModel>> getCachedSowar() async {
    final dbList = await db.getSowar();
    print(dbList.toString());
    final lista = dbList.map((it) => SurahModel.fromDatabase(it)).toList();
    print(lista.toString());
    return Future.value(lista);
  }
}
