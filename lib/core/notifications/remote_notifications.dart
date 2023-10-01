import 'package:flutter/cupertino.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class RemoteNotificationHelper {
  //
  //  Init package
  //
  static Future init() async {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("68f40507-c437-4a06-8f9b-e5599f341404");

    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      debugPrint("Accepted permission: $accepted");
    });
    listen();
  }

  //
  // Listener
  //
  static void listen() {
    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      debugPrint('a remote notification is received. ${event.toString}');
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });
    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      debugPrint('a remote notification is opened/button pressed. ' + result.toString());
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      debugPrint('a remote notification permission changes. ' + changes.toString());
    });

    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      debugPrint('OneSignal remote notification subscription changes. ' + changes.toString());
    });

    OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
      debugPrint('OneSignal remote notification user\'s email subscription changes. ' + emailChanges.toString());
    });
  }
}
