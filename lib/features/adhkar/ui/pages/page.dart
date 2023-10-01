import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:adhkar/core/app/sharer.dart';
import 'package:adhkar/core/notifications/local_notifications.dart';
import 'package:adhkar/core/ui/widgets/image_view.dart';
import 'package:adhkar/downloads_manager.dart';
import 'package:adhkar/features/adhkar/data/datasources/local/database.dart';
import 'package:adhkar/features/adhkar/domain/entities/dhikr.dart';
import 'package:adhkar/features/adhkar/ui/widgets/counter.dart';
import 'package:adhkar/features/adhkar/ui/widgets/gradiant_border.dart';
import 'package:adhkar/features/adhkar/ui/widgets/play_btn.dart';
import 'package:adhkar/generated/l10n.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';

class BookPage extends StatefulWidget {
  final Dhikr dhikr;
  final Function() action;
  BookPage(this.dhikr, this.action) : super(key: Key('aaa'));

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Color kBackground = Colors.white;

  @override
  Widget build(BuildContext context) {
    kBackground = Theme.of(context).backgroundColor;
    debugPrint('dhikrrrrrrrrrrrrrrrrrrrrrrrr ${widget.dhikr.collectionId}');
    return Container(
      //padding: EdgeInsets.all(10),
      color: Color(0xff28374a),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final localWidth = sizingInformation.localWidgetSize.width;
          final localHeight = sizingInformation.localWidgetSize.height;
          return Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  width: localWidth,
                  height: localHeight - 40 - 5,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: widget.dhikr.imageOffline != null ? Image.file(File(widget.dhikr.imageOffline!)) : ImageView(widget.dhikr.image),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                width: localWidth,
                child: buttons(),
              ),
              (widget.dhikr.count == null || widget.dhikr.count == 0)
                  ? Positioned(
                      top: localHeight - 40 - 10,
                      left: localWidth / 2 - 20 - 10,
                      child: IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.arrow_drop_down_circle),
                        onPressed: widget.action,
                      ))
                  : Positioned(
                      top: localHeight - 90,
                      left: localWidth / 2 - 40 - 5,
                      height: 130,
                      width: 80,
                      child: CircleCounter(
                        widget.dhikr.count,
                        () => widget.action(),
                      ),
                    ),
            ],
          );
          /*return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                width: localWidth,
                height: localHeight - 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: kBackground,
                    border: Border.all(width: 0.0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.all(10),
                  child: gradientBoxBorder(box(context)),
                ),
              ),
              Positioned(
                top: localHeight - 90,
                left: 10,
                width: localWidth - 20,
                height: 40,
                child: buttons(),
              ),
              Positioned(
                  top: localHeight - 120,
                  left: localWidth / 2 - 50 - 5,
                  height: 150,
                  width: 100,
                  child: (widget.dhikr.count == null || widget.dhikr.count == 0)
                      ? IconButton(
                          icon: Icon(Icons.arrow_drop_down_circle),
                          onPressed: widget.action,
                        )
                      : CircleCounter(
                          widget.dhikr.count, () => widget.action())),
            ],
          );*/
        },
      ),
    );
  }

  showPicker() {
    DatePicker.showTime12hPicker(
      context,
      showTitleActions: true,
      onChanged: (date) {
        debugPrint('change $date');
      },
      onConfirm: (date) async {
        debugPrint('confirm $date');
        //final l = LocalNotificationHelper();
        await LocalNotificationHelper().dailyAdhkar(
          widget.dhikr.id,
          date,
          widget.dhikr.title,
          'Daily Dhikr',
          payload: '${widget.dhikr.id}',
        );
      },
      locale: LocaleType.ar,
    );
  }

  Widget buttons() {
    return Container(
      color: kBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            btn(Icons.arrow_back, () => Navigator.maybePop(context)),
            btn(Icons.file_download, widget.dhikr.fileOffline == null ? (() => downloadFile()) : null),
            Container(
              width: 40,
              height: 40,
              child: PlayBtn(url: widget.dhikr.audioOffline ?? widget.dhikr.audio),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            btn(Icons.access_alarm, () => showPicker()),
            btn(Icons.share, () {
              widget.dhikr.link != null ? Sharer.share(widget.dhikr.link) : Sharer.shareApp(context);
            }),
            btn((widget.dhikr.collectionId == 0 ? Icons.favorite_border : Icons.favorite), _toggleLike),
          ])
        ],
      ),
    );
  }

  void _toggleLike() {
    setState(() {
      widget.dhikr.collectionId = (widget.dhikr.collectionId == 0 ? 1 : 0);
      MyDatabase.getInstance().toggleLike(widget.dhikr.id, widget.dhikr.collectionId);
    });
  }

  downloadFile() {
    //launch(widget.dhikr.file);
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) {
        return DownloadsPage(
          title: S.of(context).downloads,
          documents: [TaskInfo(type: 'audio', postId: widget.dhikr.id, name: widget.dhikr.title, link: widget.dhikr.file)],
          platform: Theme.of(context).platform,
        );
      },
    ));
  }

  Widget btn(IconData iconData, Function()? _onPressed) {
    return Material(
      color: Colors.transparent,
      child: IconButton(icon: Icon(iconData), color: Colors.blue, onPressed: _onPressed),
    );
  }

  Widget box(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            widget.dhikr.title != null
                ? Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          widget.dhikr.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'LoransMuna',
                            //color: Colors.black,
                          ),
                        )),
                  )
                : Text(' '), // NO TITLE
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: widget.dhikr.image != null
                  ? ImageView(widget.dhikr.image)
                  : HtmlWidget(
                      '<span style="text-align: center;">${widget.dhikr.content}</span>',
                      textStyle: TextStyle(
                        fontSize: 48,
                        fontFamily: 'LoransMuna',
                        decoration: TextDecoration.none,
                        //color: Colors.black
                      ),
                    ),
            ),
            widget.dhikr.footer != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      decoration: BoxDecoration(
                        color: kBackground,
                        border: Border.all(width: 0.0, color: Colors.red),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: HtmlWidget(
                        '<span style="text-align: center;">${widget.dhikr.footer}</span>',
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'LoransMuna',
                          decoration: TextDecoration.none,
                          //color: Colors.black
                        ),
                      ),
                    ),
                  )
                : Text(' '), // NO FOOTER
            /*ImageView(widget.dhikr.image)*/
            SizedBox(
              // for bottom padding
              height: 100,
            )
          ],
        ));
  }

  Widget gradientBoxBorder(Widget _child) {
    return MyGradientBoxBorder(
      strokeWidth: 4,
      radius: 16,
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.blue[400]!,
          Colors.blue[300]!,
          Colors.blue[200]!,
          Colors.blue[100]!,
          Colors.blue[50]!,
          kBackground,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      child: _child,
    );
  }
}
