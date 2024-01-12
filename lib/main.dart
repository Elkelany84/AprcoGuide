// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/categories/clinics/clinic.dart';
import 'package:flutter_auth/Screens/categories/dentals/dental.dart';
import 'package:flutter_auth/Screens/categories/devices/device.dart';
import 'package:flutter_auth/Screens/categories/glasses/glass.dart';
import 'package:flutter_auth/Screens/categories/hospitals/hospital.dart';
import 'package:flutter_auth/Screens/categories/labs/lab.dart';
import 'package:flutter_auth/Screens/categories/pharmacies/pharmacy.dart';
import 'package:flutter_auth/Screens/categories/xrays/xray.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:flutter_auth/get_services/theme.dart';
// import 'package:flutter_auth/get_services/theme_services.dart';
import 'Screens/homescreen.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     // description
//     importance: Importance.high,
//     playSound: true);
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('A bg message just showed up :  ${message.messageId}');
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  // MobileAds.instance.initialize();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  Widget homeScreen = HomeScreen();

  // User user = await FirebaseAuth.instance.currentUser;
  // if (user == null) {
  //   homeScreen = LoginScreen();
  // }

  runApp(MyApp(homeScreen));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final Widget home;
  MyApp(this.home);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             color: Colors.blue,
    //             playSound: true,
    //             icon: '@mipmap/ic_launcher',
    //           ),
    //         ));
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             title: Text(notification.title!),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [Text(notification.body!)],
    //               ),
    //             ),
    //           );
    //         });
    //   }
    // });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APonline',
      // theme:Themes.light,
      // darkTheme: Themes.dark,
      // themeMode: Themeservice().themes,
      //  ThemeData(
      //   primaryColor: kPrimaryColor,
      //   scaffoldBackgroundColor: Colors.white,
      //   fontFamily: 'ElMessiri',
      // ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'),
        const Locale('en'),
      ],
      locale: Locale("ar", "AE"),
      home: widget.home,
      // initialRoute: '/',
      routes: {
        // '/':(context)=>TabsScreen(),
        'clinics': (BuildContext context) => Clinics(),
        'dentals': (BuildContext context) => Dentals(),
        'devices': (BuildContext context) => Devices(),
        'glasses': (BuildContext context) => Glasses(),
        'hospitals': (BuildContext context) => Hospitals(),
        'labs': (BuildContext context) => Labs(),
        'pharmacies': (BuildContext context) => Pharmacies(),
        'xrays': (BuildContext context) => Xrays(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   final Widget home;
//   MyApp(this.home);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'APonline',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'ElMessiri',
//       ),
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         const Locale('ar', 'AE'),
//       ],
//       locale: Locale("ar", "AE"),
//       home: home,
//     );
//   }
// }
