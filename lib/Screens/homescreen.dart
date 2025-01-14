import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/shiftscalendar/myWardia.dart';
import 'package:flutter_auth/Screens/vacations/show_vacation.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_auth/Screens/Signup/components/body.dart';
// import 'package:flutter_auth/Screens/Login/components/body.dart';
import 'package:flutter_auth/components/reusablecard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:in_app_update/in_app_update.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late var notifyHelper;

  // AppUpdateInfo? _updateInfo;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;

  // Future<void> checkForUpdate() async {
  //   InAppUpdate.checkForUpdate().then((info) {
  //     setState(() {
  //       _updateInfo = info;
  //     });
  //   }).catchError((e) {
  //     showSnack(e.toString());
  //   });
  // }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  DateTime nightselectedDate = DateTime.now();
  DateTime dayselectedDate = DateTime.now();
  DateTime restselectedDate = DateTime.now();
  int? daytimestamp;
  int? nighttimestamp;
  int? resttimestamp;
  @override
  void initState() {
    // _updateInfo?.updateAvailability == UpdateAvailability.updateAvailable
    // ignore: unnecessary_statements
    // ? () {
    // InAppUpdate.performImmediateUpdate()
    // ignore: invalid_return_type_for_catch_error
    // .catchError((e) => showSnack(e.toString()));
    // }
    // ignore: unnecessary_statements
    // : null;
    //                 void Force() {
    //   InAppUpdate.performImmediateUpdate()
    //       .catchError((e) => showSnack(e.toString()));
    // }

    super.initState();
    getStoredIntValue();
    getDayDateTime();
    getNightDateTime();
    getRestDateTime();
    final fbm = FirebaseMessaging.instance;
    // fbm.getToken();
    fbm.subscribeToTopic('aaamoney');
    fbm.subscribeToTopic('bbbmoney');
    fbm.subscribeToTopic('cccmoney');
    // notifyHelper = Notifyhelper();
    // notifyHelper.initializeNotification();
    // notifyHelper.requestIOSPermissions;
  }

  Future<void> getStoredIntValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    daytimestamp = prefs.getInt("myDayTimestampKey") ?? 100;
    nighttimestamp = prefs.getInt("myNightTimestampKey") ?? 100;
    resttimestamp = prefs.getInt("myRestTimestampKey") ?? 100;

    print(daytimestamp);
    print(nighttimestamp);
    print(resttimestamp);
  }

  DateTime getDayDateTime() {
    if (daytimestamp == null) {
      DateTime dateTime = DateTime.now();
      return dateTime;
    } else {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(daytimestamp!);
      dayselectedDate = dateTime;
      print(dateTime);

      return dateTime;
    }
  }

  DateTime getRestDateTime() {
    if (resttimestamp == null) {
      DateTime dateTime = DateTime.now();
      return dateTime;
    } else {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(resttimestamp!);
      restselectedDate = dateTime;
      print(dateTime);

      return dateTime;
    }
  }

  DateTime getNightDateTime() {
    if (nighttimestamp == null) {
      DateTime dateTime = DateTime.now();
      return dateTime;
    } else {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(nighttimestamp!);
      nightselectedDate = dateTime;
      print(dateTime);

      return dateTime;
    }
  }

  @override
  // Widget build(BuildContext context) {
  //   return buildme(context);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ShowVacation();
          }));
        },
        child: Icon(Icons.add),
      ),
      key: _scaffoldKey,
      drawer: drawer(context),
      //  TextButton(
      //   onPressed: () {
      //     _updateInfo?.updateAvailability == UpdateAvailability.updateAvailable
      //         // ignore: unnecessary_statements
      //         ? () {
      //             InAppUpdate.performImmediateUpdate()
      //                 // ignore: invalid_return_type_for_catch_error
      //                 .catchError((e) => showSnack(e.toString()));
      //           }
      //         // ignore: unnecessary_statements
      //         : null;
      //   },
      //   child: drawer(context),
      // ),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyWardia(
                            dayselectedDate: dayselectedDate,
                            nightselectedDate: nightselectedDate,
                            restselectedDate: restselectedDate,
                            myDayTimestampKey: daytimestamp,
                            nighttimestamp: nighttimestamp,
                            resttimestamp: resttimestamp,
                          )),
                );
              }
            },
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.deepPurple[600],
                ),
                SizedBox(
                  width: 5,
                ),
                Shimmer.fromColors(
                  period: const Duration(seconds: 2),
                  direction: ShimmerDirection.rtl,
                  baseColor: Colors.white,
                  highlightColor: Colors.deepPurple[300]!,
                  child: Text(
                    'جدول الوردية',
                    style: kReusableTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Themeservice().switchTheme();
        //       notifyHelper.displayNotification(
        //           title: 'Theme Changed',
        //           body: Get.isDarkMode
        //               ? 'You Switched to Light Mode'
        //               : 'You Switched to Dark Mode');
        //               //  notifyHelper.scheduledNotification();
        //     },
        //     icon: Icon(
        //       Icons.nightlight_round,
        //       size: 20,
        //     ),
        //   ),
        //   SizedBox(
        //     width: 20,
        //   )
        // ],
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'الدليل الطبى 2025',
          style: kReusableTextStyle.copyWith(fontSize: 18),
        ),
      ),
      // drawer: drawer(context),
      body: buildme(context),
    );
  }

  Widget buildme(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'المستشفيات',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'hospitals');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Hospitals()));
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'الصيدليات',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'pharmacies');
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'مراكز الأشعـة',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'xrays');
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'معامل التحاليل',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'labs');
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'النظارات',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'glasses');
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'العيـادات',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'clinics');
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'أجهزة تعويضية',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'devices');
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.purple,
                        cardChild: FittedBox(
                          // fit: BoxFit.fitWidth,
                          child: Text(
                            'مراكز أسنان',
                            style: kReusableTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPress: () {
                          Navigator.pushNamed(context, 'dentals');
                        },
                      ),
                    ),
                  ],
                ),
                // Advalue(),
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter_auth/Screens/Signup/components/body.dart';
// // import 'package:flutter_auth/Screens/Login/components/body.dart';
// import 'package:flutter_auth/components/reusablecard.dart';
// import 'package:flutter_auth/components/constants.dart';
// import 'package:flutter_auth/Screens/categories/pharmacies/pharmacy.dart';
// import 'package:flutter_auth/Screens/categories/hospitals/hospital.dart';
// import 'package:flutter_auth/Screens/categories/labs/lab.dart';
// import 'package:flutter_auth/Screens/categories/xrays/xray.dart';
// import 'package:flutter_auth/Screens/categories/clinics/clinic.dart';
// import 'package:flutter_auth/Screens/categories/glasses/glass.dart';
// import 'package:flutter_auth/Screens/categories/dentals/dental.dart';
// import 'package:flutter_auth/Screens/categories/devices/device.dart';
// import 'package:flutter_auth/components/drawer.dart';
// import 'package:admob_flutter/admob_flutter.dart';

