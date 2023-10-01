import 'package:adhkar/features/quran/data/models/surahModel.dart';
import 'package:dartz/dartz.dart';
import 'package:adhkar/core/error/failures.dart';
import 'package:adhkar/core/network/network_info.dart';
import 'package:adhkar/features/quran/data/datasources/local/local_data_source.dart';
import 'package:adhkar/features/quran/data/datasources/remote/remote_data_source.dart';
import 'package:adhkar/features/quran/domain/entities/aya.dart';
import 'dart:async';

import 'package:adhkar/features/quran/domain/entities/surah.dart';

class QuranRepositoryImpl {
  final RemoteQuranDataSource remote;
  final LocalQuranDataSource local;
  final NetworkInfo networkInfo;
  QuranRepositoryImpl(this.remote, this.local, this.networkInfo);

  factory QuranRepositoryImpl.newInstance() {
    return QuranRepositoryImpl(RemoteQuranDSImpl(), LocalQuranDataSourceImpl(), NetworkInfoImpl());
  }
/*
  static Future<SurahsList> getSurahList(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString(kAssetsQuran);
    return SurahsList.fromJSON(json.decode(data));
  }
*/
  /*Future<Either<Failure, List<SurahClass>>> getSuwar() async {
    if (await networkInfo.isConnected) {
      //remote
      try {
        final data = await remote.getSowar();
        local.cacheSowar(data);
        return Right(data);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      //TODO local
      try {
        final data = await local.getCachedSowar();
        return Right(data);
      } on CacheFailure {
        return Left(CacheFailure());
      }
    }
  }*/

  Future<Either<Failure, List<SurahModel>>> getSuwar() async {
    // local first
    try {
      final data = await local.getCachedSowar();
      if (data.length > 0)
        return Right(data);
      else {
        if (await networkInfo.isConnected) {
          //remote then
          try {
            final data = await remote.getSowar();
            local.cacheSowar(data);
            return Right(data);
          } on ServerFailure {
            return Left(ServerFailure());
          }
        } else
          return Left(NetworkFailure());
      }
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, List<AyahModel>>> getAyat(int surahID) async {
    // local first
    try {
      final data = await local.getCachedAyat(surahID);
      if (data.isNotEmpty) {
        return Right(data);
      } else {
        if (await networkInfo.isConnected) {
          //remote then
          try {
            final data = await remote.getAyat(surahID);
            local.cacheAyat(data);
            return Right(data);
          } on ServerFailure {
            return Left(ServerFailure());
          }
        } else {
          return Left(NetworkFailure());
        }
      }
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }
}
