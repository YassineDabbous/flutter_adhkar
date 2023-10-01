import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adhkar/core/ui/widgets/loading_indicator.dart';
import 'package:adhkar/downloads_manager.dart';
import 'package:adhkar/features/adhkar/domain/entities/dhikr.dart';
import 'package:adhkar/features/adhkar/ui/bloc/adhkar_bloc.dart';
import 'package:adhkar/features/adhkar/ui/widgets/message_display.dart';
import 'package:adhkar/features/adhkar/ui/pages/page.dart';
import 'package:adhkar/generated/l10n.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';

class AdhkarPage extends StatefulWidget {
  final int categoryID;
  final int collectionID;

  AdhkarPage(this.categoryID, this.collectionID);

  @override
  _AdhkarPageState createState() => _AdhkarPageState();
}

class _AdhkarPageState extends State<AdhkarPage> {
  List<Dhikr>? data;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void firstEvent() {
    if (widget.collectionID == 0) {
      BlocProvider.of<AdhkarBloc>(context).getAdhkarEvent(widget.categoryID);
    } else {
      BlocProvider.of<AdhkarBloc>(context).getAdhkarbyCollectionEvent(widget.collectionID);
    }
  }

  @override
  Widget build(BuildContext context) {
    firstEvent();
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.collectionID == 0
            ? S.of(context).adhkar
            : S.of(context).favoris),
      ),*/
      body: Container(
        child: BlocBuilder<AdhkarBloc, AdhkarState>(
          builder: (ctx, state) {
            if (state is Empty) {
              return MessageDisplay(
                message: S.of(context).loading + "...",
              );
            } else if (state is Loading) {
              return LoadingIndicatorPrayer();
            } else if (state is Loaded) {
              data = state.data;
            } else if (state is LoadedByCollection) {
              data = state.data;
            } else if (state is Error) {
              return MessageDisplay(
                message: state.message,
              );
            }
            return contentView();
            /*Stack(
              children: [
                contentView(),
                Positioned(
                  top: 26,
                  left: 0,
                  width: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                )
              ],
            );*/
          },
        ),
      ),
    );
  }

  downloadFile() {
    var tasks = (data ?? []).map(
      (e) {
        print(e.audio);
        return TaskInfo(type: 'audio', postId: e.id, name: e.title, link: e.file);
      },
    ).toList();
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) {
        return DownloadsPage(
          title: S.of(context).downloads,
          documents: tasks,
          platform: Theme.of(context).platform,
        );
      },
    ));
  }

  Widget contentView() {
    if (data != null) {
      if (data!.isNotEmpty) {
        return Scaffold(
          /*appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(Icons.file_download), onPressed: downloadFile)
            ],
          ),*/
          body: PageView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemCount: data!.length,
            itemBuilder: (context, index) => BookPage(data![index], _scroll),
          ),
        );
      } else {
        return MessageDisplay(
          message: (widget.collectionID == 0 ? S.of(context).empty_adhkar : S.of(context).empty_favoris),
        );
      }
    } else {
      return const MessageDisplay(message: 'No State data, go back please.');
    }
  }

  void _scroll() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate();
    }
    _controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
