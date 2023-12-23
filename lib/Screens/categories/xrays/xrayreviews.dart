import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/Screens/categories/xrays/add_task_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_auth/components/advalue.dart';

class NewToDo extends StatelessWidget {
  NewToDo({this.xrayName});
  final String? xrayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          elevation: 10.0,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(xrayName: xrayName),
                    ));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            xrayName!,
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
                  .collection('xrayreviews')
                  .where('name', isEqualTo: '$xrayName')
                  .where('status', isEqualTo: true)
                  .orderBy('date', descending: true)
                  .snapshots(),
            ),
          ),
          // Advalue(),
        ],
      ),
    );
  }
}

Widget _drawScreen(BuildContext context, QuerySnapshot data) {
  Future<void> _launched;

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
                      // trailing: IconButton(
                      //   icon: Icon(Icons.assignment_turned_in),
                      //   onPressed: () async {

                      //     await FirebaseFirestore.instance
                      //         .collection(
                      //             'xrayreviews') // suppose you have a collection named "Users"
                      //         .doc(data.docs[index]['val'])
                      //         .update({'status': true});

                      //     // .update({'status': true});
                      //   },
                      // ),
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
