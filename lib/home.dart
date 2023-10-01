import 'package:flutter/material.dart';
import 'package:adhkar/features/adhkar/ui/pages/adhkar_page.dart';
import 'package:adhkar/features/adhkar/ui/pages/categories_page.dart';
import 'package:adhkar/features/drawer/drawer.dart';
import 'package:adhkar/generated/l10n.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      tablet: (ctx) => SimpleHome(), //HomeWithBottomNavigation(CategoriesPage()),
      mobile: (ctx) => SimpleHome(),
      /*HomeWithDrawer(
        CounterPage(),
        MyDrawer(),
        maxSlide: MediaQuery.of(ctx).size.width * 0.6,
      ),*/
      watch: (ctx) => Container(color: Colors.blue),
      desktop: (ctx) => Container(color: Colors.green),
    );
  }
}

class SimpleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    print('myLocale.languageCode ${myLocale.languageCode}');
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff28374a),
          title: Text(S.of(context).adhkar), //Text(S.of(context).app_name),
          actions: [IconButton(icon: Icon(Icons.favorite), onPressed: () => _goToAdhkarPage(context, 0, 1))],
        ),
        body: CategoriesPage(),
        drawer: MyDrawer(),
        //endDrawer: MyDrawer(),
      ),
    );
  }

  void _goToAdhkarPage(context, int categoryId, int collectionId) {
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) {
        return AdhkarPage(categoryId, collectionId);
      },
    ));
  }
}
