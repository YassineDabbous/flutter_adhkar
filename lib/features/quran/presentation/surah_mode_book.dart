import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adhkar/features/quran/data/models/surahModel.dart';
import 'package:adhkar/features/quran/data/quran_repository_impl.dart';
import 'package:adhkar/features/quran/presentation/surah_mode_book_page.dart';

class SurahScreen extends StatefulWidget {
  //final List<AyahModel> quran;
  final surahId;
  final index;
  final surah;
  final lastRead;
  SurahScreen({this.surahId, this.index, this.surah, this.lastRead});
  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  QuranRepositoryImpl repo = QuranRepositoryImpl.newInstance();
  List<List<AyahModel>>? pages;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _getAyat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> _getAyat() async {
    final r = await repo.getAyat(widget.surahId);
    r.fold((l) => print('Remote error ' + l.toString()), (data) {
      pages = [];
      List<AyahModel> ayat = [];
      int currentPage = data[0].page;
      for (var i = 0; i < data.length; i++) {
        AyahModel aya = data[i];
        if (aya.page == currentPage) {
          ayat.add(aya);
        } else {
          pages?.add(ayat);
          currentPage = aya.page;
          ayat = [];
          ayat.add(aya);
        }
      }
      if (pages?.length == 0) //all ayat are in one page
        pages?.add(ayat);
      print('page ayat count: ${ayat.length}');
      print('pages count: ${pages?.length}');
      setState(() {
        //ayat = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print('height $height , width $width');
    if (pages == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.loose,
              children: <Widget>[
                Image.asset(
                  'assets/images/top.png',
                ),
                Text(
                  '${widget.surah}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'Basmalah'),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: PageView.builder(
            controller: _controller,
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: pages?.length,
            itemBuilder: (context, index) => MushafPage(pages![index], _scroll),
          ),
        ),
      );
    }
  }

  void _scroll() async {
    _controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
