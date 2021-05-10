import 'package:event_schedule_calendar/event_schedule_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEMO'),
      ),
      body: EventScheduleCalendar(
        dateTime: DateTime.now(),
        eventList: [
          Event(
            name: 'event1',
            dateTime: DateTime(2021, 5, 1),
            color: Colors.brown,
          ),
          Event(
            name: 'event2',
            dateTime: DateTime(2021, 5, 1),
            color: Colors.brown,
          ),
          Event(
            name: 'event3',
            dateTime: DateTime(2021, 5, 1),
            color: Colors.brown,
          ),
          Event(
            name: '誕生日',
            dateTime: DateTime(2021, 5, 29),
            color: Colors.red,
          ),
          Event(
            name: '休み',
            dateTime: DateTime(2021, 5, 13),
            color: Colors.green,
          ),
          Event(
            name: 'Xデー',
            dateTime: DateTime(2021, 6, 5),
            color: Colors.blue,
          ),
        ],
        config: CalendarConfig(),
        onTapDay: (day) {
          showDialog<AlertDialog>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(day.dateTime.toString()),
                    ...day.eventList.map((e) => Text(e.name)),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
