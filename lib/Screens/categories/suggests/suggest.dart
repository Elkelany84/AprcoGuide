import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/homescreen.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';

String? type;
String? name;
String? address;
String? region;

class Suggest extends StatelessWidget {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'أضف جهة طبية',
          style: kReusableTextStyle,
        ),
      ),
      drawer: drawer(context),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  'برجاء إدخال بيانـات الجهــة الطبيــة التعاقديـــة التى تعاملت معها مؤخرا ولم تجدها فى التطبيق وترغب فى إضافتها.',
                  style: kCardSubtitleTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'نـوع الجهـــة',
                    style: kCardSubtitleTextStyle,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _typeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'صيدلية..مستشفى..معمل تحاليل'),
                      style: TextStyle(
                          fontSize: 20.0, height: 1.0, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'إسـم الجهـة',
                    style: kCardSubtitleTextStyle,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'أدخل إسم الجهة المقترحة'),
                      style: TextStyle(
                          fontSize: 20.0, height: 1.0, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'عنوان الجهة',
                    style: kCardSubtitleTextStyle,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'أدخل عنوان الجهة المقترحة'),
                      style: TextStyle(
                          fontSize: 20.0, height: 1.0, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'المنـطـقـــــة',
                    style: kCardSubtitleTextStyle,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _regionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ميامى...فيكتوريا...البيطاش'),
                      style: TextStyle(
                          fontSize: 20.0, height: 1.0, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    child: Text('اضغـط للإضافـة',
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('suggestions')
                          .doc()
                          .set({
                        'type': _typeController.text,
                        'name': _nameController.text,
                        'address': _addressController.text,
                        'region': _regionController.text,
                        'date': DateTime.now()
                      });
                      showAlertDialog(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "موافق",
        style: kCardTextStyle,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text(
      //   "جهة مقترحة",
      //   textAlign: TextAlign.end,
      //   style: kCardTextStyle,
      // ),
      content: Text(
        "ستتم الإضافة بعد التأكد من وجودها داخل التعاقد ، خالص الشكر",
        style: kCardSubtitleTextStyle,
        textDirection: TextDirection.rtl,
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
