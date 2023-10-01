import 'package:dartz/dartz.dart';
import 'package:adhkar/core/error/exceptions.dart';
import 'package:adhkar/core/error/failures.dart';
import 'package:adhkar/core/network/network_info.dart';
import 'package:adhkar/features/adhkar/data/datasources/adhkar_local_data_source.dart';
import 'package:adhkar/features/adhkar/data/datasources/adhkar_remote_data_source.dart';
import 'package:adhkar/features/adhkar/domain/entities/dhikr.dart';
import 'package:adhkar/features/adhkar/domain/entities/category.dart';
import 'package:adhkar/features/adhkar/domain/repositories/adhkar_repository.dart';

class AdhkarRepositoryImpl extends AdhkarRepository {
  final RemoteAdhkarDataSource remote;
  final LocalAdhkarDataSource local;
  final NetworkInfo networkInfo;
  AdhkarRepositoryImpl(this.remote, this.local, this.networkInfo);

  @override
  Future<Either<Failure, List<Dhikr>>> getAdhkar(int id) async {
    if (await networkInfo.isConnected) {
      try {
        var r = await remote.getAdhkar(id);
        local.cacheAdhkar(r);
        return Right(r);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final l = await local.getCachedAdhkar(id);
        return Right(l);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final r = await remote.getCategories();
        local.cacheCategories(r);
        return Right(r);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final r = await local.getCachedCategories();
        return Right(r);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Dhikr>>> getAdhkarByCollection(int id) async {
    try {
      final l = await local.getCachedAdhkarByCollection(id);
      return Right(l);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
