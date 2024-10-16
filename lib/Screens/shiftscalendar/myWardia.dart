import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/shiftscalendar/settings_wardia.dart';
import 'package:flutter_auth/components/constants.dart';
import 'package:flutter_auth/components/drawer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyWardia extends StatefulWidget {
  MyWardia({
    Key? key,
    required this.nightselectedDate,
    required this.restselectedDate,
    required this.dayselectedDate,
    this.myDayTimestampKey,
    this.nighttimestamp,
    this.resttimestamp,
  }) : super(key: key);
  DateTime nightselectedDate;
  DateTime dayselectedDate;
  DateTime restselectedDate;

  final int? myDayTimestampKey;
  final int? nighttimestamp;
  final int? resttimestamp;

  @override
  State<MyWardia> createState() => _MyWardiaState();
}

class _MyWardiaState extends State<MyWardia> {
  @override
  void initState() {
    super.initState();
    getDayDateTime();
    getNightDateTime();
    getRestDateTime();
  }

  DateTime? getDayDateTime() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(widget.myDayTimestampKey!);
    widget.dayselectedDate = dateTime;
    print(dateTime);
    return dateTime;
  }

  DateTime? getNightDateTime() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(widget.nighttimestamp!);
    widget.nightselectedDate = dateTime;
    print(dateTime);
    return dateTime;
  }

  DateTime? getRestDateTime() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(widget.resttimestamp!);
    widget.restselectedDate = dateTime;
    print(dateTime);
    return dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //     localizationsDelegates: [
        //       GlobalMaterialLocalizations.delegate,
        //       GlobalWidgetsLocalizations.delegate,
        //       GlobalCupertinoLocalizations.delegate,
        //     ],
        //     supportedLocales: [
        //       const Locale('ar', 'AE'),
        //     ],
        //     locale: Locale("ar", "AE"),
        //     home:
        Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.settings, color: Colors.deepPurple[600]),
                SizedBox(
                  width: 5,
                ),
                Shimmer.fromColors(
                  period: const Duration(seconds: 2),
                  direction: ShimmerDirection.rtl,
                  baseColor: Colors.white,
                  highlightColor: Colors.deepPurple[300]!,
                  child: Text(
                    'ضبط الوردية',
                    style: kReusableTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
        backgroundColor: Colors.purple,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Text('جــدول الورديــة',
                  style: kReusableTextStyle.copyWith(fontSize: 20)),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Localizations.override(
          context: context,
          locale: const Locale('AR', 'EGY'),
          child: SfCalendar(
            firstDayOfWeek: 6,
            view: CalendarView.month,
            dataSource: _getCalendarDataSource(),
            // appointmentTextStyle:
            //      TextStyle(color: Colors.blue.shade100),
            monthViewSettings: MonthViewSettings(
                monthCellStyle: MonthCellStyle(
                  todayBackgroundColor: Colors.amberAccent,
                  // textStyle: TextStyle(fontSize: 20),
                ),
                navigationDirection: MonthNavigationDirection.vertical,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                showAgenda: true,
                agendaViewHeight: 50),
          ),
        ),
      ),
      // ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    // //آخر الليل
    appointments.add(Appointment(
        isAllDay: true,
        startTime: widget.nightselectedDate,
        endTime: widget.nightselectedDate,
        subject: '  آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));
    appointments.add(Appointment(
        isAllDay: true,
        startTime: DateTime(widget.nightselectedDate.year,
            widget.nightselectedDate.month, widget.nightselectedDate.day + 1),
        endTime: DateTime(widget.nightselectedDate.year,
            widget.nightselectedDate.month, widget.nightselectedDate.day + 1),
        subject: 'آخر الليل  ',
        color: Colors.black,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));

    //النهار
    appointments.add(Appointment(
        isAllDay: true,
        startTime: widget.dayselectedDate,
        // endTime: DateTime.now().add(Duration(hours: 1)),
        endTime: widget.dayselectedDate,
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));
    appointments.add(Appointment(
        isAllDay: true,
        startTime: DateTime(widget.dayselectedDate.year,
            widget.dayselectedDate.month, widget.dayselectedDate.day + 1),
        endTime: DateTime(widget.dayselectedDate.year,
            widget.dayselectedDate.month, widget.dayselectedDate.day + 1),
        subject: 'النهار  ',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));

    //راحة بعد النهار
    appointments.add(Appointment(
        isAllDay: true,
        startTime: widget.restselectedDate,
        endTime: widget.restselectedDate,
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));
    appointments.add(Appointment(
        isAllDay: true,
        startTime: DateTime(widget.restselectedDate.year,
            widget.restselectedDate.month, widget.restselectedDate.day + 1),
        endTime: DateTime(widget.restselectedDate.year,
            widget.restselectedDate.month, widget.restselectedDate.day + 1),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));
    appointments.add(Appointment(
        isAllDay: true,
        startTime: DateTime(widget.restselectedDate.year,
            widget.restselectedDate.month, widget.restselectedDate.day + 2),
        endTime: DateTime(widget.restselectedDate.year,
            widget.restselectedDate.month, widget.restselectedDate.day + 2),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));
    appointments.add(Appointment(
        isAllDay: true,
        startTime: DateTime(widget.restselectedDate.year,
            widget.restselectedDate.month, widget.restselectedDate.day + 3),
        endTime: DateTime(widget.restselectedDate.year,
            widget.restselectedDate.month, widget.restselectedDate.day + 3),
        subject: 'راحــة',
        color: Colors.green,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=8;COUNT=60'));
    //الأعياد
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 25).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 4, 25),
    //     subject: 'شم.النسيم',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 25).add(const Duration(hours: 3)),
    //     endTime: DateTime(2022, 4, 25),
    //     subject: 'تحريرسيناء',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 5, 1).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 5, 1),
    //     subject: 'عيد العمال',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 5, 2).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 5, 2),
    //     subject: 'عيد الفطر المبارك',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 6, 30).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 6, 30),
    //     subject: 'ثورة30يونيو',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 7, 8).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 7, 8),
    //     subject: 'وقفة عرفات',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 7, 9).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 7, 9),
    //     subject: 'عيد الأضحى',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 7, 23).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 7, 23),
    //     subject: 'عيد الثورة',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 7, 30).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 7, 30),
    //     subject: 'رأس السنة الهجرية',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 10, 6).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 10, 6),
    //     subject: 'عيد النصر',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 10, 8).add(const Duration(hours: 2)),
    //     endTime: DateTime(2022, 10, 8),
    //     subject: 'المولد النبوى',
    //     color: Colors.purple,
    //     recurrenceRule: 'FREQ=DAILY;COUNT=1'));

//أول الليل
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 12),
    //     // endTime: DateTime.now().add(Duration(hours: 1)),
    //     endTime: DateTime(2022, 4, 12),
    //     subject: 'أول الليل  ',
    //     color: Colors.blueGrey,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 13),
    //     // endTime: DateTime.now().add(Duration(hours: 1)),
    //     endTime: DateTime(2022, 4, 13),
    //     subject: 'أول الليل  ',
    //     color: Colors.blueGrey,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 14),
    //     endTime: DateTime(2022, 4, 14),
    //     subject: 'أول الليل  ',
    //     color: Colors.blueGrey,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 15),
    //     endTime: DateTime(2022, 4, 15),
    //     subject: 'أول الليل  ',
    //     color: Colors.blueGrey,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 16),
    //     endTime: DateTime(2022, 4, 16),
    //     subject: 'أول الليل  ',
    //     color: Colors.blueGrey,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 17),
    //     endTime: DateTime(2022, 4, 17),
    //     subject: 'أول الليل  ',
    //     color: Colors.blueGrey,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

    //راحة بعد آخر الليل
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 1),
    //     // endTime: DateTime.now().add(Duration(hours: 1)),
    //     endTime: DateTime(2022, 4, 1),
    //     subject: 'راحــة',
    //     color: Colors.green,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 2),
    //     endTime: DateTime(2022, 4, 2),
    //     subject: 'راحــة',
    //     color: Colors.green,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 3),
    //     endTime: DateTime(2022, 4, 3),
    //     subject: 'راحــة',
    //     color: Colors.green,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 4),
    //     endTime: DateTime(2022, 4, 4),
    //     subject: 'راحــة',
    //     color: Colors.green,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));
    // //راحة بعد أول الليل
    // appointments.add(Appointment(
    //     startTime: DateTime(2022, 4, 18),
    //     endTime: DateTime(2022, 4, 18),
    //     subject: 'راحــة',
    //     color: Colors.green,
    //     recurrenceRule: 'FREQ=DAILY;INTERVAL=24;COUNT=12'));

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

// MaterialApp(
//     localizationsDelegates: [
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ],
//     supportedLocales: [
//       const Locale('ar', 'AE'),
//     ],
//     locale: Locale("ar", "AE"),
//     home:
