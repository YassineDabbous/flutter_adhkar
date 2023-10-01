// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Surah extends DataClass implements Insertable<Surah> {
  final int id;
  final int numberOfAyahs;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  Surah(
      {required this.id,
      required this.numberOfAyahs,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.revelationType});
  factory Surah.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Surah(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      numberOfAyahs: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number_of_ayahs'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      englishName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}english_name'])!,
      englishNameTranslation: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}english_name_translation'])!,
      revelationType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}revelation_type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number_of_ayahs'] = Variable<int>(numberOfAyahs);
    map['name'] = Variable<String>(name);
    map['english_name'] = Variable<String>(englishName);
    map['english_name_translation'] = Variable<String>(englishNameTranslation);
    map['revelation_type'] = Variable<String>(revelationType);
    return map;
  }

  SowarCompanion toCompanion(bool nullToAbsent) {
    return SowarCompanion(
      id: Value(id),
      numberOfAyahs: Value(numberOfAyahs),
      name: Value(name),
      englishName: Value(englishName),
      englishNameTranslation: Value(englishNameTranslation),
      revelationType: Value(revelationType),
    );
  }

  factory Surah.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Surah(
      id: serializer.fromJson<int>(json['id']),
      numberOfAyahs: serializer.fromJson<int>(json['numberOfAyahs']),
      name: serializer.fromJson<String>(json['name']),
      englishName: serializer.fromJson<String>(json['englishName']),
      englishNameTranslation:
          serializer.fromJson<String>(json['englishNameTranslation']),
      revelationType: serializer.fromJson<String>(json['revelationType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numberOfAyahs': serializer.toJson<int>(numberOfAyahs),
      'name': serializer.toJson<String>(name),
      'englishName': serializer.toJson<String>(englishName),
      'englishNameTranslation':
          serializer.toJson<String>(englishNameTranslation),
      'revelationType': serializer.toJson<String>(revelationType),
    };
  }

  Surah copyWith(
          {int? id,
          int? numberOfAyahs,
          String? name,
          String? englishName,
          String? englishNameTranslation,
          String? revelationType}) =>
      Surah(
        id: id ?? this.id,
        numberOfAyahs: numberOfAyahs ?? this.numberOfAyahs,
        name: name ?? this.name,
        englishName: englishName ?? this.englishName,
        englishNameTranslation:
            englishNameTranslation ?? this.englishNameTranslation,
        revelationType: revelationType ?? this.revelationType,
      );
  @override
  String toString() {
    return (StringBuffer('Surah(')
          ..write('id: $id, ')
          ..write('numberOfAyahs: $numberOfAyahs, ')
          ..write('name: $name, ')
          ..write('englishName: $englishName, ')
          ..write('englishNameTranslation: $englishNameTranslation, ')
          ..write('revelationType: $revelationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, numberOfAyahs, name, englishName,
      englishNameTranslation, revelationType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Surah &&
          other.id == this.id &&
          other.numberOfAyahs == this.numberOfAyahs &&
          other.name == this.name &&
          other.englishName == this.englishName &&
          other.englishNameTranslation == this.englishNameTranslation &&
          other.revelationType == this.revelationType);
}

class SowarCompanion extends UpdateCompanion<Surah> {
  final Value<int> id;
  final Value<int> numberOfAyahs;
  final Value<String> name;
  final Value<String> englishName;
  final Value<String> englishNameTranslation;
  final Value<String> revelationType;
  const SowarCompanion({
    this.id = const Value.absent(),
    this.numberOfAyahs = const Value.absent(),
    this.name = const Value.absent(),
    this.englishName = const Value.absent(),
    this.englishNameTranslation = const Value.absent(),
    this.revelationType = const Value.absent(),
  });
  SowarCompanion.insert({
    this.id = const Value.absent(),
    this.numberOfAyahs = const Value.absent(),
    required String name,
    required String englishName,
    required String englishNameTranslation,
    required String revelationType,
  })  : name = Value(name),
        englishName = Value(englishName),
        englishNameTranslation = Value(englishNameTranslation),
        revelationType = Value(revelationType);
  static Insertable<Surah> custom({
    Expression<int>? id,
    Expression<int>? numberOfAyahs,
    Expression<String>? name,
    Expression<String>? englishName,
    Expression<String>? englishNameTranslation,
    Expression<String>? revelationType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numberOfAyahs != null) 'number_of_ayahs': numberOfAyahs,
      if (name != null) 'name': name,
      if (englishName != null) 'english_name': englishName,
      if (englishNameTranslation != null)
        'english_name_translation': englishNameTranslation,
      if (revelationType != null) 'revelation_type': revelationType,
    });
  }

  SowarCompanion copyWith(
      {Value<int>? id,
      Value<int>? numberOfAyahs,
      Value<String>? name,
      Value<String>? englishName,
      Value<String>? englishNameTranslation,
      Value<String>? revelationType}) {
    return SowarCompanion(
      id: id ?? this.id,
      numberOfAyahs: numberOfAyahs ?? this.numberOfAyahs,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      englishNameTranslation:
          englishNameTranslation ?? this.englishNameTranslation,
      revelationType: revelationType ?? this.revelationType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numberOfAyahs.present) {
      map['number_of_ayahs'] = Variable<int>(numberOfAyahs.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (englishName.present) {
      map['english_name'] = Variable<String>(englishName.value);
    }
    if (englishNameTranslation.present) {
      map['english_name_translation'] =
          Variable<String>(englishNameTranslation.value);
    }
    if (revelationType.present) {
      map['revelation_type'] = Variable<String>(revelationType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SowarCompanion(')
          ..write('id: $id, ')
          ..write('numberOfAyahs: $numberOfAyahs, ')
          ..write('name: $name, ')
          ..write('englishName: $englishName, ')
          ..write('englishNameTranslation: $englishNameTranslation, ')
          ..write('revelationType: $revelationType')
          ..write(')'))
        .toString();
  }
}

class $SowarTable extends Sowar with TableInfo<$SowarTable, Surah> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SowarTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _numberOfAyahsMeta =
      const VerificationMeta('numberOfAyahs');
  @override
  late final GeneratedColumn<int?> numberOfAyahs = GeneratedColumn<int?>(
      'number_of_ayahs', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _englishNameMeta =
      const VerificationMeta('englishName');
  @override
  late final GeneratedColumn<String?> englishName = GeneratedColumn<String?>(
      'english_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _englishNameTranslationMeta =
      const VerificationMeta('englishNameTranslation');
  @override
  late final GeneratedColumn<String?> englishNameTranslation =
      GeneratedColumn<String?>('english_name_translation', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _revelationTypeMeta =
      const VerificationMeta('revelationType');
  @override
  late final GeneratedColumn<String?> revelationType = GeneratedColumn<String?>(
      'revelation_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        numberOfAyahs,
        name,
        englishName,
        englishNameTranslation,
        revelationType
      ];
  @override
  String get aliasedName => _alias ?? 'sowar';
  @override
  String get actualTableName => 'sowar';
  @override
  VerificationContext validateIntegrity(Insertable<Surah> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number_of_ayahs')) {
      context.handle(
          _numberOfAyahsMeta,
          numberOfAyahs.isAcceptableOrUnknown(
              data['number_of_ayahs']!, _numberOfAyahsMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('english_name')) {
      context.handle(
          _englishNameMeta,
          englishName.isAcceptableOrUnknown(
              data['english_name']!, _englishNameMeta));
    } else if (isInserting) {
      context.missing(_englishNameMeta);
    }
    if (data.containsKey('english_name_translation')) {
      context.handle(
          _englishNameTranslationMeta,
          englishNameTranslation.isAcceptableOrUnknown(
              data['english_name_translation']!, _englishNameTranslationMeta));
    } else if (isInserting) {
      context.missing(_englishNameTranslationMeta);
    }
    if (data.containsKey('revelation_type')) {
      context.handle(
          _revelationTypeMeta,
          revelationType.isAcceptableOrUnknown(
              data['revelation_type']!, _revelationTypeMeta));
    } else if (isInserting) {
      context.missing(_revelationTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Surah map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Surah.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SowarTable createAlias(String alias) {
    return $SowarTable(attachedDatabase, alias);
  }
}

class Ayah extends DataClass implements Insertable<Ayah> {
  final int id;
  final String content;
  final int surahId;
  final int number;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;
  Ayah(
      {required this.id,
      required this.content,
      required this.surahId,
      required this.number,
      required this.numberInSurah,
      required this.juz,
      required this.manzil,
      required this.page,
      required this.ruku,
      required this.hizbQuarter,
      required this.sajda});
  factory Ayah.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Ayah(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      surahId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}surah_id'])!,
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      numberInSurah: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number_in_surah'])!,
      juz: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}juz'])!,
      manzil: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}manzil'])!,
      page: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page'])!,
      ruku: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ruku'])!,
      hizbQuarter: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hizb_quarter'])!,
      sajda: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sajda'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['surah_id'] = Variable<int>(surahId);
    map['number'] = Variable<int>(number);
    map['number_in_surah'] = Variable<int>(numberInSurah);
    map['juz'] = Variable<int>(juz);
    map['manzil'] = Variable<int>(manzil);
    map['page'] = Variable<int>(page);
    map['ruku'] = Variable<int>(ruku);
    map['hizb_quarter'] = Variable<int>(hizbQuarter);
    map['sajda'] = Variable<bool>(sajda);
    return map;
  }

  AyatCompanion toCompanion(bool nullToAbsent) {
    return AyatCompanion(
      id: Value(id),
      content: Value(content),
      surahId: Value(surahId),
      number: Value(number),
      numberInSurah: Value(numberInSurah),
      juz: Value(juz),
      manzil: Value(manzil),
      page: Value(page),
      ruku: Value(ruku),
      hizbQuarter: Value(hizbQuarter),
      sajda: Value(sajda),
    );
  }

  factory Ayah.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ayah(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      surahId: serializer.fromJson<int>(json['surahId']),
      number: serializer.fromJson<int>(json['number']),
      numberInSurah: serializer.fromJson<int>(json['numberInSurah']),
      juz: serializer.fromJson<int>(json['juz']),
      manzil: serializer.fromJson<int>(json['manzil']),
      page: serializer.fromJson<int>(json['page']),
      ruku: serializer.fromJson<int>(json['ruku']),
      hizbQuarter: serializer.fromJson<int>(json['hizbQuarter']),
      sajda: serializer.fromJson<bool>(json['sajda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'surahId': serializer.toJson<int>(surahId),
      'number': serializer.toJson<int>(number),
      'numberInSurah': serializer.toJson<int>(numberInSurah),
      'juz': serializer.toJson<int>(juz),
      'manzil': serializer.toJson<int>(manzil),
      'page': serializer.toJson<int>(page),
      'ruku': serializer.toJson<int>(ruku),
      'hizbQuarter': serializer.toJson<int>(hizbQuarter),
      'sajda': serializer.toJson<bool>(sajda),
    };
  }

  Ayah copyWith(
          {int? id,
          String? content,
          int? surahId,
          int? number,
          int? numberInSurah,
          int? juz,
          int? manzil,
          int? page,
          int? ruku,
          int? hizbQuarter,
          bool? sajda}) =>
      Ayah(
        id: id ?? this.id,
        content: content ?? this.content,
        surahId: surahId ?? this.surahId,
        number: number ?? this.number,
        numberInSurah: numberInSurah ?? this.numberInSurah,
        juz: juz ?? this.juz,
        manzil: manzil ?? this.manzil,
        page: page ?? this.page,
        ruku: ruku ?? this.ruku,
        hizbQuarter: hizbQuarter ?? this.hizbQuarter,
        sajda: sajda ?? this.sajda,
      );
  @override
  String toString() {
    return (StringBuffer('Ayah(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('surahId: $surahId, ')
          ..write('number: $number, ')
          ..write('numberInSurah: $numberInSurah, ')
          ..write('juz: $juz, ')
          ..write('manzil: $manzil, ')
          ..write('page: $page, ')
          ..write('ruku: $ruku, ')
          ..write('hizbQuarter: $hizbQuarter, ')
          ..write('sajda: $sajda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, surahId, number, numberInSurah,
      juz, manzil, page, ruku, hizbQuarter, sajda);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ayah &&
          other.id == this.id &&
          other.content == this.content &&
          other.surahId == this.surahId &&
          other.number == this.number &&
          other.numberInSurah == this.numberInSurah &&
          other.juz == this.juz &&
          other.manzil == this.manzil &&
          other.page == this.page &&
          other.ruku == this.ruku &&
          other.hizbQuarter == this.hizbQuarter &&
          other.sajda == this.sajda);
}

class AyatCompanion extends UpdateCompanion<Ayah> {
  final Value<int> id;
  final Value<String> content;
  final Value<int> surahId;
  final Value<int> number;
  final Value<int> numberInSurah;
  final Value<int> juz;
  final Value<int> manzil;
  final Value<int> page;
  final Value<int> ruku;
  final Value<int> hizbQuarter;
  final Value<bool> sajda;
  const AyatCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.surahId = const Value.absent(),
    this.number = const Value.absent(),
    this.numberInSurah = const Value.absent(),
    this.juz = const Value.absent(),
    this.manzil = const Value.absent(),
    this.page = const Value.absent(),
    this.ruku = const Value.absent(),
    this.hizbQuarter = const Value.absent(),
    this.sajda = const Value.absent(),
  });
  AyatCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required int surahId,
    required int number,
    required int numberInSurah,
    required int juz,
    required int manzil,
    required int page,
    required int ruku,
    required int hizbQuarter,
    required bool sajda,
  })  : content = Value(content),
        surahId = Value(surahId),
        number = Value(number),
        numberInSurah = Value(numberInSurah),
        juz = Value(juz),
        manzil = Value(manzil),
        page = Value(page),
        ruku = Value(ruku),
        hizbQuarter = Value(hizbQuarter),
        sajda = Value(sajda);
  static Insertable<Ayah> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<int>? surahId,
    Expression<int>? number,
    Expression<int>? numberInSurah,
    Expression<int>? juz,
    Expression<int>? manzil,
    Expression<int>? page,
    Expression<int>? ruku,
    Expression<int>? hizbQuarter,
    Expression<bool>? sajda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (surahId != null) 'surah_id': surahId,
      if (number != null) 'number': number,
      if (numberInSurah != null) 'number_in_surah': numberInSurah,
      if (juz != null) 'juz': juz,
      if (manzil != null) 'manzil': manzil,
      if (page != null) 'page': page,
      if (ruku != null) 'ruku': ruku,
      if (hizbQuarter != null) 'hizb_quarter': hizbQuarter,
      if (sajda != null) 'sajda': sajda,
    });
  }

  AyatCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<int>? surahId,
      Value<int>? number,
      Value<int>? numberInSurah,
      Value<int>? juz,
      Value<int>? manzil,
      Value<int>? page,
      Value<int>? ruku,
      Value<int>? hizbQuarter,
      Value<bool>? sajda}) {
    return AyatCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      surahId: surahId ?? this.surahId,
      number: number ?? this.number,
      numberInSurah: numberInSurah ?? this.numberInSurah,
      juz: juz ?? this.juz,
      manzil: manzil ?? this.manzil,
      page: page ?? this.page,
      ruku: ruku ?? this.ruku,
      hizbQuarter: hizbQuarter ?? this.hizbQuarter,
      sajda: sajda ?? this.sajda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (surahId.present) {
      map['surah_id'] = Variable<int>(surahId.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (numberInSurah.present) {
      map['number_in_surah'] = Variable<int>(numberInSurah.value);
    }
    if (juz.present) {
      map['juz'] = Variable<int>(juz.value);
    }
    if (manzil.present) {
      map['manzil'] = Variable<int>(manzil.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (ruku.present) {
      map['ruku'] = Variable<int>(ruku.value);
    }
    if (hizbQuarter.present) {
      map['hizb_quarter'] = Variable<int>(hizbQuarter.value);
    }
    if (sajda.present) {
      map['sajda'] = Variable<bool>(sajda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyatCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('surahId: $surahId, ')
          ..write('number: $number, ')
          ..write('numberInSurah: $numberInSurah, ')
          ..write('juz: $juz, ')
          ..write('manzil: $manzil, ')
          ..write('page: $page, ')
          ..write('ruku: $ruku, ')
          ..write('hizbQuarter: $hizbQuarter, ')
          ..write('sajda: $sajda')
          ..write(')'))
        .toString();
  }
}

class $AyatTable extends Ayat with TableInfo<$AyatTable, Ayah> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AyatTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _surahIdMeta = const VerificationMeta('surahId');
  @override
  late final GeneratedColumn<int?> surahId = GeneratedColumn<int?>(
      'surah_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _numberInSurahMeta =
      const VerificationMeta('numberInSurah');
  @override
  late final GeneratedColumn<int?> numberInSurah = GeneratedColumn<int?>(
      'number_in_surah', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _juzMeta = const VerificationMeta('juz');
  @override
  late final GeneratedColumn<int?> juz = GeneratedColumn<int?>(
      'juz', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _manzilMeta = const VerificationMeta('manzil');
  @override
  late final GeneratedColumn<int?> manzil = GeneratedColumn<int?>(
      'manzil', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int?> page = GeneratedColumn<int?>(
      'page', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _rukuMeta = const VerificationMeta('ruku');
  @override
  late final GeneratedColumn<int?> ruku = GeneratedColumn<int?>(
      'ruku', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _hizbQuarterMeta =
      const VerificationMeta('hizbQuarter');
  @override
  late final GeneratedColumn<int?> hizbQuarter = GeneratedColumn<int?>(
      'hizb_quarter', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sajdaMeta = const VerificationMeta('sajda');
  @override
  late final GeneratedColumn<bool?> sajda = GeneratedColumn<bool?>(
      'sajda', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (sajda IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        content,
        surahId,
        number,
        numberInSurah,
        juz,
        manzil,
        page,
        ruku,
        hizbQuarter,
        sajda
      ];
  @override
  String get aliasedName => _alias ?? 'ayat';
  @override
  String get actualTableName => 'ayat';
  @override
  VerificationContext validateIntegrity(Insertable<Ayah> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('surah_id')) {
      context.handle(_surahIdMeta,
          surahId.isAcceptableOrUnknown(data['surah_id']!, _surahIdMeta));
    } else if (isInserting) {
      context.missing(_surahIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('number_in_surah')) {
      context.handle(
          _numberInSurahMeta,
          numberInSurah.isAcceptableOrUnknown(
              data['number_in_surah']!, _numberInSurahMeta));
    } else if (isInserting) {
      context.missing(_numberInSurahMeta);
    }
    if (data.containsKey('juz')) {
      context.handle(
          _juzMeta, juz.isAcceptableOrUnknown(data['juz']!, _juzMeta));
    } else if (isInserting) {
      context.missing(_juzMeta);
    }
    if (data.containsKey('manzil')) {
      context.handle(_manzilMeta,
          manzil.isAcceptableOrUnknown(data['manzil']!, _manzilMeta));
    } else if (isInserting) {
      context.missing(_manzilMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('ruku')) {
      context.handle(
          _rukuMeta, ruku.isAcceptableOrUnknown(data['ruku']!, _rukuMeta));
    } else if (isInserting) {
      context.missing(_rukuMeta);
    }
    if (data.containsKey('hizb_quarter')) {
      context.handle(
          _hizbQuarterMeta,
          hizbQuarter.isAcceptableOrUnknown(
              data['hizb_quarter']!, _hizbQuarterMeta));
    } else if (isInserting) {
      context.missing(_hizbQuarterMeta);
    }
    if (data.containsKey('sajda')) {
      context.handle(
          _sajdaMeta, sajda.isAcceptableOrUnknown(data['sajda']!, _sajdaMeta));
    } else if (isInserting) {
      context.missing(_sajdaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ayah map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Ayah.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AyatTable createAlias(String alias) {
    return $AyatTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $SowarTable sowar = $SowarTable(this);
  late final $AyatTable ayat = $AyatTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sowar, ayat];
}
