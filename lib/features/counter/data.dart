final adhkarList = [
  DhikrModel('سُبْحَانَ اللّٰهِ.', 33),
  DhikrModel('اَلْحَمْدُ لِلّٰهِ.', 33),
  DhikrModel('اَللّٰهُ أَكْبَرُ.', 33),
  DhikrModel('أَسْتَغْفِرُاللّٰهَ.', 3),
  DhikrModel(
      'اَللّٰهُمَّ أَنْتَ السَّلَامُ ، وَمِنْكَ السَّلَامُ ، تَبَارَكْتَ ، يَاذَا الْجَلَالِ وَالْاِكْرَامِ.',
      1),
  //DhikrModel('', 3),
  //DhikrModel('', 3),
  DhikrModel(
      ' قُلْ هُوَٱللّٰهُ أَحَدٌ ١ ٱللّٰهُ ٱلصَّمَدُ ٢ لَمْ يَلِدْ وَلَمْ يُوْلَدْ ٣ وَلَمْ يَكُنْ لَّهُۥ كُفُوًا أَحَدُۢ ٤',
      3),
  DhikrModel(
      'قُلْ أَعُوْذُ بِرَبِّ ٱلْفَلَقِ ١ مِنْ شَرِّ مَا خَلَقِ ٢ وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ ٣ وَمِنْ شَرِّ ٱلنَّفَّـٰثَـٰتِ فِي ٱلْعُقَدِ ٤ وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ ٥',
      3),
  DhikrModel(
      'قُلْ أَعُوْذُ بِرَبِّ ٱلنَّاسِ ١ مَلِكِ ٱلنَّاسِ ٢ إِلٰهِ ٱلنَّاسِ ٣ مِنْ شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ ٤ ٱلَّذِيْ يُوَسْوِسُ فِيْ صُدُوْرِ ٱلنَّاسِ ٥ مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ ٦',
      3),
  DhikrModel(
      'لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيْكَ لَهُ ، لَهُ الْمُلْكُ ، وَلَهُ الْحَمْدُ ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيْرٌ.',
      1)
];

class DhikrModel {
  String text;
  int count;
  DhikrModel(this.text, this.count);
}
