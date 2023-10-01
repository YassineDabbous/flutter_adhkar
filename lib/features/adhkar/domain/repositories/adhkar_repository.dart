import 'package:dartz/dartz.dart';
import 'package:adhkar/core/error/failures.dart';
import 'package:adhkar/features/adhkar/domain/entities/category.dart';
import 'package:adhkar/features/adhkar/domain/entities/dhikr.dart';

abstract class AdhkarRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Dhikr>>> getAdhkar(int id);
  Future<Either<Failure, List<Dhikr>>> getAdhkarByCollection(int id);
}
