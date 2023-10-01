import 'package:flutter/material.dart';
import 'package:adhkar/core/app/helpers/my_clipboard.dart';
import 'package:adhkar/features/quran/data/models/surahModel.dart';
import 'package:adhkar/features/quran/data/quran_repository_impl.dart';
import 'package:adhkar/features/quran/presentation/item_positions_listener.dart';
import 'package:adhkar/features/quran/presentation/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class PageTheme {
  static final Color bgColor = const Color(0xFF212121);
  static final Color ayaColor = Colors.white;
  static final Color ayaNumberColor = Colors.yellow;
  static final Color surahNameColor = Colors.white;
}

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
  bool firsBuild;
  bool bookmarked;
  List<AyahModel> ayat;

  @override
  void initState() {
    super.initState();
    _getAyat();
    firsBuild = true;
    bookmarked = false;
  }

  Future<void> _getAyat() async {
    /*SurahsList data = await QuranRepositoryImpl.getSurahList(context);
    setState(() {
      sowar = data.surahs;
    });*/
    final r = await repo.getAyat(widget.surahId);
    r.fold((l) => print('Remote error ' + l.toString()), (r) {
      setState(() {
        ayat = r;
      });
    });
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  void isBookMarked(int index1) {
    setState(() {
      if (!bookmarked) {
        bookmarked = true;
      } else {
        bookmarked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ayat == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: PageTheme.bgColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: PageTheme.bgColor,
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
                      style: TextStyle(
                          fontFamily: 'Indonesia',
                          color: PageTheme.surahNameColor),
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: ScrollablePositionedList.builder(
                itemCount: ayat.length,
                itemBuilder: (ctx, i) => buildItem(ctx, i),
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                initialScrollIndex: widget.lastRead,
              ),
            ),
          );
    /* double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FlareStack.stack(width, height, [
      Container(
        child: ScrollablePositionedList.builder(
          itemCount: bacaQuran.length,
          itemBuilder: (ctx, i) => buildItem(ctx, i),
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          initialScrollIndex: widget.lastRead,
        ),
      )
    ]); */
  }

  Widget buildItem(context, index) {
    //isBookMarked(index, widget.index);
    return StickyHeaderBuilder(
        overlapHeaders: true,
        builder: (BuildContext context, double stuckAmount) {
          return stickyNumber(index, stuckAmount);
        },
        content: ayaView(index));
  }

  Widget stickyNumber(int index, double stuckAmount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/images/ayat2.png'),
        maxRadius: 20.0,
        child: Text(
          '${index + 1}',
          style: TextStyle(color: PageTheme.ayaNumberColor),
        ),
      ),
    );
  }

  Widget ayaView(int index) {
    return Container(
      color: PageTheme.bgColor,
      padding: EdgeInsets.only(left: 50.0, bottom: 4),
      child: Card(
        color: PageTheme.bgColor,
        elevation: 1,
        child: ListTile(
          //selected: bookmarked,
          onLongPress: () => MyClipboard.copy(ayat[index].text),
          title: Text(
            '${ayat[index].text}',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'Indonesia',
              height: 2.2,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
