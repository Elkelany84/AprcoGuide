// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class Notifyhelper {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin(); //
//
//   initializeNotification() async {
//     tz.initializeTimeZones();
//     // final IOSInitializationSettings initializationSettingsIOS =
//     //     IOSInitializationSettings(
//     //         requestSoundPermission: false,
//     //         requestBadgePermission: false,
//     //         requestAlertPermission: false,
//     //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings("appicon");
//
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       // iOS: initializationSettingsIOS,
//       android: initializationSettingsAndroid,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       // onSelectNotification: selectNotification
//     );
//   }
//
//   displayNotification({String? title, String? body}) async {
//     print("doing test");
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//         "your channel id", "your channel name",
//         importance: Importance.max, priority: Priority.high);
//     // var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//     );
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title, body,
//       // 'You change your theme',
//       // 'You changed your theme back !',
//       platformChannelSpecifics,
//       payload: 'It could be anything you pass',
//     );
//   }
//
//   scheduledNotification() async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'scheduled title',
//         'theme changes 5 seconds ago',
//         tz.TZDateTime.now(tz.local).add(const Duration(seconds: 3)),
//         const NotificationDetails(
//             android: AndroidNotificationDetails(
//                 'your channel id', 'your channel name')),
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }
//
//   void requestIOSPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   Future selectNotification(String? payload) async {
//     if (payload != null) {
//       print('notification payload: $payload');
//     } else {
//       print("Notification Done");
//     }
//     Get.to(() => Container(
//           color: Colors.white,
//         ));
//   }
//
//   Future onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     // showDialog(
//     //   //context: context,
//     //   builder: (BuildContext context) => CupertinoAlertDialog(
//     //     title: Text(title),
//     //     content: Text(body),
//     //     actions: [
//     //       CupertinoDialogAction(
//     //         isDefaultAction: true,
//     //         child: Text('Ok'),
//     //         onPressed: () async {
//     //           Navigator.of(context, rootNavigator: true).pop();
//     //           await Navigator.push(
//     //             context,
//     //             MaterialPageRoute(
//     //               builder: (context) => SecondScreen(payload),
//     //             ),
//     //           );
//     //         },
//     //       )
//     //     ],
//     //   ),
//     // );
//     Get.dialog(Text('Welcome To Flutter'));
//   }
// }
