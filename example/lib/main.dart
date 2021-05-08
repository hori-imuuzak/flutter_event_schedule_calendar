import 'package:example/entity/event.dart';
import 'package:example/view/calendar_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Center(
        child: CalendarView(
          dateTime: DateTime.now(),
          eventList: [
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
        ),
      ),
    );
  }
}
