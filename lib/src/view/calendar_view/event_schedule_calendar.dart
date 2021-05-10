import 'package:event_schedule_calendar/src/entity/calendar_config.dart';
import 'package:event_schedule_calendar/src/entity/day.dart';
import 'package:event_schedule_calendar/src/entity/event.dart';
import 'package:event_schedule_calendar/src/entity/month_type.dart';
import 'package:event_schedule_calendar/src/model/calendar_service.dart';
import 'package:event_schedule_calendar/src/model/event_service.dart';
import 'package:event_schedule_calendar/src/view/calendar_view/widget/day_cell/day_cell.dart';
import 'package:event_schedule_calendar/src/view/calendar_view/widget/weekday_label/weekday_label.dart';
import 'package:flutter/material.dart';

class EventScheduleCalendar extends StatelessWidget {
  final DateTime? dateTime;
  final List<Event>? eventList;
  final Function? onTapDay;
  final CalendarConfig? config;

  EventScheduleCalendar({
    this.dateTime,
    this.eventList,
    this.onTapDay,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    final calendarService = CalendarService(begin: config!.beginWeekday);
    final eventService = EventService();

    final cellTable = [
      ...calendarService
          .getPrevMonthDateTimeList()
          .map(
            (e) => Day(
              dateTime: e,
              monthType: MonthType.prev,
              eventList: eventService.filter(eventList!, e),
            ),
          )
          .toList(),
      ...calendarService
          .getCurrentMonthDateTimeList()
          .map(
            (e) => Day(
              dateTime: e,
              monthType: MonthType.current,
              eventList: eventService.filter(eventList!, e),
            ),
          )
          .toList(),
      ...calendarService
          .getNextMonthDateTimeList()
          .map(
            (e) => Day(
              dateTime: e,
              monthType: MonthType.next,
              eventList: eventService.filter(eventList!, e),
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
          WeekdayLabel(config!.beginWeekday),
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
                      remainCountPattern: config!.remainEventCountPattern,
                      paletteConfig: config!.paletteConfig,
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
