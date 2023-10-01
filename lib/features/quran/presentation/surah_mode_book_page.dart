import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adhkar/features/quran/data/models/surahModel.dart';

class MushafPage extends StatefulWidget {
  List<AyahModel> ayat;
  final Function action;
  MushafPage(this.ayat, this.action) : super(key: Key('aaa'));
  @override
  _MushafPageState createState() => _MushafPageState();
}

class _MushafPageState extends State<MushafPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print('height $height , width $width');
    final bool isFirstPage = widget.ayat.first.numberInSurah == 1;
    if (isFirstPage) {
      AyahModel a = widget.ayat[0];
      a.text = a.text.replaceFirst('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', '');
      widget.ayat[0] = a;
    }
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Color.fromARGB(255, 242, 238, 203),
      child: Scrollbar(
        child: ListView(
          children: [
            if (isFirstPage)
              Text("9", //123456789abcdefghijklmnopqrstuvwxwz
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Basmalah',
                    fontSize: 200.0,
                  )),
            RichText(
              //maxLines: 15,
              //softWrap: true,
              //locale: Locale('ar', 'TN'),
              //textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              text: TextSpan(
                  text: '',
                  children: [
                    for (var i = 0; i < widget.ayat.length; i++) verse(widget.ayat[i].text, widget.ayat[i].numberInSurah),
                  ],
                  style: TextStyle(
                    //backgroundColor: Colors.green,
                    //letterSpacing: 1,
                    //wordSpacing: 1,
                    //height: 1.5,
                    color: Colors.black,
                    fontFamily: 'Uthmanic',
                    fontSize: 21,
                  )),
            ),
            /*Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'page ${widget.ayat[0].page}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ))*/
          ],
        ),
      ),
    );
  }

  TextSpan verse(String txt, int i) {
    String reversed = '$i'.split('').reversed.join();
    String aya = '\u202E' + txt + ' ﴿$reversed﴾ ';
    return TextSpan(
      ///text: txt + '$i',
      //text: '\u202E' + txt + ' ٢ ',
      //text: '\u202E' + txt + ' ﴾$i﴿ ', // + '\u202D'
      text: aya, // + '\u202D'

      recognizer: TapGestureRecognizer()..onTap = () => print('Tap $aya'),
      //style,
    );
  }
}
