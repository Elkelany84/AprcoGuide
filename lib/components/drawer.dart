import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/categories/clinics/clinic.dart';
import 'package:flutter_auth/Screens/categories/dentals/dental.dart';
import 'package:flutter_auth/Screens/categories/devices/device.dart';
import 'package:flutter_auth/Screens/categories/glasses/glass.dart';
import 'package:flutter_auth/Screens/categories/hospitals/hospital.dart';
import 'package:flutter_auth/Screens/categories/labs/lab.dart';
import 'package:flutter_auth/Screens/categories/pharmacies/pharmacy.dart';
import 'package:flutter_auth/Screens/categories/suggests/suggest.dart';
import 'package:flutter_auth/Screens/categories/xrays/xray.dart';
import 'package:flutter_auth/Screens/homescreen.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class DrawerWidget extends StatefulWidget {
//   const DrawerWidget({super.key});
//
//   @override
//   State<DrawerWidget> createState() => _DrawerWidgetState();
// }
//
// class _DrawerWidgetState extends State<DrawerWidget> {
//   DateTime nightselectedDate = DateTime.now();
//   DateTime dayselectedDate = DateTime.now();
//   DateTime restselectedDate = DateTime.now();
//   int? daytimestamp;
//   int? nighttimestamp;
//   int? resttimestamp;
//
//   @override
//   void initState() {
//     super.initState();
//     getStoredIntValue();
//     getDayDateTime();
//     getNightDateTime();
//     getRestDateTime();
//   }
//
//   Future<void> getStoredIntValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     daytimestamp = prefs.getInt("myDayTimestampKey") ?? 100;
//     nighttimestamp = prefs.getInt("myNightTimestampKey") ?? 200;
//     resttimestamp = prefs.getInt("myRestTimestampKey") ?? 300;
//
//     print(daytimestamp);
//     print(nighttimestamp);
//     print(resttimestamp);
//   }
//
//   DateTime getDayDateTime() {
//     if (daytimestamp == null) {
//       DateTime dateTime = DateTime.now();
//       return dateTime;
//     } else {
//       DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(daytimestamp!);
//       dayselectedDate = dateTime;
//       print(dateTime);
//
//       return dateTime;
//     }
//   }
//
//   DateTime getRestDateTime() {
//     if (resttimestamp == null) {
//       DateTime dateTime = DateTime.now();
//       return dateTime;
//     } else {
//       DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(resttimestamp!);
//       restselectedDate = dateTime;
//       print(dateTime);
//
//       return dateTime;
//     }
//   }
//
//   DateTime getNightDateTime() {
//     if (nighttimestamp == null) {
//       DateTime dateTime = DateTime.now();
//       return dateTime;
//     } else {
//       DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(nighttimestamp!);
//       nightselectedDate = dateTime;
//       print(dateTime);
//
//       return dateTime;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // Add a ListView to the drawer. This ensures the user can scroll
//       // through the options in the drawer if there isn't enough vertical
//       // space to fit everything.
//       child: ListView(
//         // Important: Remove any padding from the ListView.
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             child: Column(
//               //crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Image.asset(
//                 //     "assets/images/aprcologo.jpg",
//                 //     width: 200.0,
//                 //     height: 70.0,
//                 //   ),
//                 SizedBox(height: 80.0),
//                 ListTile(
//                   leading: FaIcon(FontAwesomeIcons.home),
//                   title: Text(
//                     'الشاشة الرئيسية',
//                     style: kDrawerTextStyle.copyWith(color: Colors.white),
//                     textAlign: TextAlign.start,
//                   ),
//                   onTap: () {
//                     Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomeScreen()))
//                         .then((value) => Navigator.pop(context));
//                   },
//                 ),
//               ],
//             ),
//             decoration: BoxDecoration(
//               color: Colors.purple,
//             ),
//           ),
//           // ExpansionTile(
//           //   leading: FaIcon(
//           //     FontAwesomeIcons.calendarAlt,
//           //     color: Colors.purple,
//           //   ),
//           //   title: Text(
//           //     'نتيجــة الــورادى',
//           //     style: kDrawerTextStyle,
//           //   ),
//           //   // onTap: () {
//           //   //   Navigator.push(context,
//           //   //           MaterialPageRoute(builder: (context) => FirstWardia()))
//           //   //       .then((value) => Navigator.pop(context));
//           //   // },
//           //   children: [
//           //     TextButton(
//           //       child: Text(
//           //         'الوردية الأولى',
//           //         style: kDrawerTextStyle,
//           //       ),
//           //       onPressed: () {
//           //         Navigator.push(context,
//           //                 MaterialPageRoute(builder: (context) => FirstWardia()))
//           //             .then((value) => Navigator.pop(context));
//           //       },
//           //     ),
//           //     TextButton(
//           //       child: Text(
//           //         'الوردية الثانية',
//           //         style: kDrawerTextStyle,
//           //       ),
//           //       onPressed: () {
//           //         Navigator.push(context,
//           //                 MaterialPageRoute(builder: (context) => SecondWardia()))
//           //             .then((value) => Navigator.pop(context));
//           //       },
//           //     ),
//           //     TextButton(
//           //       child: Text(
//           //         'الوردية الثالثة',
//           //         style: kDrawerTextStyle,
//           //       ),
//           //       onPressed: () {
//           //         Navigator.push(context,
//           //                 MaterialPageRoute(builder: (context) => ThirdWardia()))
//           //             .then((value) => Navigator.pop(context));
//           //       },
//           //     ),
//           //     TextButton(
//           //       child: Text(
//           //         'الوردية الرابعة',
//           //         style: kDrawerTextStyle,
//           //       ),
//           //       onPressed: () {
//           //         Navigator.push(context,
//           //                 MaterialPageRoute(builder: (context) => FourthWardia()))
//           //             .then((value) => Navigator.pop(context));
//           //       },
//           //     ),
//           //   ],
//           // ),
//           // ListTile(
//           //   leading: FaIcon(
//           //     FontAwesomeIcons.pills,
//           //     color: Colors.purple,
//           //   ),
//           //   title: Text(
//           //     'WardiaSettings',
//           //     style: kDrawerTextStyle,
//           //   ),
//           //   onTap: () {
//           //     Navigator.push(context,
//           //             MaterialPageRoute(builder: (context) => WardiaSettings()))
//           //         .then((value) => Navigator.pop(context));
//           //   },
//           // ),
//           // ListTile(
//           //   leading: FaIcon(
//           //     FontAwesomeIcons.pills,
//           //     color: Colors.purple,
//           //   ),
//           //   title: Text(
//           //     'Custom Wardia',
//           //     style: kDrawerTextStyle,
//           //   ),
//           //   onTap: () {
//           //     // Navigator.push(context,
//           //     //         MaterialPageRoute(builder: (context) => CustomWardia()))
//           //     //     .then((value) => Navigator.pop(context));
//           //   },
//           // ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.calendar,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'نتيجة الوردية',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MyWardia(
//                     myDayTimestampKey: daytimestamp,
//                     dayselectedDate: dayselectedDate,
//                     nightselectedDate: nightselectedDate,
//                     restselectedDate: restselectedDate,
//                     nighttimestamp: nighttimestamp,
//                     resttimestamp: resttimestamp,
//                   ),
//                 ),
//               ).then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.pills,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'الصيــــدليــــــات',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Pharmacies()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.circleH,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'المستشفيـــــــات',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Hospitals()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.vial,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'معامــل التحاليل',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Labs()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.xRay,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'مـراكــز الأشعـــة',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Xrays()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.clinicMedical,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'العيـــــــــادات',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Clinics()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.glasses,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'النظــــــــارات',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Glasses()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.teeth,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'مراكــز الأسنــان',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Dentals()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.wheelchair,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'أجهزة تعويضية',
//               style: kDrawerTextStyle,
//             ),
//             onTap: () {
//               Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Devices()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           ListTile(
//             leading: FaIcon(
//               FontAwesomeIcons.edit,
//               color: Colors.purple,
//             ),
//             title: Text(
//               'أضف جهة طبية',
//               style: kDrawerTextStyle.copyWith(color: Colors.orange[900]),
//             ),
//             onTap: () {
//               Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Suggest()))
//                   .then((value) => Navigator.pop(context));
//             },
//           ),
//           // ListTile(
//           //   leading: FaIcon(
//           //     FontAwesomeIcons.edit,
//           //     color: Colors.purple,
//           //   ),
//           //   title: Text(
//           //     'Admin Page',
//           //     style: kDrawerTextStyle.copyWith(color: Colors.orange[900]),
//           //   ),
//           //   onTap: () async {
//           //     Navigator.push(context,
//           //             MaterialPageRoute(builder: (context) => AdminScreen()))
//           //         .then((value) => Navigator.pop(context));
//           //   },
//           // ),
//           // ListTile(
//           //   leading: FaIcon(
//           //     FontAwesomeIcons.doorOpen,
//           //     color: Colors.purple,
//           //   ),
//           //   title: Text(
//           //     'خــروج',
//           //     style: kDrawerTextStyle,
//           //   ),
//           //   onTap: () async {
//           //     await FirebaseAuth.instance.signOut().then((value) =>
//           //         Navigator.pushReplacement(context,
//           //             MaterialPageRoute(builder: (context) => LoginScreen())));
//           //   },
//           // ),
//         ],
//       ),
//     );
//   }
// }

Widget drawer(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(
              //     "assets/images/aprcologo.jpg",
              //     width: 200.0,
              //     height: 70.0,
              //   ),
              SizedBox(height: 80.0),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.home),
                title: Text(
                  'الشاشة الرئيسية',
                  style: kDrawerTextStyle.copyWith(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                onTap: () {
                  Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()))
                      .then((value) => Navigator.pop(context));
                },
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.purple,
          ),
        ),
        // ExpansionTile(
        //   leading: FaIcon(
        //     FontAwesomeIcons.calendarAlt,
        //     color: Colors.purple,
        //   ),
        //   title: Text(
        //     'نتيجــة الــورادى',
        //     style: kDrawerTextStyle,
        //   ),
        //   // onTap: () {
        //   //   Navigator.push(context,
        //   //           MaterialPageRoute(builder: (context) => FirstWardia()))
        //   //       .then((value) => Navigator.pop(context));
        //   // },
        //   children: [
        //     TextButton(
        //       child: Text(
        //         'الوردية الأولى',
        //         style: kDrawerTextStyle,
        //       ),
        //       onPressed: () {
        //         Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => FirstWardia()))
        //             .then((value) => Navigator.pop(context));
        //       },
        //     ),
        //     TextButton(
        //       child: Text(
        //         'الوردية الثانية',
        //         style: kDrawerTextStyle,
        //       ),
        //       onPressed: () {
        //         Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => SecondWardia()))
        //             .then((value) => Navigator.pop(context));
        //       },
        //     ),
        //     TextButton(
        //       child: Text(
        //         'الوردية الثالثة',
        //         style: kDrawerTextStyle,
        //       ),
        //       onPressed: () {
        //         Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => ThirdWardia()))
        //             .then((value) => Navigator.pop(context));
        //       },
        //     ),
        //     TextButton(
        //       child: Text(
        //         'الوردية الرابعة',
        //         style: kDrawerTextStyle,
        //       ),
        //       onPressed: () {
        //         Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => FourthWardia()))
        //             .then((value) => Navigator.pop(context));
        //       },
        //     ),
        //   ],
        // ),
        // ListTile(
        //   leading: FaIcon(
        //     FontAwesomeIcons.pills,
        //     color: Colors.purple,
        //   ),
        //   title: Text(
        //     'WardiaSettings',
        //     style: kDrawerTextStyle,
        //   ),
        //   onTap: () {
        //     Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => WardiaSettings()))
        //         .then((value) => Navigator.pop(context));
        //   },
        // ),
        // ListTile(
        //   leading: FaIcon(
        //     FontAwesomeIcons.pills,
        //     color: Colors.purple,
        //   ),
        //   title: Text(
        //     'Custom Wardia',
        //     style: kDrawerTextStyle,
        //   ),
        //   onTap: () {
        //     // Navigator.push(context,
        //     //         MaterialPageRoute(builder: (context) => CustomWardia()))
        //     //     .then((value) => Navigator.pop(context));
        //   },
        // ),
        // ListTile(
        //   leading: FaIcon(
        //     FontAwesomeIcons.calendar,
        //     color: Colors.purple,
        //   ),
        //   title: Text(
        //     'نتيجة الوردية',
        //     style: kDrawerTextStyle,
        //   ),
        //   onTap: () {
        //     Navigator.of(context)
        //         .push((MaterialPageRoute(builder: (context) => MyWardia())));
        //   },
        // ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.pills,
            color: Colors.purple,
          ),
          title: Text(
            'الصيــــدليــــــات',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pharmacies()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.circleH,
            color: Colors.purple,
          ),
          title: Text(
            'المستشفيـــــــات',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Hospitals()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.vial,
            color: Colors.purple,
          ),
          title: Text(
            'معامــل التحاليل',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Labs()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.xRay,
            color: Colors.purple,
          ),
          title: Text(
            'مـراكــز الأشعـــة',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Xrays()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.clinicMedical,
            color: Colors.purple,
          ),
          title: Text(
            'العيـــــــــادات',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Clinics()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.glasses,
            color: Colors.purple,
          ),
          title: Text(
            'النظــــــــارات',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Glasses()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.teeth,
            color: Colors.purple,
          ),
          title: Text(
            'مراكــز الأسنــان',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dentals()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.wheelchair,
            color: Colors.purple,
          ),
          title: Text(
            'أجهزة تعويضية',
            style: kDrawerTextStyle,
          ),
          onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Devices()))
                .then((value) => Navigator.pop(context));
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.edit,
            color: Colors.purple,
          ),
          title: Text(
            'أضف جهة طبية',
            style: kDrawerTextStyle.copyWith(color: Colors.orange[900]),
          ),
          onTap: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Suggest()))
                .then((value) => Navigator.pop(context));
          },
        ),
        // ListTile(
        //   leading: FaIcon(
        //     FontAwesomeIcons.edit,
        //     color: Colors.purple,
        //   ),
        //   title: Text(
        //     'Admin Page',
        //     style: kDrawerTextStyle.copyWith(color: Colors.orange[900]),
        //   ),
        //   onTap: () async {
        //     Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => AdminScreen()))
        //         .then((value) => Navigator.pop(context));
        //   },
        // ),
        // ListTile(
        //   leading: FaIcon(
        //     FontAwesomeIcons.doorOpen,
        //     color: Colors.purple,
        //   ),
        //   title: Text(
        //     'خــروج',
        //     style: kDrawerTextStyle,
        //   ),
        //   onTap: () async {
        //     await FirebaseAuth.instance.signOut().then((value) =>
        //         Navigator.pushReplacement(context,
        //             MaterialPageRoute(builder: (context) => LoginScreen())));
        //   },
        // ),
      ],
    ),
  );
}
