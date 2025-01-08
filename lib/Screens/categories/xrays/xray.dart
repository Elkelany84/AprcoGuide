import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Screens/categories/pharmacies/regions.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Xrays extends StatefulWidget {
  @override
  _XraysState createState() => _XraysState();
}

class _XraysState extends State<Xrays> {
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
                  'مراكـز الأشعــة',
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
        body: Container(child: _content(context)));
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
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
                  .collection('allMedical')
                  .where(
                    'region',
                    isEqualTo: selectedRegion,
                  )
                  .where('type', isEqualTo: 'مركز أشعة')
                  .snapshots(),
            ),
          ),
          // Advalue(),
        ],
      ),
    );
  }

  Widget _error(BuildContext context, String message) {
    return Center(
        child: Text(
      message,
      style: TextStyle(color: Colors.red),
    ));
  }

  Widget _drawScreen(BuildContext context, QuerySnapshot data) {
    Future<void> _launched;
    // var _phone = '01066932261';
    return Column(
      children: [
        Flexible(flex: 1, child: androidDropdown()),
        Flexible(
          flex: 6,
          child: ListView.builder(
              itemCount: data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return
                    //   Card(
                    //   color: Colors.white,
                    //   child: ExpansionTile(
                    //       trailing: data.docs[index]['tel1'] != null
                    //           ? IconButton(
                    //               icon: Icon(
                    //                 Icons.call,
                    //                 color: Colors.purple[900],
                    //               ),
                    //               onPressed: () async {
                    //                 var _phone = data.docs[index]['tel1'];
                    //                 final Uri url =
                    //                     Uri(scheme: "tel", path: _phone);
                    //                 await launchUrl(url);
                    //               },
                    //             )
                    //           : null,
                    //       title: Text(data.docs[index]['finalName'],
                    //           style: kCardTextStyle, textAlign: TextAlign.start),
                    //       subtitle: Text(
                    //         data.docs[index]['address'],
                    //         style: kCardSubtitleTextStyle,
                    //         textAlign: TextAlign.start,
                    //       ),
                    //       initiallyExpanded: false,
                    //       children: [
                    //         ListTile(
                    //           title: Row(
                    //             children: [
                    //               TextButton(
                    //                 child: Text('أكتب أو شاهد التقييمات',
                    //                     style: kCardSubtitleTextStyle,
                    //                     textAlign: TextAlign.start),
                    //                 onPressed: () {
                    //                   Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                       builder: (context) => NewToDo(
                    //                         xrayName: data.docs[index]['finalName'],
                    //                       ),
                    //                     ),
                    //                   );
                    //                 },
                    //               ),
                    //             ],
                    //           ),
                    //           leading: IconButton(
                    //             icon: Icon(
                    //               Icons.rate_review,
                    //               color: Colors.orange[900],
                    //             ),
                    //             onPressed: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) => NewToDo(
                    //                     xrayName: data.docs[index]['finalName'],
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //           ),
                    //           trailing: IconButton(
                    //             onPressed: () {
                    //               // print(data.docs[index]['name'] +   ' والعنوان هو ' + data.docs[index]['address']+' ورقم التليفون '+ data.docs[index]['tel1'] );
                    //               Share.share(
                    //                 (data.docs[index]['finalName'] +
                    //                     ' والعنوان هو ' +
                    //                     data.docs[index]['address'] +
                    //                     ' ورقم التليفون ' +
                    //                     data.docs[index]['tel1']),
                    //               );
                    //             },
                    //             icon: FaIcon(
                    //               FontAwesomeIcons.shareNodes,
                    //               color: Colors.orange[900],
                    //             ),
                    //           ),
                    //         ),
                    //       ]),
                    // );
                    Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(data.docs[index]['finalName'],
                                style: kCardTextStyle.copyWith(fontSize: 16)),
                          ),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.call,
                          //     color: Colors.purple[900],
                          //   ),
                          //   onPressed: () async {
                          //     var _phone = data.docs[index]['tel1'];
                          //     final Uri url = Uri(scheme: "tel", path: _phone);
                          //     await launchUrl(url);
                          //   },
                          // ),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.my_location,
                          //     color: Colors.purple[900],
                          //   ),
                          //   onPressed: () {
                          //     _openInGoogleMaps(data.docs[index]['finalName'] +
                          //         data.docs[index]['address']);
                          //   },
                          // ),
                          // IconButton(
                          //   onPressed: () {
                          //     // print(data.docs[index]['name'] +   ' والعنوان هو ' + data.docs[index]['address']+' ورقم التليفون '+ data.docs[index]['tel1'] );
                          //     Share.share(
                          //       (data.docs[index]['finalName'] +
                          //           ' والعنوان هو ' +
                          //           data.docs[index]['address'] +
                          //           ' ورقم التليفون ' +
                          //           data.docs[index]['tel1']),
                          //     );
                          //   },
                          //   icon: FaIcon(
                          //     FontAwesomeIcons.shareNodes,
                          //     color: Colors.orange[900],
                          //   ),
                          // ),
                        ],
                      ),
                      subtitle: Text(
                        data.docs[index]['address'],
                        style: kCardSubtitleTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.call,
                            color: Colors.purple[900],
                          ),
                          onPressed: () async {
                            var _phone = data.docs[index]['tel1'];
                            final Uri url = Uri(scheme: "tel", path: _phone);
                            await launchUrl(url);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.my_location,
                            color: Colors.purple[900],
                          ),
                          onPressed: () {
                            _openInGoogleMaps(data.docs[index]['finalName'] +
                                " " +
                                data.docs[index]['address']);
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            // print(data.docs[index]['name'] +   ' والعنوان هو ' + data.docs[index]['address']+' ورقم التليفون '+ data.docs[index]['tel1'] );
                            Share.share(
                              (data.docs[index]['finalName'] +
                                  ' والعنوان هو ' +
                                  data.docs[index]['address'] +
                                  ' ورقم التليفون ' +
                                  data.docs[index]['tel1']),
                            );
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.shareNodes,
                            color: Colors.orange[900],
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1.0),
                  ],
                );
              }),
        ),
      ],
    );
  }

  // setData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('checkval', true);
  //   print('loading');
  // }

  String? selectedRegion = 'اختر المنطقة';
  void _openInGoogleMaps(String address) async {
    final url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$address');
    await launchUrl(url);
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in pharmRegion) {
      var newItem = DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              currency,
              style: kCardTextStyle,
              // TextStyle(
              //     color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedRegion,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedRegion = value;
          print(selectedRegion);
          // getData();
        });
      },
    );
  }
}

