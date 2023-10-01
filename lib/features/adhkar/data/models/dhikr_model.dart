import 'package:adhkar/features/adhkar/data/datasources/local/database.dart';
import 'package:adhkar/features/adhkar/domain/entities/dhikr.dart';

class DhikrModel extends Dhikr {
  int id;
  int count;
  int categoryId;
  int collectionId;
  String title;
  String content;
  String footer;
  String image;
  String audio;
  String file;
  String link;
  String? imageOffline;
  String? audioOffline;
  String? fileOffline;

  DhikrModel(
    this.id,
    this.count,
    this.categoryId,
    this.collectionId,
    this.title,
    this.content,
    this.footer,
    this.image,
    this.audio,
    this.file,
    this.link,
    this.imageOffline,
    this.audioOffline,
    this.fileOffline,
  ) : super(id, count, categoryId, collectionId, title, content, footer, image, audio, file, link, imageOffline, audioOffline, fileOffline);

  factory DhikrModel.fromJson(dynamic json) {
    return DhikrModel(
      json['id'] as int,
      json['count'] as int,
      json['category_id'] as int,
      0, // no remote collection
      json['title'] as String,
      json['content'] as String,
      json['footer'] as String,
      json['image'] as String,
      json['audio'] as String,
      json['file'] as String,
      json['link'] as String,
      null,
      null,
      null,
    );
  }

  factory DhikrModel.fromDatabase(Post dbPost) {
    return DhikrModel(
      dbPost.id,
      dbPost.count,
      dbPost.category ?? 0,
      dbPost.collection ?? 0,
      dbPost.title ?? '---',
      dbPost.content ?? '---',
      dbPost.footer ?? '---',
      dbPost.image ?? '---',
      dbPost.audio ?? '---',
      dbPost.file ?? '---',
      dbPost.link ?? '---',
      dbPost.imageOffline,
      dbPost.audioOffline,
      dbPost.fileOffline,
    );
  }

  static List<DhikrModel> listFromJson(dynamic json) {
    var jsonList = json as Iterable;
    return jsonList.map((e) => DhikrModel.fromJson(e)).toList();
  }

/*
  static List listToDB(List<DhikrModel> adhkar){
    List<PostsCompanion> lista = adhkar
        .map((it) => PostsCompanion.insert(
            id: Value(it.id),
            count: Value(it.count),
            category: Value(it.categoryId),
            collection: Value(it.collectionId),
            title: it.title,
            content: it.content,
            audio: it.audio,
            image: it.image))
        .toList();
  }*/
}
