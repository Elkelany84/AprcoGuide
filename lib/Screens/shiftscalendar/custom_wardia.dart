import 'package:flutter/material.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


 var todey;
class CustomWardia extends StatelessWidget {
  CustomWardia(
      {required this.dayLight,
      required this.firstNight,
      required this.lastNight});
  final DateTime dayLight;
  final DateTime firstNight;
  final DateTime lastNight;

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var todey = preferences.getString('jour');
  // }

  @override
  Widget build(BuildContext context) {
   

    getPref() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      todey = preferences.getString('jour');
      print(todey);
    }

    // SharedPreferences prefs;
    // getSharedPreferences() async {
    //   prefs = await SharedPreferences.getInstance();
    // }
// saveStringValue () async
//   {
//     prefs = await SharedPreferences.getInstance();
//     prefs.setString("tryMe", "$dayLight");
//   }
    return
        // MaterialApp(
        //   localizationsDelegates: [
        //     GlobalMaterialLocalizations.delegate,
        //     GlobalWidgetsLocalizations.delegate,
        //     GlobalCupertinoLocalizations.delegate,
        //   ],
        //   supportedLocales: [
        //     const Locale('ar', 'AE'),
        //   ],
        //   locale: Locale("ar", "AE"),
        // home:
        Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Text('الورديــة الثالثــة'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Localizations.override(
          context: context,
          locale: Locale('en'),
          child: SfCalendar(
            view: CalendarView.month,
            dataSource: _getCalendarDataSource(),
            // appointmentTextStyle:
            //      TextStyle(color: Colors.blue.shade100),
            monthViewSettings: const MonthViewSettings(
                monthCellStyle: MonthCellStyle(
                  todayBackgroundColor: Colors.amberAccent,
                  // textStyle: TextStyle(fontSize: 20),
                ),
                navigationDirection: MonthNavigationDirection.vertical,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
                // appointmentDisplayMode:
                //     MonthAppointmentDisplayMode.appointment),
                ),
          ),
        ),
      ),
      // ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    //test
    //النهار
    // appointments.add(Appointment(
    //     startTime: dayLight,
    //     // endTime: DateTime.now().add(Duration(hours: 1)),
    //     endTime: dayLight,
    //     subject: 'النهار  ',
    //     color: Colors.blue,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    //آخر الليل
    appointments.add(Appointment(
        startTime: lastNight,
        endTime: lastNight,
        subject: '  آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 1)),
        endTime: lastNight.add(Duration(days: 1)),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 2)),
        endTime: lastNight.add(Duration(days: 2)),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 3)),
        endTime: lastNight.add(Duration(days: 3)),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 4)),
        endTime: lastNight.add(Duration(days: 4)),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 5)),
        endTime: lastNight.add(Duration(days: 5)),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    //النهار
    appointments.add(Appointment(
        startTime: dayLight,
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: dayLight,
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: dayLight.add(Duration(days: 1)),
        endTime: dayLight.add(Duration(days: 1)),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: dayLight.add(Duration(days: 2)),
        endTime: dayLight.add(Duration(days: 2)),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: dayLight.add(Duration(days: 3)),
        endTime: dayLight.add(Duration(days: 3)),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: dayLight.add(Duration(days: 4)),
        endTime: dayLight.add(Duration(days: 4)),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: dayLight.add(Duration(days: 5)),
        endTime: dayLight.add(Duration(days: 5)),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    //راحة بعد النهار
    appointments.add(Appointment(
        startTime: dayLight.add(Duration(days: 6)),
        endTime: dayLight.add(Duration(days: 6)),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    //الأعياد
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 25).add(Duration(hours: 2)),
        endTime: DateTime(2022, 4, 25),
        subject: 'شم.النسيم',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 25).add(Duration(hours: 3)),
        endTime: DateTime(2022, 4, 25),
        subject: 'تحريرسيناء',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 5, 1).add(Duration(hours: 2)),
        endTime: DateTime(2022, 5, 1),
        subject: 'عيد العمال',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 5, 2).add(Duration(hours: 2)),
        endTime: DateTime(2022, 5, 2),
        subject: 'عيد الفطر المبارك',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 6, 30).add(Duration(hours: 2)),
        endTime: DateTime(2022, 6, 30),
        subject: 'ثورة30يونيو',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 7, 8).add(Duration(hours: 2)),
        endTime: DateTime(2022, 7, 8),
        subject: 'وقفة عرفات',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 7, 9).add(Duration(hours: 2)),
        endTime: DateTime(2022, 7, 9),
        subject: 'عيد الأضحى',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 7, 23).add(Duration(hours: 2)),
        endTime: DateTime(2022, 7, 23),
        subject: 'عيد الثورة',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 7, 30).add(Duration(hours: 2)),
        endTime: DateTime(2022, 7, 30),
        subject: 'رأس السنة الهجرية',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 10, 6).add(Duration(hours: 2)),
        endTime: DateTime(2022, 10, 6),
        subject: 'عيد النصر',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 10, 8).add(Duration(hours: 2)),
        endTime: DateTime(2022, 10, 8),
        subject: 'المولد النبوى',
        color: Colors.purple,
        recurrenceRule: 'FREQ=DAILY;COUNT=1'));

//أول الليل
    appointments.add(Appointment(
        startTime: firstNight,
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: firstNight,
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: firstNight.add(Duration(days: 1)),
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: firstNight.add(Duration(days: 1)),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: firstNight.add(Duration(days: 2)),
        endTime: firstNight.add(Duration(days: 2)),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: firstNight.add(Duration(days: 3)),
        endTime: firstNight.add(Duration(days: 3)),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: firstNight.add(Duration(days: 4)),
        endTime: firstNight.add(Duration(days: 4)),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: firstNight.add(Duration(days: 5)),
        endTime: firstNight.add(Duration(days: 5)),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    //راحة بعد آخر الليل
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 6)),
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: lastNight.add(Duration(days: 6)),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 7)),
        endTime: lastNight.add(Duration(days: 7)),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 8)),
        endTime: lastNight.add(Duration(days: 8)),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: lastNight.add(Duration(days: 9)),
        endTime: lastNight.add(Duration(days: 9)),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    //راحة بعد أول الليل
    appointments.add(Appointment(
        startTime: firstNight.add(Duration(days: 6)),
        endTime: firstNight.add(Duration(days: 6)),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    return _AppointmentDataSource(
      appointments,
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(
    List<Appointment> source,
  ) {
    appointments = source;
  }
}
