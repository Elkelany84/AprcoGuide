import 'package:flutter/material.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.pharName});
  final String? pharName;

  // var rev = 1;
  // void _increment() {
  //   rev++;
  //   print(rev);
  // }
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print(pharsname);
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              'أضف تقييمك الشخصى :',
              style: kAddTaskTextStyle.copyWith(color: Colors.purple),
              textAlign: TextAlign.start,
            ),
            TextField(
              controller: _textController,
              autofocus: true,
              // textDirection: TextDirection.rtl,
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                child: Text(
                  'أضـــف',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  final f = DateFormat(' dd-MM-yyyy', 'ar');

                  await FirebaseFirestore.instance
                      .collection('pharreviews')
                      .doc(
                          '$pharName ${f.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().toUtc().millisecondsSinceEpoch))}')
                      .set({
                        'name': '$pharName',
                        'rev': _textController.text,
                        'date': DateTime.now().toUtc().millisecondsSinceEpoch,
                        'val':
                            '$pharName ${f.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().toUtc().millisecondsSinceEpoch))}',
                        'status': false
                      })
                      .then((value) => Navigator.pop(context))
                      .then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.purple,
                              content: Text(
                                  'سيتم إضافة تقييمك فى أسرع وقت ، خالص الشكر',
                                  textAlign: TextAlign.start,
                                  style: kReusableTextStyle.copyWith(
                                      fontSize: 20.0)))));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_auth/components/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// // TextEditingController _textController = TextEditingController();

// class AddTaskScreen extends StatelessWidget {
//   //AddTaskScreen({this.pharsname});
//   // final String pharsname;

//   // var rev = 1;
//   // void _increment() {
//   //   rev++;
//   //   print(rev);
//   // }
//   @override
//   Widget build(BuildContext context) {
//     // print(pharsname);
//     return SingleChildScrollView(
//       child: Container(
//         color: Color(0xff552E5C),
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           decoration: BoxDecoration(
//             color: Colors.purple[300],
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.0),
//               topRight: Radius.circular(20.0),
//             ),
//           ),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//             Row(
//               children: [
//                 Text(
//                   'pharsname',
//                   style: kReusableTextStyle.copyWith(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'تقييمك الشخصى',
//                   style: kReusableTextStyle.copyWith(color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//             TextField(
//               //controller: _textController,
//               autofocus: true,
//               textDirection: TextDirection.rtl,
//             ),
//             TextButton(
//               child: Text(
//                 'أضـــف',
//                 style: kCardTextStyle.copyWith(color: Colors.white),
//               ),
//               onPressed: () {
//                 // FirebaseFirestore.instance
//                 //     .collection('pharreviews/review/$pharname')
//                 //     .doc()
//                 //     .set({
//                 //   'rev': _textController.text,
//                 //   'date': DateTime.now()
//                 // }).then((value) => Navigator.pop(context));
//               },
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
