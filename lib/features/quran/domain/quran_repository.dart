import 'package:adhkar/features/quran/domain/entities/surah.dart';
import 'package:adhkar/features/quran/domain/entities/aya.dart';

abstract class QuranRepository {
  List<SurahClass> getSowar();
  List<AyaClass> getAyat(int id);
}
