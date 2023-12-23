// import 'package:flutter/material.dart';
// // import 'package:todo_prog_world/auth/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:todo_prog_world/todo/home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:flutter_auth/Screens/homescreen.dart';
// import 'package:flutter_auth/components/constants.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmControler = TextEditingController();
//   TextEditingController _nameControler = TextEditingController();

//   String? _error;
//   var _key = GlobalKey<FormState>();
//   bool _isLoading = false;
//   bool _obscureText = true;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmControler.dispose();
//     _nameControler.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'إنشـاء حسـاب جـديد',
//           style: kDrawerTextStyle.copyWith(color: Colors.white),
//         ),
//       ),
//       body: _isLoading ? _loading(context) : _form(context),
//     );
//   }

//   Widget _form(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(34.0),
//         child: Form(
//           autovalidateMode: AutovalidateMode.disabled,
//           key: _key,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset(
//                 'assets/images/svgsignup.png',
//                 height: 170.0,
//                 width: 300.0,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Email is Required';
//                   } else if (!value.contains('aprco.com.eg')) {
//                     return 'Please Enter Your Company\'s Email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 16.0,
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: _obscureText,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   suffixIcon: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                     child: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off,
//                     ),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Password is Required';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 16.0,
//               ),
//               TextFormField(
//                 controller: _confirmControler,
//                 obscureText: _obscureText,
//                 decoration: InputDecoration(
//                   hintText: 'Confirm Password',
//                   suffixIcon: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                     child: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off,
//                     ),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Confirm Password';
//                   if (value != _passwordController.text)
//                     return 'Password Not Match';
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 16.0,
//               ),
//               TextFormField(
//                 controller: _nameControler,
//                 decoration: InputDecoration(hintText: 'PhoneNumber'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Mobile is Required';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 28.0,
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 45.0,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Colors.purple),
//                   onPressed: _onRegisterClick,
//                   child: Text(
//                     'تسجيــل',
//                     style: TextStyle(fontSize: 22.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               _errorMessage(context),
//               Row(
//                 children: [
//                   Text('Have an Account ?'),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       },
//                       child: Text(
//                         'دخــول',
//                         style: kCardTextStyle,
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _loading(BuildContext context) {
//     return Container(
//       child: CircularProgressIndicator(),
//     );
//   }

//   void _onRegisterClick() async {
//     if (!_key.currentState!.validate()) {
//       setState(() {});
//     } else {
//       setState(() {
//         _isLoading = true;
//       });

//       FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _emailController.text, password: _passwordController.text)
//           .then((authResult) {
//         FirebaseFirestore.instance
//             .collection('profiles')
//             .doc(_emailController.text)
//             .set({
//           'email': _emailController.text,
//           'phone': _nameControler.text,
//           'name': '',
//           'user_id': authResult.user!.uid,
//           'password': _passwordController.text
//         }).then((_) => Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => HomeScreen())));
//       }).catchError((onError) {
//         setState(() {
//           _isLoading = false;
//           _error = 'Registeration Failed';
//         });
//       });
//     }
//   }

//   Widget _errorMessage(BuildContext context) {
//     if (_error == null) {
//       return Container();
//     } else {
//       return Container(
//         child: Text(
//           _error!,
//           style: TextStyle(color: Colors.red),
//         ),
//       );
//     }
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_auth/Screens/Signup/components/body.dart';

// // class SignUpScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Body(),
// //     );
// //   }
// // }
