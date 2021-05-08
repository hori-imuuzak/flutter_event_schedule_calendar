import 'package:example/entity/event.dart';
import 'package:example/entity/month_type.dart';

class Day {
  DateTime _dateTime;
  MonthType _monthType;
  List<Event> _eventList;

  Day({
    DateTime dateTime,
    MonthType monthType,
    List<Event> eventList,
  }) {
    this._dateTime = dateTime;
    this._monthType = monthType;
    this._eventList = eventList;
  }

  DateTime get dateTime => _dateTime;
  String get dayString => _dateTime.day.toString();
  bool get isPrevMonth => _monthType == MonthType.prev;
  bool get isCurrentMonth => _monthType == MonthType.current;
  bool get isNextMonth => _monthType == MonthType.next;
  bool get isToday =>
      _dateTime.difference(DateTime.now()).inDays == 0 &&
      _dateTime.day == DateTime.now().day;

  List<Event> get eventList => _eventList;
}
