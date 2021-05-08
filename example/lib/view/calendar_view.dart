import 'package:example/entity/day.dart';
import 'package:example/entity/event.dart';
import 'package:example/entity/month_type.dart';
import 'package:example/model/calendar_service.dart';
import 'package:example/model/event_service.dart';
import 'package:example/view/day_cell.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  final DateTime dateTime;
  final List<Event> eventList;

  CalendarView({
    this.dateTime,
    this.eventList,
  });

  final calendarService = CalendarService();
  final eventService = EventService();

  @override
  Widget build(BuildContext context) {
    final cellTable = [
      ...calendarService
          .getPrevMonthDateTimeList()
          .map(
            (e) => Day(
              dateTime: e,
              monthType: MonthType.prev,
              eventList: eventService.filter(eventList, e),
            ),
          )
          .toList(),
      ...calendarService
          .getCurrentMonthDateTimeList()
          .map(
            (e) => Day(
              dateTime: e,
              monthType: MonthType.current,
              eventList: eventService.filter(eventList, e),
            ),
          )
          .toList(),
      ...calendarService
          .getNextMonthDateTimeList()
          .map(
            (e) => Day(
              dateTime: e,
              monthType: MonthType.next,
              eventList: eventService.filter(eventList, e),
            ),
          )
          .toList(),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black, width: 0.5),
          left: BorderSide(color: Colors.black, width: 0.5),
        ),
      ),
      child: GridView.count(
        crossAxisCount: 7,
        childAspectRatio: 0.7,
        children: cellTable.map((e) => DayCell(day: e)).toList(),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
