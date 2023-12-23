//exact search by name

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/drawer.dart';

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";
  final _firestore = FirebaseFirestore.instance;

  void getMessages() async {
    List testing = [];
    final messages = await _firestore.collection('hospitals').get();
    for (var message in messages.docs) {
      // print(message.data());
      testing.add(message.data());
      print(testing);
      _firestore.collection('tam').add(testing.last);
      // _firestore.collection('uuu').doc().set(testing.last);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Navigator.of(context).pop();
            getMessages();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
                .collection('hospitals')
                .where("name", isEqualTo:name)
                .snapshots()
            : FirebaseFirestore.instance.collection("hospitals").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/components/drawer.dart';
// import 'package:flutter_auth/screens/categories/search/searchservice.dart';
// import 'package:flutter_auth/components/constants.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => new _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   var queryResultSet = [];
//   var tempSearchStore = [];

//   initiateSearch(value) {
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }

//     var capitalizedValue =
//         value.substring(0, 1).toUpperCase() + value.substring(1);

//     if (queryResultSet.length == 0 && value.length == 1) {
//       SearchService().searchByName(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.docs.length; ++i) {
//           queryResultSet.add(docs.docs[i].data());
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['name'].startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         drawer: drawer(context),
//         appBar: AppBar(
//           backgroundColor: Colors.purple,
//           centerTitle: true,
//           title: Text(
//             'البحـــــــــــث',
//             style: kReusableTextStyle,
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: TextField(
//                   textDirection: TextDirection.rtl,
//                   onChanged: (val) {
//                     initiateSearch(val);
//                   },
//                   decoration: InputDecoration(
//                       contentPadding: EdgeInsets.only(left: 25.0),
//                       hintText: '  البحث عن جهة طبية...',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(4.0))),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               GridView.count(
//                   padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                   crossAxisCount: 2,
//                   // crossAxisSpacing: 1.0,
//                   mainAxisSpacing: 1.0,
//                   primary: false,
//                   shrinkWrap: true,
//                   children: tempSearchStore.map((element) {
//                     return buildResultCard(element);
//                   }).toList()),
//             ],
//           ),
//         ));
//   }

//   Widget buildResultCard(data) {
//     Future<void> _launched;
//     return ListView(children: [
//       Card(
//         color: Colors.white, elevation: 2.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         // elevation: 2.0,
//         child: ListTile(
//           trailing: data['tel1'] != null
//               ? IconButton(
//                   icon: Icon(
//                     Icons.call,
//                     color: Colors.purple[900],
//                   ),
//                   onPressed: () {
//                     var _phone = data['tel1'];
//                     setState(() {
//                       Future<void> _makePhoneCall(String url) async {
//                         if (await canLaunch(url)) {
//                           await launch(url);
//                         } else {
//                           throw 'Could not launch $url';
//                         }
//                       }

//                       _launched = _makePhoneCall('tel:$_phone');
//                     });
//                   },
//                 )
//               : null,
//           title: Text(data['name'],
//               style: kCardTextStyle, textAlign: TextAlign.start),
//           subtitle: Text(
//             data['address'],
//             style: kCardSubtitleTextStyle,
//             textAlign: TextAlign.start,
//           ),
//         ),
//       ),
//     ]);
//   }
// }

// Widget buildResultCard(data) {
//   return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       elevation: 2.0,
//       child: Container(
//           child: Center(
//               child: Text(
//         data['name'],
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20.0,
//         ),
//       ))));
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/screens/categories/search/searchservice.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => new _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   var queryResultSet = [];
//   var tempSearchStore = [];

//   initiateSearch(value) {
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }

//     var capitalizedValue =
//         value.substring(0, 1).toUpperCase() + value.substring(1);

//     if (queryResultSet.length == 0 && value.length == 1) {
//       SearchService().searchByName(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.docs.length; ++i) {
//           queryResultSet.add(docs.docs[i].data());
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['name'].startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: Card(child: TextField(
//             onChanged: (val) {
//               initiateSearch(val);
//             },
//             decoration: InputDecoration(
//                 prefixIcon: IconButton(
//                   color: Colors.black,
//                   icon: Icon(Icons.arrow_back),
//                   iconSize: 20.0,
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 contentPadding: EdgeInsets.only(left: 25.0),
//                 hintText: 'Search by name',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4.0))),
//           ),
// //           child: TextField(
// //             decoration: InputDecoration(
// //                 prefixIcon: Icon(Icons.search), hintText: 'Search...'),
// //             onChanged: (val) {
// //               setState(() {
// //                 name = val;
// //               });
// //             },
// //           ),
// //         ),
// //       ),,
//       ),),
//       body: SingleChildScrollView(
//         child: Column(children: <Widget>[
//           // Padding(
//           //   padding: const EdgeInsets.all(10.0),
//           //   child: TextField(
//           //     onChanged: (val) {
//           //       initiateSearch(val);
//           //     },
//           //     decoration: InputDecoration(
//           //         prefixIcon: IconButton(
//           //           color: Colors.black,
//           //           icon: Icon(Icons.arrow_back),
//           //           iconSize: 20.0,
//           //           onPressed: () {
//           //             Navigator.of(context).pop();
//           //           },
//           //         ),
//           //         contentPadding: EdgeInsets.only(left: 25.0),
//           //         hintText: 'Search by name',
//           //         border: OutlineInputBorder(
//           //             borderRadius: BorderRadius.circular(4.0))),
//           //   ),
//           // ),
//           SizedBox(height: 10.0),
//           GridView.count(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               crossAxisCount: 2,
//               crossAxisSpacing: 4.0,
//               mainAxisSpacing: 4.0,
//               primary: false,
//               shrinkWrap: true,
//               children: tempSearchStore.map((element) {
//                 return buildResultCard(element);
//               }).toList())
//         ]),
//       ),
//     );
//   }
// }

// Widget buildResultCard(data) {
//   return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       elevation: 2.0,
//       child: Container(
//           child: Center(
//               child: Text(
//         data['name'],
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20.0,
//         ),
//       ))));
// }
