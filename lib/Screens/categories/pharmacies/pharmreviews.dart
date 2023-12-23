import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/components/constants.dart';
import 'dart:math';
import 'package:flutter_auth/Screens/categories/pharmacies/add_task_screen.dart';
// import 'package:flutter_auth/Screens/categories/pharmacies/test.dart';
import 'package:flutter_auth/components/advalue.dart';
import 'package:intl/intl.dart';

Random random = Random();
String rng = random.nextInt(3).toString();
int rane = 0;

class NewToDo extends StatelessWidget {
  NewToDo({this.pharName});
  final String? pharName;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            child: Icon(Icons.add),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Test(
              //       pharsname: pharname,
              //     ),
              //   ),
              // );
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(pharName: pharName),
                  ));
            }),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            pharName!,
            style: kReusableTextStyle,
          ),
        ),
        body: _content(context));
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(22.0),
      child: Column(
        children: [
          Flexible(
            child: StreamBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return _error(context, 'No Connection is Made');
                    break;
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      _error(context, snapshot.error.toString());
                    }
                    if (!snapshot.hasData) {
                      return _error(context, 'No Data');
                    }
                    break;
                }
                return _drawScreen(context, snapshot.data);
              },
              stream: FirebaseFirestore.instance
                  .collection('pharreviews')
                  .where('name', isEqualTo: '$pharName')
                  .where('status', isEqualTo: true)
                  .orderBy('date', descending: true)
                  .snapshots(),
              // stream: FirebaseFirestore.instance
              //     .collection(pharname)
              //     .orderBy('date', descending: true)
              //     .snapshots(),
              // stream: FirebaseFirestore.instance
              //     .collection('pharreviews')
              //     .where(
              //       'name',
              //       isEqualTo: pharname,
              //     )
              //     .snapshots(),
            ),
          ),
          // Advalue(),
        ],
      ),
    );
  }
}

Widget _drawScreen(BuildContext context, QuerySnapshot data) {
  //var ahmed;
  // var all = FirebaseFirestore.instance
  //     .collection('pharreviews/review/مجدى السويفى')
  //     .doc('أسامة الطيبى')
  //     .get()
  //     .then((value) => print(value));
  // print(all);
  // Future<void> _launched;
  // var _phone = '01066932261';
  return Column(
    children: [
      Flexible(
        flex: 5,
        child: ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final f = DateFormat(' dd-MM-yyyy', 'ar');
              var myValue = data.docs[index]['date'];
              var end = f.format(DateTime.fromMillisecondsSinceEpoch(myValue));
              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    child: ListTile(
                      title: Text(data.docs[index]['rev'],
                          style: kCardSubtitleTextStyle,
                          textAlign: TextAlign.start),
                      subtitle: Text(
                        '$end',
                        style: kCardSubtitleTextStyle,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    ],
  );
}

Widget _error(BuildContext context, String message) {
  return Center(
      child: Text(
    message,
    style: TextStyle(color: Colors.red),
  ));
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_auth/components/constants.dart';
// import 'dart:math';
// import 'package:flutter_auth/Screens/categories/pharmacies/add_task_screen.dart';
// import 'package:flutter_auth/Screens/categories/pharmacies/test.dart';

// Random random = Random();
// String rng = random.nextInt(3).toString();
// int rane = 0;

// class NewToDo extends StatelessWidget {
//   NewToDo({this.pharname});
//   final String pharname;

//   @override
//   Widget build(BuildContext context) {
//     String typeme = 'aaa';
//     typeme = pharname;
//     print(typeme);
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//             backgroundColor: Colors.purple,
//             child: Icon(Icons.add),
//             onPressed: () {
//               showModalBottomSheet(
//                       context: context, builder: (context) => Test())
//                   .then((value) => Test(
//                         pharsname: typeme,
//                       ));
//             }),
//         appBar: AppBar(
//           backgroundColor: Colors.purple,
//           title: Text(pharname),
//         ),
//         body: _content(context));
//   }

//   Widget _content(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(22.0),
//       child: StreamBuilder(
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               return _error(context, 'No Connection is Made');
//               break;
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//               break;
//             case ConnectionState.active:
//             case ConnectionState.done:
//               if (snapshot.hasError) {
//                 _error(context, snapshot.error.toString());
//               }
//               if (!snapshot.hasData) {
//                 return _error(context, 'No Data');
//               }
//               break;
//           }
//           return _drawScreen(context, snapshot.data);
//         },
//         stream: FirebaseFirestore.instance
//             .collection('pharreviews/review/$pharname')
//             .orderBy('date')
//             .snapshots(),
//         // stream: FirebaseFirestore.instance
//         //     .collection(pharname)
//         //     .orderBy('date', descending: true)
//         //     .snapshots(),
//         // stream: FirebaseFirestore.instance
//         //     .collection('pharreviews')
//         //     .where(
//         //       'name',
//         //       isEqualTo: pharname,
//         //     )
//         //     .snapshots(),
//       ),
//     );
//   }
// }

// Widget _drawScreen(BuildContext context, QuerySnapshot data) {
//   var ahmed;
//   var all = FirebaseFirestore.instance
//       .collection('pharreviews/review/مجدى السويفى')
//       .doc('أسامة الطيبى')
//       .get()
//       .then((value) => print(value));
//   print(all);
//   Future<void> _launched;
//   // var _phone = '01066932261';
//   return Column(
//     children: [
//       Flexible(
//         flex: 5,
//         child: ListView.builder(
//             itemCount: data.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Column(
//                 children: [
//                   Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     color: Colors.white,
//                     child: ListTile(
//                       title: Text(data.docs[index]['rev'],
//                           style: kCardSubtitleTextStyle,
//                           textAlign: TextAlign.end),
//                     ),
//                   ),
//                   // Card(
//                   //   color: Colors.white,
//                   //   child: ListTile(
//                   //     title: Text(data.docs[index]['rev'],
//                   //         style: kCardSubtitleTextStyle,
//                   //         textAlign: TextAlign.end),
//                   //   ),
//                   // ),
//                 ],
//               );
//             }),
//       ),
//     ],
//   );
// }

// Widget _error(BuildContext context, String message) {
//   return Center(
//       child: Text(
//     message,
//     style: TextStyle(color: Colors.red),
//   ));
// }
