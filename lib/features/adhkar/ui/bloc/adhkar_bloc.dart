import 'package:adhkar/core/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:adhkar/core/error/failures.dart';
import 'package:adhkar/features/adhkar/domain/entities/category.dart';
import 'package:adhkar/features/adhkar/domain/entities/dhikr.dart';
import 'package:adhkar/features/adhkar/domain/usecases/get_adhkar.dart';
import 'package:adhkar/features/adhkar/domain/usecases/get_categories.dart';
import 'package:adhkar/features/adhkar/domain/usecases/get_collection_adhkar.dart';
import 'package:flutter/cupertino.dart';

part 'adhkar_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class AdhkarBloc extends Cubit<AdhkarState> {
  GetAdhkar getAdhkar;
  GetAdhkarbyCollection _getAdhkarbyCollection;
  GetCategories getCategories;
  AdhkarBloc(this.getAdhkar, this.getCategories, this._getAdhkarbyCollection) : super(Empty());

  void getAdhkarEvent(int id) async {
    emit(Loading());
    final r = await getAdhkar(Params(number: id));
    r.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (adhkarr) => emit(Loaded(data: adhkarr)),
    );
  }

  void getAdhkarbyCollectionEvent(int id) async {
    emit(Loading());
    final r = await _getAdhkarbyCollection(Params(number: id));
    r.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (adhkarr) => emit(Loaded(data: adhkarr)),
    );
  }

  void getCategoriesEvent() async {
    emit(Loading());
    final r = await getCategories(NoParams());
    r.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (data) => emit(LoadedCategories(data: data)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'ooooooooooooooooooo Unexpected error';
    }
  }
}
