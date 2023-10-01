// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Post extends DataClass implements Insertable<Post> {
  final int id;
  final int count;
  final int? category;
  final int? collection;
  final String? title;
  final String? content;
  final String? footer;
  final String? link;
  final String? audio;
  final String? audioOffline;
  final String? file;
  final String? fileOffline;
  final String? image;
  final String? imageOffline;
  Post(
      {required this.id,
      required this.count,
      this.category,
      this.collection,
      this.title,
      this.content,
      this.footer,
      this.link,
      this.audio,
      this.audioOffline,
      this.file,
      this.fileOffline,
      this.image,
      this.imageOffline});
  factory Post.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Post(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      count: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}count'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      collection: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}collection']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body']),
      footer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}footer']),
      link: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link']),
      audio: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audio']),
      audioOffline: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audio_offline']),
      file: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}file']),
      fileOffline: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}file_offline']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      imageOffline: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_offline']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['count'] = Variable<int>(count);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int?>(category);
    }
    if (!nullToAbsent || collection != null) {
      map['collection'] = Variable<int?>(collection);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || content != null) {
      map['body'] = Variable<String?>(content);
    }
    if (!nullToAbsent || footer != null) {
      map['footer'] = Variable<String?>(footer);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String?>(link);
    }
    if (!nullToAbsent || audio != null) {
      map['audio'] = Variable<String?>(audio);
    }
    if (!nullToAbsent || audioOffline != null) {
      map['audio_offline'] = Variable<String?>(audioOffline);
    }
    if (!nullToAbsent || file != null) {
      map['file'] = Variable<String?>(file);
    }
    if (!nullToAbsent || fileOffline != null) {
      map['file_offline'] = Variable<String?>(fileOffline);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || imageOffline != null) {
      map['image_offline'] = Variable<String?>(imageOffline);
    }
    return map;
  }

  PostsCompanion toCompanion(bool nullToAbsent) {
    return PostsCompanion(
      id: Value(id),
      count: Value(count),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      collection: collection == null && nullToAbsent
          ? const Value.absent()
          : Value(collection),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      footer:
          footer == null && nullToAbsent ? const Value.absent() : Value(footer),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      audio:
          audio == null && nullToAbsent ? const Value.absent() : Value(audio),
      audioOffline: audioOffline == null && nullToAbsent
          ? const Value.absent()
          : Value(audioOffline),
      file: file == null && nullToAbsent ? const Value.absent() : Value(file),
      fileOffline: fileOffline == null && nullToAbsent
          ? const Value.absent()
          : Value(fileOffline),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      imageOffline: imageOffline == null && nullToAbsent
          ? const Value.absent()
          : Value(imageOffline),
    );
  }

  factory Post.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Post(
      id: serializer.fromJson<int>(json['id']),
      count: serializer.fromJson<int>(json['count']),
      category: serializer.fromJson<int?>(json['category']),
      collection: serializer.fromJson<int?>(json['collection']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      footer: serializer.fromJson<String?>(json['footer']),
      link: serializer.fromJson<String?>(json['link']),
      audio: serializer.fromJson<String?>(json['audio']),
      audioOffline: serializer.fromJson<String?>(json['audioOffline']),
      file: serializer.fromJson<String?>(json['file']),
      fileOffline: serializer.fromJson<String?>(json['fileOffline']),
      image: serializer.fromJson<String?>(json['image']),
      imageOffline: serializer.fromJson<String?>(json['imageOffline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'count': serializer.toJson<int>(count),
      'category': serializer.toJson<int?>(category),
      'collection': serializer.toJson<int?>(collection),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<String?>(content),
      'footer': serializer.toJson<String?>(footer),
      'link': serializer.toJson<String?>(link),
      'audio': serializer.toJson<String?>(audio),
      'audioOffline': serializer.toJson<String?>(audioOffline),
      'file': serializer.toJson<String?>(file),
      'fileOffline': serializer.toJson<String?>(fileOffline),
      'image': serializer.toJson<String?>(image),
      'imageOffline': serializer.toJson<String?>(imageOffline),
    };
  }

  Post copyWith(
          {int? id,
          int? count,
          int? category,
          int? collection,
          String? title,
          String? content,
          String? footer,
          String? link,
          String? audio,
          String? audioOffline,
          String? file,
          String? fileOffline,
          String? image,
          String? imageOffline}) =>
      Post(
        id: id ?? this.id,
        count: count ?? this.count,
        category: category ?? this.category,
        collection: collection ?? this.collection,
        title: title ?? this.title,
        content: content ?? this.content,
        footer: footer ?? this.footer,
        link: link ?? this.link,
        audio: audio ?? this.audio,
        audioOffline: audioOffline ?? this.audioOffline,
        file: file ?? this.file,
        fileOffline: fileOffline ?? this.fileOffline,
        image: image ?? this.image,
        imageOffline: imageOffline ?? this.imageOffline,
      );
  @override
  String toString() {
    return (StringBuffer('Post(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('category: $category, ')
          ..write('collection: $collection, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('footer: $footer, ')
          ..write('link: $link, ')
          ..write('audio: $audio, ')
          ..write('audioOffline: $audioOffline, ')
          ..write('file: $file, ')
          ..write('fileOffline: $fileOffline, ')
          ..write('image: $image, ')
          ..write('imageOffline: $imageOffline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      count,
      category,
      collection,
      title,
      content,
      footer,
      link,
      audio,
      audioOffline,
      file,
      fileOffline,
      image,
      imageOffline);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          other.id == this.id &&
          other.count == this.count &&
          other.category == this.category &&
          other.collection == this.collection &&
          other.title == this.title &&
          other.content == this.content &&
          other.footer == this.footer &&
          other.link == this.link &&
          other.audio == this.audio &&
          other.audioOffline == this.audioOffline &&
          other.file == this.file &&
          other.fileOffline == this.fileOffline &&
          other.image == this.image &&
          other.imageOffline == this.imageOffline);
}

class PostsCompanion extends UpdateCompanion<Post> {
  final Value<int> id;
  final Value<int> count;
  final Value<int?> category;
  final Value<int?> collection;
  final Value<String?> title;
  final Value<String?> content;
  final Value<String?> footer;
  final Value<String?> link;
  final Value<String?> audio;
  final Value<String?> audioOffline;
  final Value<String?> file;
  final Value<String?> fileOffline;
  final Value<String?> image;
  final Value<String?> imageOffline;
  const PostsCompanion({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.category = const Value.absent(),
    this.collection = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.footer = const Value.absent(),
    this.link = const Value.absent(),
    this.audio = const Value.absent(),
    this.audioOffline = const Value.absent(),
    this.file = const Value.absent(),
    this.fileOffline = const Value.absent(),
    this.image = const Value.absent(),
    this.imageOffline = const Value.absent(),
  });
  PostsCompanion.insert({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.category = const Value.absent(),
    this.collection = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.footer = const Value.absent(),
    this.link = const Value.absent(),
    this.audio = const Value.absent(),
    this.audioOffline = const Value.absent(),
    this.file = const Value.absent(),
    this.fileOffline = const Value.absent(),
    this.image = const Value.absent(),
    this.imageOffline = const Value.absent(),
  });
  static Insertable<Post> custom({
    Expression<int>? id,
    Expression<int>? count,
    Expression<int?>? category,
    Expression<int?>? collection,
    Expression<String?>? title,
    Expression<String?>? content,
    Expression<String?>? footer,
    Expression<String?>? link,
    Expression<String?>? audio,
    Expression<String?>? audioOffline,
    Expression<String?>? file,
    Expression<String?>? fileOffline,
    Expression<String?>? image,
    Expression<String?>? imageOffline,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (count != null) 'count': count,
      if (category != null) 'category': category,
      if (collection != null) 'collection': collection,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (footer != null) 'footer': footer,
      if (link != null) 'link': link,
      if (audio != null) 'audio': audio,
      if (audioOffline != null) 'audio_offline': audioOffline,
      if (file != null) 'file': file,
      if (fileOffline != null) 'file_offline': fileOffline,
      if (image != null) 'image': image,
      if (imageOffline != null) 'image_offline': imageOffline,
    });
  }

  PostsCompanion copyWith(
      {Value<int>? id,
      Value<int>? count,
      Value<int?>? category,
      Value<int?>? collection,
      Value<String?>? title,
      Value<String?>? content,
      Value<String?>? footer,
      Value<String?>? link,
      Value<String?>? audio,
      Value<String?>? audioOffline,
      Value<String?>? file,
      Value<String?>? fileOffline,
      Value<String?>? image,
      Value<String?>? imageOffline}) {
    return PostsCompanion(
      id: id ?? this.id,
      count: count ?? this.count,
      category: category ?? this.category,
      collection: collection ?? this.collection,
      title: title ?? this.title,
      content: content ?? this.content,
      footer: footer ?? this.footer,
      link: link ?? this.link,
      audio: audio ?? this.audio,
      audioOffline: audioOffline ?? this.audioOffline,
      file: file ?? this.file,
      fileOffline: fileOffline ?? this.fileOffline,
      image: image ?? this.image,
      imageOffline: imageOffline ?? this.imageOffline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (category.present) {
      map['category'] = Variable<int?>(category.value);
    }
    if (collection.present) {
      map['collection'] = Variable<int?>(collection.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String?>(content.value);
    }
    if (footer.present) {
      map['footer'] = Variable<String?>(footer.value);
    }
    if (link.present) {
      map['link'] = Variable<String?>(link.value);
    }
    if (audio.present) {
      map['audio'] = Variable<String?>(audio.value);
    }
    if (audioOffline.present) {
      map['audio_offline'] = Variable<String?>(audioOffline.value);
    }
    if (file.present) {
      map['file'] = Variable<String?>(file.value);
    }
    if (fileOffline.present) {
      map['file_offline'] = Variable<String?>(fileOffline.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (imageOffline.present) {
      map['image_offline'] = Variable<String?>(imageOffline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostsCompanion(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('category: $category, ')
          ..write('collection: $collection, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('footer: $footer, ')
          ..write('link: $link, ')
          ..write('audio: $audio, ')
          ..write('audioOffline: $audioOffline, ')
          ..write('file: $file, ')
          ..write('fileOffline: $fileOffline, ')
          ..write('image: $image, ')
          ..write('imageOffline: $imageOffline')
          ..write(')'))
        .toString();
  }
}

class $PostsTable extends Posts with TableInfo<$PostsTable, Post> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int?> count = GeneratedColumn<int?>(
      'count', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<int?> category = GeneratedColumn<int?>(
      'category', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _collectionMeta = const VerificationMeta('collection');
  @override
  late final GeneratedColumn<int?> collection = GeneratedColumn<int?>(
      'collection', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'body', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _footerMeta = const VerificationMeta('footer');
  @override
  late final GeneratedColumn<String?> footer = GeneratedColumn<String?>(
      'footer', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String?> link = GeneratedColumn<String?>(
      'link', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _audioMeta = const VerificationMeta('audio');
  @override
  late final GeneratedColumn<String?> audio = GeneratedColumn<String?>(
      'audio', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _audioOfflineMeta =
      const VerificationMeta('audioOffline');
  @override
  late final GeneratedColumn<String?> audioOffline = GeneratedColumn<String?>(
      'audio_offline', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _fileMeta = const VerificationMeta('file');
  @override
  late final GeneratedColumn<String?> file = GeneratedColumn<String?>(
      'file', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _fileOfflineMeta =
      const VerificationMeta('fileOffline');
  @override
  late final GeneratedColumn<String?> fileOffline = GeneratedColumn<String?>(
      'file_offline', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _imageOfflineMeta =
      const VerificationMeta('imageOffline');
  @override
  late final GeneratedColumn<String?> imageOffline = GeneratedColumn<String?>(
      'image_offline', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        count,
        category,
        collection,
        title,
        content,
        footer,
        link,
        audio,
        audioOffline,
        file,
        fileOffline,
        image,
        imageOffline
      ];
  @override
  String get aliasedName => _alias ?? 'posts';
  @override
  String get actualTableName => 'posts';
  @override
  VerificationContext validateIntegrity(Insertable<Post> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('collection')) {
      context.handle(
          _collectionMeta,
          collection.isAcceptableOrUnknown(
              data['collection']!, _collectionMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    }
    if (data.containsKey('footer')) {
      context.handle(_footerMeta,
          footer.isAcceptableOrUnknown(data['footer']!, _footerMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    if (data.containsKey('audio')) {
      context.handle(
          _audioMeta, audio.isAcceptableOrUnknown(data['audio']!, _audioMeta));
    }
    if (data.containsKey('audio_offline')) {
      context.handle(
          _audioOfflineMeta,
          audioOffline.isAcceptableOrUnknown(
              data['audio_offline']!, _audioOfflineMeta));
    }
    if (data.containsKey('file')) {
      context.handle(
          _fileMeta, file.isAcceptableOrUnknown(data['file']!, _fileMeta));
    }
    if (data.containsKey('file_offline')) {
      context.handle(
          _fileOfflineMeta,
          fileOffline.isAcceptableOrUnknown(
              data['file_offline']!, _fileOfflineMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('image_offline')) {
      context.handle(
          _imageOfflineMeta,
          imageOffline.isAcceptableOrUnknown(
              data['image_offline']!, _imageOfflineMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Post map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Post.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PostsTable createAlias(String alias) {
    return $PostsTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final int count;
  final String name;
  final String image;
  Category(
      {required this.id,
      required this.count,
      required this.name,
      required this.image});
  factory Category.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      count: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}count'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['count'] = Variable<int>(count);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      count: Value(count),
      name: Value(name),
      image: Value(image),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      count: serializer.fromJson<int>(json['count']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'count': serializer.toJson<int>(count),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
    };
  }

  Category copyWith({int? id, int? count, String? name, String? image}) =>
      Category(
        id: id ?? this.id,
        count: count ?? this.count,
        name: name ?? this.name,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, count, name, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.count == this.count &&
          other.name == this.name &&
          other.image == this.image);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<int> count;
  final Value<String> name;
  final Value<String> image;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    required String name,
    required String image,
  })  : name = Value(name),
        image = Value(image);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<int>? count,
    Expression<String>? name,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (count != null) 'count': count,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? count,
      Value<String>? name,
      Value<String>? image}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      count: count ?? this.count,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int?> count = GeneratedColumn<int?>(
      'count', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, count, name, image];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Category.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final int id;
  final String name;
  Collection({required this.id, required this.name});
  factory Collection.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Collection(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Collection.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Collection copyWith({int? id, String? name}) => Collection(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection && other.id == this.id && other.name == this.name);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<int> id;
  final Value<String> name;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CollectionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Collection> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CollectionsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'collections';
  @override
  String get actualTableName => 'collections';
  @override
  VerificationContext validateIntegrity(Insertable<Collection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Collection.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }
}

class DownloadInfo extends DataClass implements Insertable<DownloadInfo> {
  final int id;
  final int postId;
  final int taskId;
  final String type;
  DownloadInfo(
      {required this.id,
      required this.postId,
      required this.taskId,
      required this.type});
  factory DownloadInfo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DownloadInfo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      postId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id'])!,
      taskId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_id'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['post_id'] = Variable<int>(postId);
    map['task_id'] = Variable<int>(taskId);
    map['type'] = Variable<String>(type);
    return map;
  }

  DownloadsCompanion toCompanion(bool nullToAbsent) {
    return DownloadsCompanion(
      id: Value(id),
      postId: Value(postId),
      taskId: Value(taskId),
      type: Value(type),
    );
  }

  factory DownloadInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadInfo(
      id: serializer.fromJson<int>(json['id']),
      postId: serializer.fromJson<int>(json['postId']),
      taskId: serializer.fromJson<int>(json['taskId']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'postId': serializer.toJson<int>(postId),
      'taskId': serializer.toJson<int>(taskId),
      'type': serializer.toJson<String>(type),
    };
  }

  DownloadInfo copyWith({int? id, int? postId, int? taskId, String? type}) =>
      DownloadInfo(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        taskId: taskId ?? this.taskId,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('DownloadInfo(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('taskId: $taskId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, postId, taskId, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadInfo &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.taskId == this.taskId &&
          other.type == this.type);
}

class DownloadsCompanion extends UpdateCompanion<DownloadInfo> {
  final Value<int> id;
  final Value<int> postId;
  final Value<int> taskId;
  final Value<String> type;
  const DownloadsCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.taskId = const Value.absent(),
    this.type = const Value.absent(),
  });
  DownloadsCompanion.insert({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.taskId = const Value.absent(),
    required String type,
  }) : type = Value(type);
  static Insertable<DownloadInfo> custom({
    Expression<int>? id,
    Expression<int>? postId,
    Expression<int>? taskId,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (taskId != null) 'task_id': taskId,
      if (type != null) 'type': type,
    });
  }

  DownloadsCompanion copyWith(
      {Value<int>? id,
      Value<int>? postId,
      Value<int>? taskId,
      Value<String>? type}) {
    return DownloadsCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      taskId: taskId ?? this.taskId,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<int>(postId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadsCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('taskId: $taskId, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $DownloadsTable extends Downloads
    with TableInfo<$DownloadsTable, DownloadInfo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<int?> postId = GeneratedColumn<int?>(
      'post_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int?> taskId = GeneratedColumn<int?>(
      'task_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, postId, taskId, type];
  @override
  String get aliasedName => _alias ?? 'downloads';
  @override
  String get actualTableName => 'downloads';
  @override
  VerificationContext validateIntegrity(Insertable<DownloadInfo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DownloadInfo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DownloadInfo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DownloadsTable createAlias(String alias) {
    return $DownloadsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PostsTable posts = $PostsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $DownloadsTable downloads = $DownloadsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [posts, categories, collections, downloads];
}
