import 'package:adhkar/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adhkar/core/ui/themes/app_theme.dart';
import 'package:adhkar/generated/l10n.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ThemeSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).themes),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: ListView.builder(itemCount: MyAppTheme.values.length, itemBuilder: _themeIem),
          ),
        );
      },
    );
  }

  Widget _themeIem(ctx, index) {
    final t = MyAppTheme.values[index];
    final theme = appThemeData[t]!.themeData;
    return Material(
      color: theme.primaryColor,
      child: ListTile(
        title: Text(
          appThemeData[theme]?.name ?? '--- NO NAME ----',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyText1, //TextStyle(color: Colors.white)
        ),
        onTap: () {
          BlocProvider.of<ThemeBloc>(ctx).changeTheme(t);
        },
      ),
    );
  }
}
