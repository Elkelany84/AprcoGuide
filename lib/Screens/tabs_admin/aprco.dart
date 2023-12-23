import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';

final _firestore = FirebaseFirestore.instance;

class AdminScreen extends StatefulWidget {
  static String screenRoute = 'aprco_screen';
  // const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkeyTamenat = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
   final TextEditingController _passwordTamenat = TextEditingController();
  String? userToken = '';
  getToken() async {
    final fbm = FirebaseMessaging.instance;
    String? token = await fbm.getToken();
    initState() {
      userToken = token;
    }
  }

  @override
  void initState() {
    super.initState();
    final fbm = FirebaseMessaging.instance;
    getToken();
    //  fbm.getToken();
    fbm.subscribeToTopic('aaamoney');
    //  fbm.subscribeToTopic('bbbmoney');
      fbm.subscribeToTopic('cccmoney');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Text(
                'الدليـــل الطبـــى',
                style: kReusableTextStyle,
              ),
              // SizedBox(width:10.0),Container(width: 40.0,color: Colors.white, child: androidDropdown()),
            ],
          ),
        ),
        // leading:
        //   Row(
        //     children: [SizedBox(width:5),
        //       Container(width: 40.0,color: Colors.white, child: androidDropdown()),
        //     ],
        //   ),
      ),
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    textAlign: TextAlign.left,
                    controller: _password,
                    validator: (value) {
                      // ignore: unrelated_type_equality_checks
                      if (value!.isNotEmpty && value == '20143946') {
                        return null;
                      } else {
                        return 'Wrong Or Empty Password...';
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              _password.clear();
                            },
                            icon: const Icon(Icons.clear)),
                        hintText: 'Enter Password To Send Notification...',
                        hintTextDirection: TextDirection.ltr
                        // icon: IconButton(
                        //   onPressed: () {
                        //     _password.clear();
                        //   },
                        //   icon: const Icon(Icons.clear),
                        // ),
                        ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 230,
                    height: 90,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        child: const Text(
                          'تصرفوهم فى الخير',
                          style: kReusableTextStyle,
                        ),
                        onPressed: () {
                          // final snackBarErr = SnackBar(
                          //   content: Text('برجاء التأكد من الرقم السرى'),
                          // );
                          if (!_formkey.currentState!.validate()) {
                            return;
                            // FocusManager.instance.primaryFocus?.unfocus();

                            // ScaffoldMessenger.of(context).showSnackBar(snackBarErr);
                          }
                          _firestore.collection('aaamoney').add({
                            'sender': '$userToken',
                            'title': 'تصرفوهم فى الخير',
                            'time': FieldValue.serverTimestamp()
                            // Scaffold.of(context).showSnackBar(Snackbar(content));
                          });
                          FocusManager.instance.primaryFocus?.unfocus();
                          const snackBar = SnackBar(
                            content: Text('تم الإرسال بنجاح'),
                            duration: Duration(seconds: 5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }),
                  )
                ],
              ),
            ),
          ),  
          SizedBox(height: 10,),  
          //خاص بالمعاش التكميلى
          Form(
            key: _formkeyTamenat,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    textAlign: TextAlign.left,
                    controller: _passwordTamenat,
                    validator: (value) {
                      // ignore: unrelated_type_equality_checks
                      if (value!.isNotEmpty && value == '35780000') {
                        return null;
                      } else {
                        return 'Wrong Or Empty Password...';
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              _passwordTamenat.clear();
                            },
                            icon: const Icon(Icons.clear)),
                        hintText: 'Enter Password To Send Notification...',
                        hintTextDirection: TextDirection.ltr
                        // icon: IconButton(
                        //   onPressed: () {
                        //     _password.clear();
                        //   },
                        //   icon: const Icon(Icons.clear),
                        // ),
                        ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 230,
                    height: 90,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        child: const Text(
                          'تم صرف المعاش',
                          style: kReusableTextStyle,
                        ),
                        onPressed: () {
                          // final snackBarErr = SnackBar(
                          //   content: Text('برجاء التأكد من الرقم السرى'),
                          // );
                          if (!_formkeyTamenat.currentState!.validate()) {
                            return;
                            // FocusManager.instance.primaryFocus?.unfocus();

                            // ScaffoldMessenger.of(context).showSnackBar(snackBarErr);
                          }
                          _firestore.collection('cccmoney').add({
                            'sender': '$userToken',
                            'title': 'تم صرف المعاش',
                            'time': FieldValue.serverTimestamp()
                            // Scaffold.of(context).showSnackBar(Snackbar(content));
                          });
                          FocusManager.instance.primaryFocus?.unfocus();
                          const snackBar = SnackBar(
                            content: Text('تم الإرسال بنجاح'),
                            duration: Duration(seconds: 5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