//  return Card(
//               color: Colors.white,
//               child: ExpansionTile(
//                   trailing: IconButton(
//                     icon: Icon(
//                       Icons.call,
//                       color: Colors.purple[900],
//                     ),
//                     onPressed: () {
//                       var _phone = data.docs[index]['tel1'];
//                       setState(() {
//                         Future<void> _makePhoneCall(String url) async {
//                           if (await canLaunch(url)) {
//                             await launch(url);
//                           } else {
//                             throw 'Could not launch $url';
//                           }
//                         }

//                         _launched = _makePhoneCall('tel:$_phone');
//                       });
//                     },
//                   ),
//                   title: Text(data.docs[index]['name'],
//                       style: kCardTextStyle, textAlign: TextAlign.start),
//                   subtitle: Text(
//                     data.docs[index]['address'],
//                     style: kCardSubtitleTextStyle,
//                     textAlign: TextAlign.start,
//                   ),
//                   initiallyExpanded: false,
//                   children: [
//                     ListTile(
//                       title: Text('أكتب أو شاهد التقييمات',
//                           style: kCardSubtitleTextStyle,
//                           textAlign: TextAlign.start),
//                       leading: IconButton(
//                         icon: Icon(
//                           Icons.rate_review,
//                           color: Colors.orange[900],
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => NewToDo(
//                                 xrayname: data.docs[index]['name'],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ]),
//             );

// import 'package:flutter/material.dart';
// import 'package:flutter_auth/components/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_auth/Screens/categories/pharmacies/regions.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_auth/Screens/categories/xrays/xrayreviews.dart';
// import 'package:flutter_auth/components/drawer.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:flutter_auth/components/ad_helper.dart';

// class Xrays extends StatefulWidget {
//   @override
//   _XraysState createState() => _XraysState();
// }

// class _XraysState extends State<Xrays> {
//   BannerAd _ad;
//   bool isLoaded;
//   bool checkval = false;

//   @override
//   void initState() {
//     super.initState();

//     // setData();
//     // _content(context);
//     _ad = BannerAd(
//       adUnitId: AdHelper.bannerAdUnitId,
//       request: AdRequest(),
//       size: AdSize.banner,
//       listener: AdListener(onAdLoaded: (_) {
//         // isLoaded = true;
//         setState(() {
//           isLoaded = true;
//         });
//       }, onAdFailedToLoad: (_, error) {
//         print('Ad failed to load with error: $error');
//       }),
//     );
//     _ad.load();
//   }

//   @override
//   void dispose() {
//     _ad?.dispose();
//     super.dispose();
//   }

//   Widget checkForAd() {
//     if (isLoaded == true) {
//       return Container(
//         child: AdWidget(ad: _ad),
//         width: _ad.size.width.toDouble(),
//         height: _ad.size.height.toDouble(),
//         alignment: Alignment.center,
//       );
//     } else {
//       return CircularProgressIndicator();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: drawer(context),
//         appBar: AppBar(
//           backgroundColor: Colors.purple,
//           centerTitle: true,
//           title: FittedBox(
//             fit: BoxFit.contain,
//             child: Row(
//               children: [
//                 Text(
//                   'مراكـز الأشعــة',
//                   style: kReusableTextStyle,
//                 ),
//                 // SizedBox(width:10.0),Container(width: 40.0,color: Colors.white, child: androidDropdown()),
//               ],
//             ),
//           ),
//           // leading:
//           //   Row(
//           //     children: [SizedBox(width:5),
//           //       Container(width: 40.0,color: Colors.white, child: androidDropdown()),
//           //     ],
//           //   ),
//         ),
//         body: Container(child: _content(context)));
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
//                   .collection('xrays')
//                   .where(
//                     'region',
//                     isEqualTo: selectedRegion,
//                   )
//                   .snapshots(),
//             ),
//           ),
//           checkForAd(),
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
//     // var _phone = '01066932261';
//     return Column(
//       children: [
//         Flexible(flex: 1, child: androidDropdown()),
//         Flexible(
//           flex: 5,
//           child: ListView.builder(
//               itemCount: data.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//             return Card(
//                   child: ListTile(
//                     // isThreeLine: true,
//                      trailing: data.docs[index]['tel1'] != null ? IconButton(
//                       icon: Icon(Icons.call,
//                           color:Colors.purpleAccent
//                              ),
//                       onPressed: () {
//                         var _phone = data.docs[index]['tel1'];
//                         setState(() {
//                           Future<void> _makePhoneCall(String url) async {
//                             if (await canLaunch(url)) {
//                               await launch(url);
//                             } else {
//                               throw 'Could not launch $url';
//                             }
//                           }

//                           _launched = _makePhoneCall('tel:$_phone');
//                         });
//                       },
//                     ) : null,
//                     title: Text(data.docs[index]['name'],
//                         style: kCardTextStyle, textAlign: TextAlign.start),
//                     subtitle: Text(
//                       data.docs[index]['address'],
//                       style: kCardSubtitleTextStyle,
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }

//   // setData() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   prefs.setBool('checkval', true);
//   //   print('loading');
//   // }

//   String selectedRegion = 'اختر المنطقة';

//   DropdownButton<String> androidDropdown() {
//     List<DropdownMenuItem<String>> dropdownItems = [];
//     for (String currency in pharmRegion) {
//       var newItem = DropdownMenuItem(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               currency,
//               style: kCardTextStyle,
//               // TextStyle(
//               //     color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
//               textAlign: TextAlign.center,
//               textDirection: TextDirection.rtl,
//             ),
//           ],
//         ),
//         value: currency,
//       );
//       dropdownItems.add(newItem);
//     }

//     return DropdownButton<String>(
//       value: selectedRegion,
//       items: dropdownItems,
//       onChanged: (value) {
//         setState(() {
//           selectedRegion = value;
//           print(selectedRegion);
//           // getData();
//         });
//       },
//     );
//   }

// }
