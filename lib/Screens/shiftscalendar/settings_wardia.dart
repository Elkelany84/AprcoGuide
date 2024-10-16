// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/shiftscalendar/myWardia.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  DateTime selectedDate = DateTime.now();
  DateTime nightselectedDate = DateTime.now();
  DateTime dayselectedDate = DateTime.now();
  DateTime restselectedDate = DateTime.now();
  int? daytimestamp;
  int? nighttimestamp;
  int? resttimestamp;
  // late SharedPreferences prefs;
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    getStoredIntValue();

    Future.delayed(Duration(seconds: 2), () {
      getDayDateTime();
      getNightDateTime();
      getRestDateTime();

      setState(() {
        _isVisible = true;
      });
    });
  }

//store date in shared_preferences
  Future<void> initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('myDayTimestampKey', daytimestamp!);
    prefs.setInt('myNightTimestampKey', nighttimestamp!);
    prefs.setInt('myRestTimestampKey', resttimestamp!);
  }

//get int value from shared_preferences
  Future<void> getStoredIntValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    daytimestamp = prefs.getInt("myDayTimestampKey") ?? 100;
    nighttimestamp = prefs.getInt("myNightTimestampKey") ?? 200;
    resttimestamp = prefs.getInt("myRestTimestampKey") ?? 300;

    // print("stored" + daytimestamp.toString());
    // print(nighttimestamp);
    // print(resttimestamp);
  }

  // Future<void> getDayDateTime() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   if (daytimestamp == null) {
  //     DateTime dateTime = DateTime.now();
  //     dayselectedDate = dateTime;

  //     // print(dateTime);
  //     // return dateTime;
  //   } else {
  //     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(daytimestamp!);
  //     dayselectedDate = dateTime;
  //     print(dayselectedDate);

  //     // return dateTime;
  //   }
  // }
  DateTime getDayDateTime() {
    if (daytimestamp == null) {
      DateTime dateTime = DateTime.now();
      return dateTime;
    } else {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(daytimestamp!);
      dayselectedDate = dateTime;
      // print(dateTime);

      return dateTime;
    }
  }

  DateTime getRestDateTime() {
    if (resttimestamp == null) {
      DateTime dateTime = DateTime.now();
      return dateTime;
    } else {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(resttimestamp!);
      restselectedDate = dateTime;
      // print(dateTime);

      return dateTime;
    }
  }

  DateTime getNightDateTime() {
    if (nighttimestamp == null) {
      DateTime dateTime = DateTime.now();
      // print("night" + dateTime.toString());
      return dateTime;
    } else {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(nighttimestamp!);
      nightselectedDate = dateTime;
      // print(dateTime);

      return dateTime;
    }
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
                'إعدادات الوردية',
                style: kReusableTextStyle,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("اضغط لاختيار أول يوم لوردية النهار : ",
                      style: kReusableTextStyle.copyWith(
                          fontSize: 14, color: Colors.black)),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2025));
                      if (newDate == null) return;
                      int timestamp = newDate.millisecondsSinceEpoch;

                      DateTime dateTime =
                          DateTime.fromMillisecondsSinceEpoch(timestamp);

                      setState(() {
                        dayselectedDate = dateTime;
                        daytimestamp = timestamp;
                        getDayDateTime();
                        // daytimestamp = daytimestamp! + 86400000;
                      });
                    },
                    child: _isVisible
                        ? Text(
                            "${dayselectedDate.year}/${dayselectedDate.month}/${dayselectedDate.day}",
                            style: kReusableTextStyle.copyWith(
                                fontSize: 14, color: Colors.black))
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("اضغط لاختيار أول يوم لوردية الليل : ",
                      style: kReusableTextStyle.copyWith(
                          fontSize: 14, color: Colors.black)),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2025));
                      if (newDate == null) return;
                      int timestamp = newDate.millisecondsSinceEpoch;
                      // prefs.setInt('myDayTimestampKey', timestamp);
                      // int? daytimestamp1 = prefs.getInt('myDayTimestampKey');

                      DateTime dateTime =
                          DateTime.fromMillisecondsSinceEpoch(timestamp);

                      setState(() {
                        nightselectedDate = dateTime;
                        nighttimestamp = timestamp;
                        getNightDateTime();
                        // daytimestamp = daytimestamp! + 86400000;
                      });
                    },
                    child: _isVisible
                        ? Text(
                            "${nightselectedDate.year}/${nightselectedDate.month}/${nightselectedDate.day}",
                            style: kReusableTextStyle.copyWith(
                                fontSize: 14, color: Colors.black))
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اضغط لاختيار أول يوم فى الراحة : ",
                    style: kReusableTextStyle.copyWith(
                        fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2025));
                      if (newDate == null) return;
                      int timestamp = newDate.millisecondsSinceEpoch;
                      // prefs.setInt('myDayTimestampKey', timestamp);
                      // int? daytimestamp1 = prefs.getInt('myDayTimestampKey');

                      DateTime dateTime =
                          DateTime.fromMillisecondsSinceEpoch(timestamp);

                      setState(() {
                        restselectedDate = dateTime;
                        resttimestamp = timestamp;
                        getRestDateTime();
                        // daytimestamp = daytimestamp! + 86400000;
                      });
                    },
                    child: _isVisible
                        ? Text(
                            "${restselectedDate.year}/${restselectedDate.month}/${restselectedDate.day}",
                            style: kReusableTextStyle.copyWith(
                                fontSize: 14, color: Colors.black))
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      initPrefs();
                      Navigator.of(context).push((MaterialPageRoute(
                          builder: (context) => MyWardia(
                                myDayTimestampKey: daytimestamp,
                                dayselectedDate: dayselectedDate,
                                nightselectedDate: nightselectedDate,
                                restselectedDate: restselectedDate,
                                nighttimestamp: nighttimestamp,
                                resttimestamp: resttimestamp,
                              ))));
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        'حفـــظ',
                        style: kReusableTextStyle,
                      )),
                      width: 100.0,
                      height: 50.0,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initPrefs();
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        'رجـوع',
                        style: kReusableTextStyle,
                      )),
                      width: 100.0,
                      height: 50.0,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
