# event_schedule_calendar

## Usage

add `event_schedule_calendar` to your `pubspec.yml` file

```
dependencies:
    event_schedule_calendar:
```

## Screenshots

<img width="240" src="https://user-images.githubusercontent.com/26102225/117555419-f9a8b480-b099-11eb-924b-fc5680c2e25c.png">

<img width="240" src="https://user-images.githubusercontent.com/26102225/117555448-307eca80-b09a-11eb-9bbe-a0d828f1cc96.png">

## Parameter

- dateTime: The calendar day of the month you want to display. (DateTime class)

- eventList: Event items to be displayed in the calendar.
  - Event
    - dateTime: Date of the event.
    - name: Text to display.
    - color: Label color.

- config: Setting up a calendar. The wording of the days of the week and the color settings are done here.

- onTapDay: Event when the date of the calendar is tapped. The argument is Event.

## Example

```
import 'package:event_schedule_calendar/event_schedule_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'event_schedule_calendar demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CalendarView(
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
```

