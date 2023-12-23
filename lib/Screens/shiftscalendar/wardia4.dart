import 'package:flutter/material.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FourthWardia extends StatefulWidget {
  const FourthWardia({Key? key}) : super(key: key);

  @override
  State<FourthWardia> createState() => _FourthWardiaState();
}

class _FourthWardiaState extends State<FourthWardia> {
  @override
  Widget build(BuildContext context) {
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
              Text('الورديــة الرابعـة'),
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

    //آخر الليل
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 1),
        endTime: DateTime(2022, 4, 1),
        subject: '  آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 2),
        endTime: DateTime(2022, 4, 2),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 3),
        endTime: DateTime(2022, 4, 3),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 4),
        endTime: DateTime(2022, 4, 4),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 5),
        endTime: DateTime(2022, 4, 5),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 6),
        endTime: DateTime(2022, 4, 6),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    //النهار
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 11),
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime(2022, 4, 11),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 12),
        endTime: DateTime(2022, 4, 12),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 13),
        endTime: DateTime(2022, 4, 13),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 14),
        endTime: DateTime(2022, 4, 14),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 15),
        endTime: DateTime(2022, 4, 15),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 16),
        endTime: DateTime(2022, 4, 16),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    //راحة بعد النهار
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 17),
        endTime: DateTime(2022, 4, 17),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    //الأعياد
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 25).add(Duration(hours: 2)),
        endTime: DateTime(2022, 4, 25),
        subject: 'شم النسيم',
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
        startTime: DateTime(2022, 4, 18),
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime(2022, 4, 18),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 19),
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime(2022, 4, 19),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 20),
        endTime: DateTime(2022, 4, 20),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 21),
        endTime: DateTime(2022, 4, 21),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 22),
        endTime: DateTime(2022, 4, 22),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 23),
        endTime: DateTime(2022, 4, 23),
        subject: 'أول الليل  ',
        color: Colors.blueGrey,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    //راحة بعد آخر الليل
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 7),
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime(2022, 4, 7),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 8),
        endTime: DateTime(2022, 4, 8),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 9),
        endTime: DateTime(2022, 4, 9),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 10),
        endTime: DateTime(2022, 4, 10),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    //راحة بعد أول الليل
    appointments.add(Appointment(
        startTime: DateTime(2022, 4, 24),
        endTime: DateTime(2022, 4, 24),
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
