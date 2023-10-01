import 'package:equatable/equatable.dart';
import 'package:adhkar/core/ui/themes/app_theme.dart';

class ThemeState extends Equatable {
  final CustomTheme theme;
  const ThemeState(this.theme);

  @override
  List<Object> get props => [theme];
}
