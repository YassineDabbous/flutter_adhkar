import 'package:adhkar/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:adhkar/core/app/initialize.dart';
import 'package:adhkar/core/app/routes.dart';
import 'package:adhkar/features/adhkar/ui/bloc/bloc.dart';
import 'package:adhkar/features/adhkar/ui/di.dart';

import 'package:adhkar/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adhkar/home.dart';
//import 'package:adhkar/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  runApp(const MyApp());
  Initializer.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (c) => LangBloc()..getLang()),
        BlocProvider(create: (c) => ThemeBloc()..getTheme()),
        BlocProvider<AdhkarBloc>(create: (_) => ab),
      ],
      child: BlocBuilder<LangBloc, LangState>(
        builder: (context, langState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: Locale.fromSubtags(languageCode: langState.lang), //S.delegate.supportedLocales[1],
                //title: 'Adhkar',
                //initialRoute: '/quran',
                theme: state.theme.themeData,
                home: ResponsiveHomeScreen(), //SplashScreen(),
                routes: myRoutes,
              );
            },
          );
        },
      ),
    );
  }
}
/*

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichText Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('RichText Example'),
        ),
        body: Center(
          child: RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(
              text: '',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              children: [
                verse('﴿١﴾ بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', 0),
                verse('﴿٢﴾ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ', 1),
                verse('﴿٣﴾ الرَّحْمَٰنِ الرَّحِيمِ', 2),
                verse('﴿٤﴾ مَالِكِ يَوْمِ الدِّينِ', 3),
                verse('﴿٥﴾ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ', 4),
                verse('﴿٦﴾ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ', 5),
                verse(
                    '﴿٧﴾ صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
                    6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextSpan verse(String txt, int i) {
    return TextSpan(
      text: txt + ' ',
      recognizer: TapGestureRecognizer()..onTap = () => print('Tap $i'),
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'LoransMuna',
        fontSize: 24,
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool useTextPainter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: useTextPainter
            ? const Text('TextPainter')
            : const Text('Paragraph'),
      ),
      body: ListView(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(height: 444),
            child: CustomPaint(
              painter: MyPainter(useTextPainter),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            useTextPainter = !useTextPainter;
          });
        },
        tooltip: 'Click to toggle between TextPainter and Paragraph',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final bool useTextPainter;

  MyPainter(this.useTextPainter);

  @override
  void paint(Canvas canvas, Size size) {
    // Backgroud to expose where the canvas is
    canvas.drawRect(Offset(0, 0) & size, Paint()..color = Colors.red[100]);

    // Since text is overflowing, you have two options: cliping before drawing text or/and defining max lines.
    canvas.clipRect(Offset(0, 0) & size);

    final TextStyle style = TextStyle(
      color: Colors.black,
      backgroundColor: Colors.green[100],
      decorationStyle: TextDecorationStyle.dotted,
      decorationColor: Colors.green,
      decorationThickness: 0.25,
      // TODO Add more for testing ;)
    );
    final String text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra lobortis faucibus. Vestibulum efficitur, velit nec accumsan aliquam, lectus elit congue nulla, ac venenatis purus mi vel risus. Ut auctor consequat nibh in sodales. Aenean eget dolor dictum, imperdiet turpis nec, interdum diam. Sed vitae mauris hendrerit, tempus orci sit amet, placerat eros. Nulla dignissim, orci quis congue maximus, eros arcu mattis magna, vitae interdum lacus lorem nec velit. Aliquam a diam at metus pulvinar efficitur. Fusce in augue eget ligula pharetra iaculis. Nunc id dui in magna aliquet hendrerit. Nullam eu enim lacus.

Nullam aliquam elementum velit vel tincidunt. Cras dui ex, lobortis sit amet tortor ut, rutrum maximus tortor. Nulla faucibus tellus nisi, non dapibus nisi aliquam sed. Morbi sed dignissim libero. Fusce dignissim leo nec libero placerat, id consectetur augue interdum. Praesent ut massa nisl. Praesent id pulvinar ex. In egestas nec ligula et blandit.

Cras sed finibus diam. Quisque odio nisl, fermentum et ante vitae, sollicitudin sodales risus. Mauris varius semper lectus, id gravida nibh sodales eget. Pellentesque aliquam, velit quis fringilla rhoncus, neque orci semper tellus, quis interdum odio justo sit amet dui. Nam tristique aliquam purus, in facilisis lacus facilisis sed. Nullam pulvinar ultrices molestie. Cras ac erat porta enim bibendum semper.

Curabitur sed dictum sem, et sollicitudin dolor. Sed semper elit est, at fermentum purus bibendum nec. Donec scelerisque diam sit amet ante cursus cursus in scelerisque tellus. Pellentesque nec nibh id mi euismod efficitur in ac lorem. Pellentesque scelerisque fermentum vestibulum. Cras molestie lobortis dolor vel faucibus. Vivamus hendrerit est vitae tellus commodo accumsan. Phasellus ut finibus nulla. Nam sed massa turpis.

Mauris nec nunc ex. Morbi pellentesque scelerisque ligula, vel accumsan ligula rutrum nec. Pellentesque quis nulla ligula. Duis diam arcu, iaculis nec sem sit amet, malesuada consectetur arcu. Ut a nisi faucibus, pulvinar nisl sit amet, dignissim eros. Ut tortor metus, bibendum a congue fermentum, efficitur sed nisl. Donec vel placerat magna, in placerat ligula. Sed dignissim pulvinar mauris non tristique.
""";

    final start100 = DateTime.now();
    for (int i = 0; i < 100; i++) {
      if (useTextPainter) {
        final TextPainter textPainter = TextPainter(
            text: TextSpan(
                text: text,
                style: style), // TextSpan could be whole TextSpans tree :)
            textAlign: TextAlign.justify,
            //maxLines: 25, // In both TextPainter and Paragraph there is no option to define max height, but there is `maxLines`
            textDirection: TextDirection
                .ltr // It is necessary for some weird reason... IMO should be LTR for default since well-known international languages (english, esperanto) are written left to right.
            )
          ..layout(
              maxWidth: size.width -
                  12.0 -
                  12.0); // TextPainter doesn't need to have specified width (would use infinity if not defined).
        // BTW: using the TextPainter you can check size the text take to be rendered (without `paint`ing it).
        textPainter.paint(canvas, const Offset(12.0, 36.0));
      } else {
        final ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
            ui.ParagraphStyle(
          fontSize: style.fontSize, // There unfortunelly are some things to be copied from your common TextStyle to ParagraphStyle :C
          fontFamily: style.fontFamily, // IDK why it is like this, this is somewhat weird especially when there is `pushStyle` which can use the TextStyle...
          fontStyle: style.fontStyle,
          fontWeight: style.fontWeight,
          textAlign: TextAlign.justify,
          //maxLines: 25,
        ))
          ..pushStyle(style.getTextStyle()) // To use multiple styles, you must make use of the builder and `pushStyle` and then `addText` (or optionally `pop`).
          ..addText(text);
        final ui.Paragraph paragraph = paragraphBuilder.build()
          ..layout(ui.ParagraphConstraints(width: size.width - 12.0 - 12.0)); // Paragraph need to have specified width :/
        canvas.drawParagraph(paragraph, const Offset(12.0, 36.0));
      }
    }
    final total = DateTime.now().difference(start100).inMicroseconds;
    print(
        "Using ${useTextPainter ? 'TextPainter' : 'Paragraph'}: total $total microseconds for rendering 100 times");

    // You definitely should check out https://api.flutter.dev/flutter/dart-ui/Canvas-class.html and related
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Just for example, in real environment should be implemented!
  }
}

*/
