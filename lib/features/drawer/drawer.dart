import 'package:flutter/material.dart';
import 'package:adhkar/core/app/rate_app.dart';
import 'package:adhkar/core/app/sharer.dart';
import 'package:adhkar/generated/l10n.dart';

class MyDrawer extends StatelessWidget {
  ThemeData? theme;
  myListTile(BuildContext context, double height, IconData tileIcon, String title, [String? pushName, Function? action]) {
    return Card(
      child: ListTile(
        leading: Icon(tileIcon, size: height * 0.035),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'LoransMuna',
          ),
        ),
        onTap: () {
          if (action != null)
            action();
          else
            Navigator.pushNamed(context, pushName!);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    theme = Theme.of(context);
    return SizedBox(
      width: width * 0.835,
      height: height,
      child: Material(
        color: theme?.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              DrawerAppName(),
              /*myListTile(context, height, Icons.view_headline,
                  S.of(context).adhkar, "/adhkar"),*/
              myListTile(context, height, Icons.all_inclusive, S.of(context).counter, "/counter"),
              /*myListTile(context, height, Icons.timelapse,
                  S.of(context).prayerTimes, "/praytimes"),
              myListTile(context, height, Icons.directions, S.of(context).qibla,
                  "/qibla"),*/
              myListTile(context, height, Icons.book, S.of(context).quran, "/quran"),
              myListTile(context, height, Icons.list, S.of(context).asmaa, "/asmaa"),
              myListTile(context, height, Icons.settings, S.of(context).settings, "/settings"),

              /*myListTile(
                  context, height, Icons.help, S.of(context).help, "/help"),*/

              myListTile(
                context,
                height,
                Icons.info,
                S.of(context).introduction,
                '/aboutus',
                /* , () {
                showAboutDialog(
                    context: context,
                    applicationVersion: '$kAppVersionNumber',
                    applicationName: S.of(context).app_name,
                    applicationLegalese: S.of(context).app_slogon,
                    applicationIcon: Image.asset(
                      'assets/quranRail.png',
                      height: height * 0.10,
                    ));
              } */
              ),
              myListTile(context, height, Icons.share, S.of(context).share_app, '', () => Sharer.shareApp(context)),
              myListTile(context, height, Icons.star, S.of(context).rate_app, '', () {
                print('go rate me');
                rateApp(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerAppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).app_name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: height * 0.025, color: Colors.grey[200]),
            ),
            Text(
              S.of(context).app_slogon,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[200], fontSize: height * 0.035),
            )
          ],
        ),
        Image.asset('assets/quranRail.png', height: height * 0.17)
      ],
    );
  }
}
