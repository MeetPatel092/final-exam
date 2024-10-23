import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  NotificationHelper._();
  static final NotificationHelper notificationHelper = NotificationHelper._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  get onDidReceiveLocalNotification => null;

  get onDidReceiveNotificationResponse => null;

  initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/icon_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    tz.initializeTimeZones();
  }

  scheduleNotification({required title, required body}) async {
    await initNotification();

    // AndroidNotificationDetails androidNotificationDetails =
    //     AndroidNotificationDetails("SCN", "schedule notification",
    //         importance: Importance.max, priority: Priority.high);

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'repeating channel id', 'schedule notification',
            channelDescription: 'repeating description',
            importance: Importance.max,
            priority: Priority.high);
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'repeating title',
      'repeating body',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2)),
      notificationDetails,
    );

    // NotificationDetails notificationdetails =
    //     NotificationDetails(android: androidNotificationDetails);

    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   1,
    //   title,
    //   body,
    //   tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2)),
    //   notificationDetails,
    //   androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    // );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2)),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  simpleNotification() async {
    await initNotification();

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("SCN", "simple notification",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      1,
      "simple notification",
      "hello word",
      notificationDetails,
    );
  }
}