// class HomeScreen extends StatelessWidget {

// //  AdmobBannerSize bannerSize;
//  final bannerSize = AdmobBannerSize.BANNER;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(scaffoldBackgroundColor: Colors.white),
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.purple,
//           centerTitle: true,
//           title: Text(
//             'الدليـــل الطبـــى',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
//           ),
//         ),
//         drawer: drawer(context),
//         body: buildme(context),
//       ),
//     );
//   }
// }

// Widget buildme(BuildContext context) {
//   return LayoutBuilder(
//     builder: (BuildContext context, BoxConstraints viewportConstraints) {
//       return SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: viewportConstraints.maxHeight,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Row(
//                 children: [
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Column(
//                         children: [
//                           Text(
//                             'المستشفيات',
//                             style: kReusableTextStyle,
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                       onPress: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Hospitals()));
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Text(
//                         'الصيدليات',
//                         style: kReusableTextStyle,
//                         textAlign: TextAlign.center,
//                       ),
//                       onPress: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Pharmacies()));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Text(
//                         'مراكز الأشعـة',
//                         style: kReusableTextStyle,
//                         textAlign: TextAlign.center,
//                       ),
//                       onPress: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Xrays()));
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Text(
//                         'معامل التحاليل',
//                         style: kReusableTextStyle,
//                         textAlign: TextAlign.center,
//                       ),
//                       onPress: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Labs()));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Text(
//                         'النظارات',
//                         style: kReusableTextStyle,
//                         textAlign: TextAlign.center,
//                       ),
//                       onPress: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Glasses()));
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Text(
//                         'العيـادات',
//                         style: kReusableTextStyle,
//                         textAlign: TextAlign.center,
//                       ),
//                       onPress: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Clinics()));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Text(
//                         'أجهزة تعويضية',
//                         style: kReusableTextStyle.copyWith(fontSize: 24.0),
//                         textAlign: TextAlign.center,
//                       ),
//                       onPress: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Devices()));
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableCard(
//                       colour: Colors.purple,
//                       cardChild: Text(
//                         'مراكز أسنان',
//                         style: kReusableTextStyle,
//                         textAlign: TextAlign.center,
//                       ),
//                       onPress: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Dentals()));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
