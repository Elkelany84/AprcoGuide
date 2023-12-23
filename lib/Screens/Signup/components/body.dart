// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:flutter_auth/Screens/Signup/components/background.dart';
// //import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
// import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
// import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
// import 'package:flutter_auth/components/rounded_button.dart';
// import 'package:flutter_auth/components/rounded_input_field.dart';
// import 'package:flutter_auth/components/rounded_password_field.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_auth/Screens/homescreen.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   String _email;
//   String _password;
//   bool showSpinner = false;
//   String name;
//   String image;
//   // String url =
//   //     'https://graph.facebook.com/v2.12/me?fields=first_name,picture,email&access_token=${accessToken.token}';
//   static final FacebookLogin facebookSignIn = new FacebookLogin();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Background(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 "تسجيـــل",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
//               ),
//               SizedBox(height: size.height * 0.03),
//               SvgPicture.asset(
//                 "assets/icons/signup.svg",
//                 height: size.height * 0.35,
//               ),
//               RoundedInputField(
//                 hintText: "البريد الإليكترونى",
//                 onChanged: (value) {
//                   _email = value;
//                 },
//               ),
//               RoundedPasswordField(
//                 onChanged: (value) {
//                   _password = value;
//                 },
//               ),
//               RoundedButton(
//                 text: "تسجيـــل",
//                 press: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   try {
//                     final user = await FirebaseAuth.instance
//                         .createUserWithEmailAndPassword(
//                             email: _email, password: _password);
//                     if (user != null) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => HomeScreen()));
//                     }
//                     setState(() {
//                       showSpinner = false;
//                     });
//                   } catch (e) {
//                     print(e);
//                   }
// //                   setState(() {
// //                     showSpinner = true;
// //                   });
// //                   try{
// //  FirebaseAuth.instance
// //                         .createUserWithEmailAndPassword(
// //                             email: _email, password: _password);
// //                   }
// //                   if (_email != null && _password != null) {
// //                    Navigator.push(context,
// //                                 MaterialPageRoute(builder: (context) {
// //                               return HomeScreen();
// //                             }));
// //                   }
// //                   setState(() {
// //                     showSpinner = false;
// //                   });
//                 },
//               ),
//               SizedBox(height: size.height * 0.03),
//               AlreadyHaveAnAccountCheck(
//                 login: false,
//                 press: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return LoginScreen();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               //OrDivider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SocalIcon(
//                     iconSrc: "assets/icons/facebook.svg",
//                     press: () async {
//                       final FacebookLoginResult result =
//                           await facebookSignIn.logIn(['email']);

//                       switch (result.status) {
//                         case FacebookLoginStatus.loggedIn:
//                           final FacebookAccessToken accessToken =
//                               result.accessToken;
//                           String url =
//                               'https://graph.facebook.com/v10.0/me?fields=first_name,picture,email&access_token=${accessToken.token}';
//                           final graphResponse = await http.get(Uri.parse(url));
//                               // 'https://graph.facebook.com/v2.12/me?fields=first_name,picture,email&access_token=${accessToken.token}');
//                           final profile = jsonDecode(graphResponse.body);
//                           print(profile);
//                           setState(() {
//                             name = profile['first_name'];
//                             image = profile['picture']['data']['url'];
//                           });
//                           print('''
//          Logged in!
         
//          Token: ${accessToken.token}
//          User id: ${accessToken.userId}
//          Expires: ${accessToken.expires}
//          Permissions: ${accessToken.permissions}
//          Declined permissions: ${accessToken.declinedPermissions}
//          ''');
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomeScreen()));
//                           break;
//                         case FacebookLoginStatus.cancelledByUser:
//                           print('Login cancelled by the user.');
//                           break;
//                         case FacebookLoginStatus.error:
//                           print('Something went wrong with the login process.\n'
//                               'Here\'s the error Facebook gave us: ${result.errorMessage}');
//                           break;
//                       }
//                     },
//                   ),
//                   Text(
//                     'تسجيل حساب بإستخدام الفيسبوك',
//                     style: TextStyle(color: kPrimaryColor, fontSize: 18.0),
//                   ),

//                   // SocalIcon(
//                   //   iconSrc: "assets/icons/twitter.svg",
//                   //   press: () {},
//                   // ),
//                   // SocalIcon(
//                   //   iconSrc: "assets/icons/google-plus.svg",
//                   //   press: () {},
//                   // ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
