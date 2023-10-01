import 'package:adhkar/core/notifications/local_notifications.dart';
import 'package:adhkar/core/notifications/remote_notifications.dart';

class Initializer {
  static Future init() async {
    LocalNotificationHelper.init();
    RemoteNotificationHelper.init();
  }
}
