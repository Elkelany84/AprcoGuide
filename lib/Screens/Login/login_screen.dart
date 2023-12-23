// import 'package:flutter/material.dart';
// // import 'package:todo_prog_world/auth/register.dart';
// // import 'package:todo_prog_world/todo/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:flutter_auth/Screens/homescreen.dart';
// import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
// import 'package:flutter_auth/Screens/Login/forgetpassword.dart';
// import 'package:flutter_auth/components/constants.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late String _email;
//   late String _password;
//   bool showSpinner = false;
//   bool _obscureText = true;

//   final _auth = FirebaseAuth.instance;
//   // final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
//   //     GlobalKey<ScaffoldMessengerState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // key: scaffoldMessengerKey,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'شــاشــة الدخــول',
//           style: kDrawerTextStyle.copyWith(color: Colors.white),
//         ),
//       ),
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(36.0),
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/svglogin.png',
//                 ),
//                 TextField(
//                   onChanged: (value) {
//                     _email = value;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Your Email',
//                     icon: Icon(Icons.email_outlined, color: Colors.purple),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 TextField(
//                   onChanged: (value) {
//                     _password = value;
//                   },
//                   obscureText: _obscureText,
//                   decoration: InputDecoration(
//                     hintText: 'Your Password',
//                     icon: Icon(Icons.lock_open, color: Colors.purple),
//                     suffixIcon: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _obscureText = !_obscureText;
//                         });
//                       },
//                       child: Icon(
//                         _obscureText ? Icons.visibility : Icons.visibility_off,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(primary: Colors.purple),
//                     child: Text('دخــول', style: TextStyle(fontSize: 22.0)),
//                     onPressed: () async {
//                       setState(() {
//                         // showSpinner = true;
//                       });
//                       try {
//                         final user = await _auth.signInWithEmailAndPassword(
//                             email: _email, password: _password);
//                         if (user != null) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomeScreen()));
//                         }
//                         setState(() {
//                           showSpinner = false;
//                         });
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             backgroundColor: Colors.purple,
//                             content: Text('اسم مستخدم أو كلمة سر خاطئة',
//                                 textAlign: TextAlign.end,
//                                 style: kReusableTextStyle.copyWith(
//                                     fontSize: 20.0))));
//                       }
//                       // on FirebaseAuthException catch (e) {
//                       //   if (e.code ==
//                       //       'There is no user record corresponding to this identifier. The user may have been deleted.') {
//                       //          ScaffoldMessenger.of(context).showSnackBar(
//                       //         SnackBar(content: Text('invalid username')));
//                       //     // scaffoldMessengerKey.currentState.showSnackBar(
//                       //     //     SnackBar(content: Text('invalid username')));
//                       //     print(e);
//                       //   }
//                       //   if (e.code ==
//                       //       'The password is invalid or the user does not have a password.') {
//                       //     ScaffoldMessenger.of(context).showSnackBar(
//                       //         SnackBar(content: Text('invalid password')));
//                       //         print(e);
//                       //   }
//                       // }
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35.0,
//                 ),
//                 Row(
//                   children: [
//                     Text('Forget Password'),
//                     TextButton(
//                       child:
//                           Text('إعادة تعيين كلمة المرور', style: kCardSubtitleTextStyle),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ForgetPass()));
//                       },
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text('Don\'t have Account'),
//                     TextButton(
//                       child: Text('تسجيــل', style: kCardTextStyle),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegisterScreen()));
//                       },
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_auth/Screens/Login/components/body.dart';

// // class LoginScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Body(),
// //     );
// //   }
// // }
