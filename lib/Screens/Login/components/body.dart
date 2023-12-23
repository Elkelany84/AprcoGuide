// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/Login/components/background.dart';
// import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
// import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
// import 'package:flutter_auth/components/rounded_button.dart';
// import 'package:flutter_auth/components/rounded_input_field.dart';
// import 'package:flutter_auth/components/rounded_password_field.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_auth/Screens/homescreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Body extends StatefulWidget {
 
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   User user =  FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "دخــــول",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
//           ),
//           SizedBox(height: size.height * 0.03),
//           SvgPicture.asset(
//             "assets/icons/login.svg",
//             height: size.height * 0.35,
//           ),
//           SizedBox(height: size.height * 0.03),
//           RoundedInputField(
//             hintText: "البريد الإليكترونى",
//             onChanged: (value) {},
//           ),
//           RoundedPasswordField(
//             onChanged: (value) {},
//           ),
//           RoundedButton(
//             text: "دخــــول",
//             press: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()));
//             },
//           ),
//           SizedBox(height: size.height * 0.03),
//           AlreadyHaveAnAccountCheck(
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return SignUpScreen();
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
