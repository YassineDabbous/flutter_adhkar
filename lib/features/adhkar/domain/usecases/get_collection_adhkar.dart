import 'package:adhkar/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:adhkar/core/usecases/usecase.dart';
import 'package:adhkar/features/adhkar/domain/entities/dhikr.dart';
import 'package:adhkar/features/adhkar/domain/repositories/adhkar_repository.dart';

class GetAdhkarbyCollection extends UseCase<List<Dhikr>, Params> {
  final AdhkarRepository repository;
  GetAdhkarbyCollection(this.repository);
  @override
  Future<Either<Failure, List<Dhikr>>> call(params) async {
    return await repository.getAdhkarByCollection(params.number);
  }
}
