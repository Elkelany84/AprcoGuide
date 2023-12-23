// import 'package:flutter/material.dart';
// import 'package:flutter_auth/components/advalue.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:photo_view/photo_view.dart';

// class News extends StatefulWidget {
//   const News({Key key}) : super(key: key);

//   @override
//   _NewsState createState() => _NewsState();
// }

// class _NewsState extends State<News> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _content(context),
//     );
//   }

//   Widget _content(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Flexible(
//             child: StreamBuilder(
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.none:
//                     return _error(context, 'No Connection is Made');
//                     break;
//                   case ConnectionState.waiting:
//                     return Center(child: CircularProgressIndicator());
//                     break;
//                   case ConnectionState.active:
//                   case ConnectionState.done:
//                     if (snapshot.hasError) {
//                       _error(context, snapshot.error.toString());
//                     }
//                     if (!snapshot.hasData) {
//                       return _error(context, 'No Data');
//                     }
//                     break;
//                 }
//                 return _drawScreen(context, snapshot.data);
//               },
//               stream: FirebaseFirestore.instance
//                   .collection('news')
//                   .orderBy('date', descending: true)
//                   .snapshots(),
//             ),
//           ),
//           Advalue(),
//         ],
//       ),
//     );
//   }

//   Widget _error(BuildContext context, String message) {
//     return Center(
//         child: Text(
//       message,
//       style: TextStyle(color: Colors.red),
//     ));
//   }

//   Widget _drawScreen(BuildContext context, QuerySnapshot data) {
//     Future<void> _launched;
//     return Column(
//       children: [
//         Flexible(
//           flex: 5,
//           child: ListView.builder(
//               itemCount: data.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: data.docs[index]['url'] != null
//                             ? Container(
//                                 child: InkWell(
//                                   onTap: () {
//                                     var url = data.docs[index]['url'];
//                                     setState(() {
//                                       _launchURL() async => await canLaunch(url)
//                                           ? await launch(url)
//                                           : throw 'Could not launch $url';
//                                       _launched = _launchURL();
//                                     });
//                                   },
//                                   child: ClipRRect(
//                                     child: Image.network(
//                                         data.docs[index]['image'],
//                                         fit: BoxFit.cover),
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xff7c94b6),
//                                   border: Border.all(
//                                     color: Colors.black,
//                                     width: 3,
//                                   ),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 // Container(
//                                 //   // height: double.infinity,
//                                 //   // width: double.infinity,
//                                 //   child: Image.network(data.docs[index]['image'],fit: BoxFit.cover),
//                                 // ),
//                               )
//                             : Container(
//                                 child: PhotoView(
//                                 imageProvider:
//                                     NetworkImage(data.docs[index]['image']),
//                               )),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
// }
