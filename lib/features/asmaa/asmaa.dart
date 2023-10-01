import 'package:flutter/material.dart';
import 'package:adhkar/core/ui/widgets/loading_indicator.dart';
import 'package:adhkar/features/asmaa/allasmaul.dart';
import 'package:adhkar/features/asmaa/cardasmaul.dart';
import 'package:adhkar/features/asmaa/data/local_asmaa_repository.dart';
import 'package:adhkar/generated/l10n.dart';

class AsmaaPage extends StatefulWidget {
  @override
  _ListAsmaulState createState() => _ListAsmaulState();
}

class _ListAsmaulState extends State<AsmaaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).asmaa),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: FutureBuilder<List<AllAsmaul>>(
          future: LocalAsmaaRepository.loadAsmaa(),
          builder: (c, snapshot) {
            return snapshot.hasData
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      children: snapshot.data!
                          .map((asm) => new CardAsmaul(
                                arabic: asm.arabic,
                                title: asm.latin,
                                translate: asm.translationId,
                              ))
                          .toList(),
                    ))
                : LoadingIndicator();
          },
        ),
      ),
    );
  }
}
