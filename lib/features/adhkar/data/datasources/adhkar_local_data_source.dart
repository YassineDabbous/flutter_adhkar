import 'package:adhkar/features/adhkar/data/datasources/local/database.dart';
import 'package:adhkar/features/adhkar/data/models/category_model.dart';
import 'package:adhkar/features/adhkar/data/models/dhikr_model.dart';
import 'package:drift/drift.dart';

abstract class LocalAdhkarDataSource {
  Future<List<CategoryModel>> getCachedCategories();
  Future<List<DhikrModel>> getCachedAdhkar(int id);
  Future<List<DhikrModel>> getCachedAdhkarByCollection(int id);
  Future cacheAdhkar(List<DhikrModel> list);
  Future cacheCategories(List<CategoryModel> list);
}

class LocalAdhkarDataSourceImpl extends LocalAdhkarDataSource {
  static final db = MyDatabase.getInstance();

//-------------------- Downloads -------------------
  static Future<DownloadInfo> getPostDownloadInfo(int id, String type) async {
    final downloadInfo = await db.getPostDownloadsByType(id, type);
    print(downloadInfo.toString());
    return Future.value(downloadInfo);
  }

  static Future<void> insertPostDownloadInfo(int postId, int taskId, String type) async {
    await db.insertDownload(DownloadsCompanion(type: Value(type), taskId: Value(taskId), postId: Value(postId)));
  }

  static Future<void> updatePostDownloadInfo(int id, String type, String downloadPath) async {
    final downloadInfo = await db.getPostDownloadsByType(id, type);
    var updater = type == 'image'
        ? PostsCompanion(id: Value(downloadInfo.postId), imageOffline: Value(downloadPath))
        : type == 'audio'
            ? PostsCompanion(id: Value(downloadInfo.postId), audioOffline: Value(downloadPath))
            : PostsCompanion(id: Value(downloadInfo.postId), fileOffline: Value(downloadPath));
    await db.updatePost(updater);
    await db.deleteDownload(downloadInfo);
  }
//-------------------- End Downloads -------------------

  @override
  Future<List<DhikrModel>> getCachedAdhkar(int id) async {
    final dbList = await db.getPostsByCategory(id);
    print(dbList.toString());
    final lista = dbList.map((it) => DhikrModel.fromDatabase(it)).toList();
    print(lista.toString());
    return Future.value(lista);
  }

  @override
  Future<List<CategoryModel>> getCachedCategories() async {
    final dbList = await db.getAllCategories();
    final lista = dbList.map((it) => CategoryModel(it.id, it.name, it.image, it.count)).toList();
    print(lista.toString());
    return Future.value(lista);
  }

  Future cacheAdhkar(List<DhikrModel> list) async {
    print('cacheAdhkar');
    db.insertPosts(list);
  }

  Future cacheCategories(List<CategoryModel> list) async {
    db.insertCategories(list);
  }

  @override
  Future<List<DhikrModel>> getCachedAdhkarByCollection(int id) async {
    final dbList = await db.getPostsByCollection(id);
    print(dbList.toString());
    final lista = dbList.map((it) => DhikrModel.fromDatabase(it)).toList();
    print(lista.toString());
    return Future.value(lista);
  }
}
