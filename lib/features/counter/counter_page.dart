import 'package:flutter/material.dart';
import 'package:adhkar/core/app/constants.dart';
import 'package:adhkar/core/ui/widgets/flare_stack.dart';
import 'package:adhkar/features/counter/adhkar_page.dart';
import 'package:adhkar/features/counter/data.dart';
import 'package:adhkar/generated/l10n.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vibration/vibration.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  DhikrModel dhikr = adhkarList[0];
  Color counterColor = Colors.green;
  List<Color> colors = [
    Colors.blue,
    Colors.pink,
    Colors.green,
    Colors.red,
    Colors.orange,
  ];
  double percent = 0;
  int current = 0;
  int repeated = 0;

  void _reset() {
    percent = 0;
    current = 0;
  }

  void _zero() {
    repeated = 0;
    setState(() {
      _reset();
    });
  }

  void _setColor(Color color) {
    setState(() {
      counterColor = color;
    });
  }

  void _incriment() async {
    if (percent >= 1.0) {
      repeated++;
      _reset();
    }
    current++;
    percent = current / dhikr.count;
    debugPrint("max: ${dhikr.count} current: $current , percent: $percent %");
    setState(() {});
    if (percent == 1.0 && (await Vibration.hasVibrator() ?? false)) {
      Vibration.vibrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(S.of(context).counter),
      ),
      body: FlareStack.mystack(
        width,
        height,
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    child: SizedBox(
                      child: Expanded(
                        child: Text(
                          dhikr.text,
                          textAlign: TextAlign.center,
                          style: kAyatStyle,
                        ),
                      ),
                    ),
                    onTap: _selectDhikr,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    child: CircularPercentIndicator(
                      progressColor: counterColor,
                      animation: true,
                      animateFromLastPercent: current == 1 ? false : true,
                      animationDuration: 500,
                      circularStrokeCap: CircularStrokeCap.round,
                      radius: width / 3,
                      lineWidth: 30,
                      backgroundWidth: 20,
                      percent: percent,
                      center: Text(
                        "$current/${dhikr.count}",
                        style: const TextStyle(fontSize: 80),
                      ),
                    ),
                    onTap: _incriment,
                  ),
                ),
              ),
              Text(
                S.of(context).repeatedTimes(repeated, repeated),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.restore),
                      onPressed: _zero,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: colors.length,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (ctx, index) {
                          return colorItem(index);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget colorItem(index) {
    return Material(
      child: InkWell(
        child: SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            Icons.color_lens,
            color: colors[index],
          ),
        ),
        onTap: () => _setColor(colors[index]),
      ),
    );
  }

  Future<void> _selectDhikr() async {
    var result = await Navigator.push(context, new MaterialPageRoute(builder: (BuildContext ctx) => AdhkarPage(), fullscreenDialog: true));
    if (result != null) {
      dhikr = result as DhikrModel;
      _zero();
    }
  }
}
