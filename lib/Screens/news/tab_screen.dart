// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/homescreen.dart';
// import 'package:flutter_auth/Screens/news/news.dart';
// // import 'package:flutter_auth/components/drawer.dart';
// import 'package:flutter_auth/components/constants.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             'APonline',
//             style: kReusableTextStyle.copyWith(letterSpacing: 5.0),
//           ),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.medical_services),
//                 text: 'الدليل الطبى',
//               ),
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'أخبار عامة وإعلانات',
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(children: [HomeScreen(), News()]),
//         // drawer: drawer(context),
//       ),
//     );
//   }
// }
