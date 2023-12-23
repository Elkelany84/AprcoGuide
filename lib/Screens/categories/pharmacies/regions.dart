// import 'package:flutter/material.dart';

List<String> specials = [
  'اختر التخصص',
  'الأطفال',
  'الأورام',
  'الأوعية الدموية',
  'الباطنة - السكر والغدد الصماء',
  'الباطنة - الكبد',
  'الباطنة العامة',
  'الباطنة العامة - أمراض الدم',
  'التخاطب وصعوبات التعلم',
  'الجلدية و التناسلية',
  'السمع و الإتزان',
  'الصدر',
  'العظام',
  'العلاج الطبيعى',
  'العيون و الرمد',
  'القلب',
  'الكلى',
  'المسالك',
  'النساء',
  'النفسية و العصبية',
  'أنف وأذن وحنجرة',
  'جراحة الأطفال',
  'جراحة التجميل',
  'جراحة المخ و الأعصاب',
  'جراحة الوجه و الفك',
  'جراحة عامة',
];

List<String> contracts = [
  'اختر الجهة',
  'صيدلية',
  'مستشفى',
  'معمل تحاليل',
  'مركز أشعة',
];

List<String> pharmRegion = [
  'اختر المنطقة',
  'الإبراهيمية',
  'الأزاريطة',
  'البحيرة',
  'البيطاش',
  'الحضرة',
  'الحضرة الجديدة',
  'الدخيلة',
  'السيوف',
  'الشاطبى',
  'الشلالات',
  'العامرية',
  'العجمى',
  'العصافرة بحرى',
  'العصافرة قبلى',
  'العطارين',
  'العوايد',
  'القاهرة',
  'القبارى',
  'المعمورة',
  'المكس',
  'المنتزة',
  'المندرة',
  'المنشية',
  'الهانوفيل',
  'الورديان',
  'إيتاى البارود',
  'أبو سليمان',
  'أبو يوسف',
  'أبو قير',
  'أبيس',
  'أكتوبر',
  'باكوس',
  'بحرى',
  'برج العرب',
  'بولكلى',
  'ثروت',
  'جليم',
  'جناكليس',
  'دمنهور',
  'رشدى',
  'سابا باشا',
  'سان ستيفانو',
  'سبورتنج',
  'سموحة',
  'سيدى بشر بحرى',
  'سيدى بشر قبلى',
  'سيدى جابر',
  'شدس',
  'غيط العنب',
  'فلمنج',
  'فيكتوريا',
  'كامب شيزار',
  'كرموز',
  'كفر الدوار',
  'كفر عبده',
  'كليوباترا',
  'لوران',
  'محرم بك',
  'محطة الرمل',
  'مصطفى كامل',
  'ميامى',
];

// import 'package:flutter/material.dart';
// import 'package:flutter_auth/components/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_auth/Screens/categories/pharmacies/pharmregion.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_auth/Screens/categories/pharmacies/pharmreviews.dart';

// class Pharmacies extends StatefulWidget {
//   @override
//   _PharmaciesState createState() => _PharmaciesState();
// }

// class _PharmaciesState extends State<Pharmacies> {
//   @override
//   void initState() {
//     _content(context);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(scaffoldBackgroundColor: Colors.purple[300]),
//       home: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.purple,
//             centerTitle: true,
//             title: FittedBox(
//               fit: BoxFit.contain,
//               child: Row(
//                 children: [
//                   Text(
//                     'الصيدليـــات',
//                     style: kReusableTextStyle,
//                   ),
//                   // SizedBox(width:10.0),Container(width: 40.0,color: Colors.white, child: androidDropdown()),
//                 ],
//               ),
//             ),
//             // leading:
//             //   Row(
//             //     children: [SizedBox(width:5),
//             //       Container(width: 40.0,color: Colors.white, child: androidDropdown()),
//             //     ],
//             //   ),
//           ),
//           body: _content(context)),
//     );
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
//             .collection('pharmacies')
//             .where(
//               'region',
//               isEqualTo: selectedRegion,
//             )
//             .snapshots(),
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
//                 return Card(
//                   color: Colors.white,
//                   child: ExpansionTile(
//                       leading: IconButton(
//                         icon: Icon(Icons.call),
//                         onPressed: () {
//                           var _phone = data.docs[index]['tel1'];
//                           setState(() {
//                             Future<void> _makePhoneCall(String url) async {
//                               if (await canLaunch(url)) {
//                                 await launch(url);
//                               } else {
//                                 throw 'Could not launch $url';
//                               }
//                             }

//                             _launched = _makePhoneCall('tel:$_phone');
//                           });
//                         },
//                       ),
//                       title: Text(data.docs[index]['name'],
//                           style: kCardTextStyle, textAlign: TextAlign.end),
//                       subtitle: Text(
//                         data.docs[index]['address'],
//                         style: kCardSubtitleTextStyle,
//                         textAlign: TextAlign.end,
//                       ),
//                       initiallyExpanded: false,
//                       children: [
//                         ExpansionTile(title: Text('ratings'), children: [
//                           ListTile(
//                             // isThreeLine: true,
//                             // leading: IconButton(
//                             //   icon: Icon(Icons.call),
//                             //   onPressed: () {
//                             //     var _phone = data.docs[index]['tel1'];
//                             //     setState(() {
//                             //       Future<void> _makePhoneCall(String url) async {
//                             //         if (await canLaunch(url)) {
//                             //           await launch(url);
//                             //         } else {
//                             //           throw 'Could not launch $url';
//                             //         }
//                             //       }

//                             //       _launched = _makePhoneCall('tel:$_phone');
//                             //     });
//                             //   },
//                             // ),
//                             title: Text('أكتب أو شاهد التقييمات',
//                                 style: kCardSubtitleTextStyle,
//                                 textAlign: TextAlign.end),
//                             // title: Text(data.docs[index]['name'],
//                             //     style: kCardTextStyle, textAlign: TextAlign.end),
//                             // subtitle: Text(
//                             //   data.docs[index]['address'],
//                             //   style: kCardSubtitleTextStyle,
//                             //   textAlign: TextAlign.end,
//                             // ),
//                             trailing: IconButton(
//                               icon: Icon(Icons.info_outline),
//                               onPressed: () {
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => NewToDo(
//                                 //       pharname: data.docs[index]['name'],
//                                 //       pharaddr: data.docs[index]['address'],
//                                 //     ),
//                                 //   ),
//                                 // );
//                               },
//                             ),
//                           ),
//                         ]),
//                       ]),
//                 );
//               }),
//         ),
//       ],
//     );
//   }

//   String selectedRegion = 'اختر المنطقة';

//   DropdownButton<String> androidDropdown() {
//     List<DropdownMenuItem<String>> dropdownItems = [];
//     for (String currency in pharmRegion) {
//       var newItem = DropdownMenuItem(
//         child: Text(
//           currency,
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
//           textAlign: TextAlign.center,
//           textDirection: TextDirection.rtl,
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

// DropdownButton<String> pharRegion() {
//   List<DropdownMenuItem<String>> dropDownItems = [];
//   for (String region in pharmRegion) {
//     var newItem = DropdownMenuItem(
//       child: Text(region),
//       value: region,
//     );
//     dropDownItems.add(newItem);
//   }
//   }

// }
