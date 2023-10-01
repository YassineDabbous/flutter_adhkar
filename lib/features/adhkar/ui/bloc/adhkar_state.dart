part of 'adhkar_bloc.dart';

@immutable
abstract class AdhkarState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends AdhkarState {}

class Loading extends AdhkarState {}

class Loaded extends AdhkarState {
  final List<Dhikr> data;

  Loaded({required this.data});

  @override
  List<Object> get props => [data];
}

class LoadedByCollection extends AdhkarState {
  final List<Dhikr> data;

  LoadedByCollection({required this.data});

  @override
  List<Object> get props => [data];
}

class LoadedCategories extends AdhkarState {
  final List<Category> data;

  LoadedCategories({required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends AdhkarState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
