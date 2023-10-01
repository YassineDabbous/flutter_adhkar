// These imports are only needed to open the database
import 'package:adhkar/features/adhkar/data/models/category_model.dart';
import 'package:adhkar/features/adhkar/data/models/dhikr_model.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';
part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'adhkar.sqlite'));
    return NativeDatabase(file);
  });
}

@DataClassName("DownloadInfo")
class Downloads extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get postId => integer().withDefault(const Constant(0))();
  IntColumn get taskId => integer().withDefault(const Constant(0))();
  TextColumn get type => text()();
}

class Posts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get count => integer().withDefault(const Constant(1))();
  IntColumn get category => integer().nullable()();
  IntColumn get collection => integer().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get content => text().nullable().named('body')();
  TextColumn get footer => text().nullable()();
  TextColumn get link => text().nullable()();
  TextColumn get audio => text().nullable()();
  TextColumn get audioOffline => text().nullable()();
  TextColumn get file => text().nullable()();
  TextColumn get fileOffline => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get imageOffline => text().nullable()();
}

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get count => integer().withDefault(const Constant(0))();
  TextColumn get name => text()();
  TextColumn get image => text()();
}

class Collections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@DriftDatabase(tables: [Posts, Categories, Collections, Downloads])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static MyDatabase? _database;
  static MyDatabase getInstance() {
    _database ??= MyDatabase();
    return _database!;
  }

  // -------------------------- POSTS --------------------------
  Future<List<Post>> getAllPosts() => select(posts).get();
  Future<List<Post>> getPostsByCategory(int cid) => (select(posts)..where((tbl) => tbl.category.equals(cid))).get();
  Future<List<Post>> getPostsByCollection(int cid) => (select(posts)..where((tbl) => tbl.collection.equals(cid))).get();
  //Stream<List<Post>> watchAllPosts() => select(posts).watch();
  //Future insertNewPost(Post p) => into(posts).insert(p);
  //Future deletePost(Post p) => delete(posts).delete(p);
  Future updatePost(PostsCompanion p) => update(posts).replace(p);
  Future<void> insertPosts(List<DhikrModel> adhkar) async {
    print('insertPosts');
    List<PostsCompanion> lista = adhkar
        .map((it) => PostsCompanion.insert(
            id: Value(it.id),
            count: Value(it.count),
            category: Value(it.categoryId),
            collection: Value(it.collectionId),
            title: Value(it.title),
            content: Value(it.content),
            footer: Value(it.footer),
            audio: Value(it.audio),
            image: Value(it.image),
            file: Value(it.file),
            link: Value(it.link)))
        .toList();
    print('listaaa ${lista.toString()}');
    await batch((batch) {
      batch.insertAll(posts, lista, mode: InsertMode.insertOrReplace);
    });
  }

  Future toggleLike(int id, int cid) async {
    final ps = await (select(posts)..where((tbl) => tbl.id.equals(id))).get();
    if (ps.length > 0)
      update(posts).replace(ps[0].toCompanion(true).copyWith(collection: Value(cid)));
    else
      print('404 local post $id not founddddd');
  }

  // -------------------------- CATEGORIES --------------------------
  Future<List<Category>> getAllCategories() => select(categories).get();
  //Future insertCategory(Category p) => into(categories).insert(p);
  //Future deleteCategory(Category p) => delete(categories).delete(p);
  Future<void> insertCategories(List<CategoryModel> cats) async {
    List<CategoriesCompanion> lista = cats.map((it) => CategoriesCompanion.insert(id: Value(it.id), name: it.name, image: it.image)).toList();
    await batch((batch) {
      batch.insertAll(categories, lista, mode: InsertMode.insertOrReplace);
    });
  }

  // -------------------------- COLLECTIONS --------------------------
  Future<List<Collection>> getAllCollections() => select(collections).get();
  Future insertCollection(Collection p) => into(collections).insert(p);
  Future deleteCollection(Collection p) => delete(collections).delete(p);

  // -------------------------- COLLECTIONS --------------------------
  //Future<List<DownloadInfo>> getDownloads() => select(downloads).get();
  Future<List<DownloadInfo>> getPostDownloads(int fid) => (select(downloads)..where((tbl) => tbl.postId.equals(fid))).get();
  Future<DownloadInfo> getPostDownloadsByType(int taskId, String type) => (select(downloads)
        ..where((tbl) => tbl.taskId.equals(taskId))
        ..where((tbl) => tbl.type.equals(type)))
      .getSingle();
  Future insertDownload(DownloadsCompanion p) => into(downloads).insert(p);
  Future deleteDownload(DownloadInfo p) => delete(downloads).delete(p);
}
