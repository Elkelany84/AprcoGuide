import 'package:flutter/material.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.deviceName});
  final String? deviceName;

  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      .collection('devicereviews')
                      .doc(
                          '$deviceName ${f.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().toUtc().millisecondsSinceEpoch))}')
                      .set({
                        'name': '$deviceName',
                        'rev': _textController.text,
                        'date': DateTime.now().toUtc().millisecondsSinceEpoch,
                        'val':
                            '$deviceName ${f.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().toUtc().millisecondsSinceEpoch))}',
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
