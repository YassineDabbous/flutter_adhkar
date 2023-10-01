import 'package:flutter/widgets.dart';
import 'package:adhkar/core/app/constants.dart';
import 'package:adhkar/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io' show Platform;

class Sharer {
  static share(String text) {
    Share.share(text);
  }

  static shareApp(BuildContext context) {
    Share.share(S.of(context).app_share_message + ' ' + (Platform.isIOS ? kAppStoreLink : kGooglePlayLink));
  }
}
