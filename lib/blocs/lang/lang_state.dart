import 'package:equatable/equatable.dart';

class LangState extends Equatable {
  final String lang;
  const LangState(this.lang);

  @override
  List<Object> get props => [lang];
}
