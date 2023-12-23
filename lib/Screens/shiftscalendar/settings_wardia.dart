import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/shiftscalendar/custom_wardia.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WardiaSettings extends StatefulWidget {
  const WardiaSettings({Key? key}) : super(key: key);

  @override
  State<WardiaSettings> createState() => _WardiaSettingsState();
}

class _WardiaSettingsState extends State<WardiaSettings> {
  // DateTime? firstNahar;
  DateTime firstNahar = DateTime.now();
  DateTime firstNight = DateTime.now();
  DateTime lastNight = DateTime.now();

  var todey;
  var dt;

  savePrefDay(String jours) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('jour', jours);
    print(preferences.getString('jour'));
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    todey = preferences.getString('jour');
    dt = DateTime.parse('$todey');
    print(todey);
    print(dt.add(Duration(days: 1)));
  }

  // @override
  // void initState() {
  //   // getPref();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}'),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تاريخ بداية أول وردية نهار'),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? firstD = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2023));
                    // savePref('$firstNahar').toString();
                    if (firstD == null) return;
                    setState(() {
                      firstNahar = firstD;
                        savePrefDay('$firstNahar').toString();
                      dt = firstD;
                      savePrefDay('$firstNahar');
                    });
                  },
                  child: Text('اختر التاريخ'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    '${dt.day} / ${dt.month} / ${dt.year}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تاريخ بداية وردية أول الليل'),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? firstN = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2023));
                    if (firstN == null) return;
                    setState(() {
                      firstNight = firstN;
                    });
                  },
                  child: Text('اختر التاريخ'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    '${firstNight.day} / ${firstNight.month} / ${firstNight.year}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تاريخ بداية وردية آخر الليل'),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? lastN = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2023));
                    if (lastN == null) return;
                    setState(() {
                      lastNight = lastN;
                    });
                  },
                  child: Text('اختر التاريخ'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    '${lastNight.day} / ${lastNight.month} / ${lastNight.year}')
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomWardia(
                          dayLight: dt,
                          firstNight: firstNight,
                          lastNight: lastNight,
                        ),
                      ),
                    );
                  },
                  child: Text('حفظ'),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    getPref();
                  },
                  child: Text('استرجاع'),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // savePref('Egypt');
              },
              child: Text('SaveValue'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                getPref();
              },
              child: Text('GetValueBack'),
            ),
          ],
        ),
      ),
    );
  }
}
