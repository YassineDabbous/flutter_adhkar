import 'package:flutter/material.dart';
import 'package:adhkar/core/app/helpers/my_clipboard.dart';
import 'package:adhkar/features/quran/data/models/surahModel.dart';
import 'package:adhkar/features/quran/data/quran_repository_impl.dart';
import 'package:adhkar/features/quran/presentation/surah_mode_list.dart';
import 'package:adhkar/generated/l10n.dart';

class SowarScreen extends StatefulWidget {
  @override
  _SowarScreenState createState() => _SowarScreenState();
}

class _SowarScreenState extends State<SowarScreen> {
  List<SurahModel> sowar = [];
  QuranRepositoryImpl repo = QuranRepositoryImpl.newInstance();

  @override
  void initState() {
    _getSowar();
    super.initState();
  }

  Future<void> _getSowar() async {
    /*SurahsList data = await QuranRepositoryImpl.getSurahList(context);
    setState(() {
      sowar = data.surahs;
    });*/
    final r = await repo.getSuwar();
    r.fold(
      (l) => print(
        'Remote error ' + l.toString(),
      ),
      (r) {
        sowar = r;
        setState(() {});
      },
    );
  }

  void _openSurah(int index) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SurahScreen(
                  surahId: sowar[index].id,
                  index: index,
                  surah: '${sowar[index].name}',
                  lastRead: 0,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).quran),
      ),
      body: ListView.builder(
          itemCount: sowar.length,
          itemBuilder: (context, int index) {
            final item = sowar[index];
            return GestureDetector(
              onTap: () => _openSurah(index),
              onLongPress: () => MyClipboard.copy(item.name),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Text('${item.id}')),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Text(
                                '${item.name}',
                                style: TextStyle(fontFamily: 'Indonesia'),
                              ),
                              Text('${item.englishName}'),
                            ],
                          )),
                      Expanded(flex: 5, child: Text('${item.englishNameTranslation}')),
                      Expanded(flex: 1, child: Text('${item.revelationType}')),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
