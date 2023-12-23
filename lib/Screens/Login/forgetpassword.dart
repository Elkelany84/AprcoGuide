// import 'package:flutter/material.dart';
// import 'package:flutter_auth/components/constants.dart';
// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// final TextEditingController _mobileController = TextEditingController();
// final TextEditingController _emailController = TextEditingController();

// class ForgetPass extends StatelessWidget {
//   var _key = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         centerTitle: true,
//         title: Text(
//           'إعادة تعيين كلمة المرور',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Form(
//             autovalidateMode: AutovalidateMode.disabled,
//             key: _key,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             hintText: 'الإيميل الذى قمت بالتسجيل به'),
//                         style: TextStyle(
//                             fontSize: 20.0, height: 1.0, color: Colors.black),
//                         textAlign: TextAlign.end,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Email is Required';
//                           } else if (!value.contains('aprco.com.eg')) {
//                             return 'Please Enter Your Company\'s Email';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10.0,
//                     ),
//                     Text(
//                       'البريد الإليكترونى',
//                       style: kCardSubtitleTextStyle,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _mobileController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             hintText: 'الهاتف الذى قمت بالتسجيل به'),
//                         style: TextStyle(
//                             fontSize: 20.0, height: 1.0, color: Colors.black),
//                         textAlign: TextAlign.end,
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Mobile is Required';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: 18.0,
//                     ),
//                     Text(
//                       'الهاتـف المسجـل',
//                       style: kCardSubtitleTextStyle,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 50.0,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(primary: Colors.purple),
//                       child: Text('اضغـط للإرسـال',
//                           style: TextStyle(
//                               fontSize: 20.0, fontWeight: FontWeight.bold)),
//                       onPressed: () async {
//                         if (_key.currentState!.validate()) {
//                           await FirebaseFirestore.instance
//                               .collection('resetpassword')
//                               .doc()
//                               .set({
//                             'mobile': _mobileController.text,
//                             'email': _emailController.text,
//                             'date': DateTime.now()
//                           });
//                           showAlertDialog(context);
//                         } else {
//                           return null;
//                         }
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   showAlertDialog(BuildContext context) {
//     // set up the button
//     Widget okButton = TextButton(
//       child: Text(
//         "موافق",
//         style: kCardTextStyle,
//       ),
//       onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       },
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       // title: Text(
//       //   "إعادة تعيين كلمة السر",
//       //   textAlign: TextAlign.end,
//       //   style: kCardTextStyle,
//       // ),
//       content: Text(
//         "سيتم إرسال رسالة على البريد المذكور فى خلال 48 ساعة بعد التأكد من صحة البيانات ، خالص الشكر",
//         style: kCardSubtitleTextStyle,
//         textDirection: TextDirection.rtl,
//       ),
//       actions: [
//         okButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
