import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:triwarna_rebuild/app/core/utils/local_notif.dart';

class FirebaseNotif {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final LocalNotif localNotif = LocalNotif();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('yey');
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('yey 2');
    } else {
      print('gagal');
    }
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      print('Test');
      localNotif.showNotifications(
        id: message.notification.hashCode,
        title: message.notification?.title,
        body: message.notification?.body,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print(message.data);
    });
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
}