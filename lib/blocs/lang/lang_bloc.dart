import 'package:adhkar/core/app/local_storage.dart';
import 'package:bloc/bloc.dart';

import 'lang_state.dart';

class LangBloc extends Cubit<LangState> {
  LangBloc() : super(const LangState('en'));

  getLang() async {
    String lang = await LocalStorage.getLang();
    emit(LangState(lang));
  }

  void changeLang(String local) {
    LocalStorage.setLang(local);
    emit(LangState(local));
  }
}
