import 'package:adhkar/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:adhkar/core/usecases/usecase.dart';
import 'package:adhkar/features/adhkar/domain/entities/category.dart';
import 'package:adhkar/features/adhkar/domain/repositories/adhkar_repository.dart';

class GetCategories extends UseCase<List<Category>, NoParams> {
  final AdhkarRepository repository;
  GetCategories(this.repository);
  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
