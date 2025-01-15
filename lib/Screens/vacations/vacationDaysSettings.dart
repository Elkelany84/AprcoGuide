// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/vacations/show_vacation.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/vacations_provider.dart';
import '../categories/pharmacies/regions.dart';

class Vacationdayssettings extends StatefulWidget {
  const Vacationdayssettings({super.key});

  @override
  State<Vacationdayssettings> createState() => _VacationdayssettingsState();
}

class _VacationdayssettingsState extends State<Vacationdayssettings> {
  bool _showWidget = false;

  @override
  void initState() {
    super.initState();
    getStoredIntValue();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showWidget = true;
      });
    });
  }

  String? vacationDaysNumber;
//store date in shared_preferences
  Future<void> initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('myVacationNo', vacationDaysNumber!);
  }

//get int value from shared_preferences
  Future<void> getStoredIntValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    vacationDaysNumber = prefs.getString("myVacationNo") ?? '30';
    print(vacationDaysNumber);
  }

  @override
  Widget build(BuildContext context) {
    final vacationProvider = Provider.of<DataModel>(context);
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
                'إعدادات رصيد الإجازات',
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
                  new Text(
                    "عدد أيام العارضة : 7 أيام",
                    style: kCardTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'عدد أيام رصيد السنوى',
                    style: kCardTextStyle,
                  ),
                  _showWidget
                      ? specialVacationDropdown()
                      : CircularProgressIndicator()
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
                      Navigator.pop(context);
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
                      // vacationProvider.vacationProvNumber = vacationDaysNumber!;
                      // print(
                      //     'vacationProvider.vacationProvNumber is: ${vacationProvider.vacationProvNumber}');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowVacation()));
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

  DropdownButton<String> specialVacationDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in vacationCash) {
      var newItem = DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              currency,
              style: kCardTextStyle,
              // TextStyle(
              //     color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
              textAlign: TextAlign.end,
              // textDirection: TextDirection.rtl,
            ),
          ],
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: vacationDaysNumber,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          vacationDaysNumber = value!;
          print(vacationDaysNumber);
          // getData();
        });
      },
    );
  }
}

//
