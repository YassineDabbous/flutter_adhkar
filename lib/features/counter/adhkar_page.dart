import 'package:flutter/material.dart';
import 'package:adhkar/core/app/constants.dart';
import 'package:adhkar/features/counter/data.dart';

class AdhkarPage extends StatelessWidget {
  //var adhkar = ["subhan allah", "alhamd lellah", "allah akbar"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: adhkarList.length,
        itemBuilder: (ctx, i) {
          return Material(
            child: InkWell(
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.book),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text("${adhkarList[i].text} (${adhkarList[i].count})", style: kAyatStyle, textAlign: TextAlign.justify)),
                  ],
                ),
              ),
              onTap: () => _returnBack(context, adhkarList[i]),
            ),
          );
        });
  }

  void _returnBack(BuildContext context, DhikrModel d) {
    Navigator.pop(context, d);
  }
}
