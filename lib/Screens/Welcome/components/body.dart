// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
// import 'package:flutter_auth/Screens/Welcome/components/background.dart';
// import 'package:flutter_auth/components/rounded_button.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:flutter_svg/svg.dart';
// //import 'package:url_launcher/url_launcher.dart';

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
  
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     // This size provide us total height and width of our screen
//     return Background(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "مُلتقـى العامليـــن",
//               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0),
//             ),
//             SizedBox(height: size.height * 0.05),
//             SvgPicture.asset(
//               "assets/icons/chat.svg",
//               height: size.height * 0.45,
//             ),
//             SizedBox(height: size.height * 0.05),
//             RoundedButton(
//               text: "دخــــول",
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//             RoundedButton(
//               text: "حساب جديد",
//               color: kPrimaryLightColor,
//               textColor: Colors.black,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return SignUpScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//                      ],
//         ),
//       ),
//     );
//   }

// }

// // Future<void> _launched;
// //   String _phone = '01066932261';
// //  ElevatedButton(
// //               child: Text('Call It'),
// //               onPressed: () {
// //                 setState(() {
// //                   _launched = _makePhoneCall('tel: $_phone');
// //                 });
// //               },
// //             )
// //   Future<void> _makePhoneCall(String url) async {
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }