import 'package:example/entity/day.dart';
import 'package:example/entity/event.dart';
import 'package:example/entity/month_type.dart';
import 'package:example/model/calendar_service.dart';
import 'package:example/model/event_service.dart';
import 'package:example/view/calendar_view/widget/day_cell/day_cell.dart';
import 'package:example/view/calendar_view/widget/weekday_label/weekday_label.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  final DateTime dateTime;
  final List<Event> eventList;
  final int beginWeekday;
  final Function onTapDay;

  CalendarView({
    this.dateTime,
    this.eventList,
    this.beginWeekday,
    this.onTapDay,
  });

  @override
  Widget build(BuildContext context) {
    final calendarService = CalendarService(begin: beginWeekday);
    final eventService = EventService();

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
      child: Column(
        children: [
          WeekdayLabel(beginWeekday),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7,
              childAspectRatio: 0.7,
              children: cellTable
                  .asMap()
                  .entries
                  .map(
                    (e) => DayCell(
                      day: e.value,
                      onTap: onTapDay,
                    ),
                  )
                  .toList(),
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
