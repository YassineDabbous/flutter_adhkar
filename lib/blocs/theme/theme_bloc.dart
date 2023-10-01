import 'package:adhkar/core/ui/themes/app_theme.dart';
import 'package:bloc/bloc.dart';
import 'theme_state.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(ThemeState(appThemeData[MyAppTheme.Dark]!));

  void getTheme() async {
    emit(ThemeState(appThemeData[await getDefaultTheme()]!));
  }

  void changeTheme(MyAppTheme appTheme) {
    setDefaultTheme(MyAppTheme.values.indexOf(appTheme));
    emit(ThemeState(appThemeData[appTheme]!));
  }
}
