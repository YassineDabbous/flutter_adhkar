import 'package:adhkar/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String languageCode = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Languages')),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: const Text("Arabic"),
              trailing: trailingWidget('ar'),
              onPressed: (ctx) {
                changeLanguage('ar');
              },
            ),
            SettingsTile(
              title: const Text("English"),
              trailing: trailingWidget('en'),
              onPressed: (ctx) {
                changeLanguage('en');
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget? trailingWidget(String lang) {
    return (languageCode == lang) ? const Icon(Icons.check, color: Colors.blue) : null;
  }

  void changeLanguage(String lang) {
    BlocProvider.of<LangBloc>(context).changeLang(lang);
    setState(() {
      languageCode = lang;
    });
  }
}
