import 'package:example/model/weekday_cursor.dart';

class CalendarService {
  int _beginWeekday;
  int _endWeekday;

  DateTime _date;
  DateTime get date => _date;

  CalendarService({int begin = DateTime.monday}) {
    final now = DateTime.now();
    _date = DateTime(now.year, now.month, 1);
    _beginWeekday = begin;

    final weekdayCursor = WeekdayCursor(begin: begin);
    weekdayCursor.moveToPrev();
    _endWeekday = weekdayCursor.current;
  }

  void setYearMonth(int year, int month) {
    _date = DateTime(year, month, 1);
  }

  DateTime getFirstDate() => DateTime(_date.year, _date.month, 1);
  DateTime getLastDate() =>
      DateTime(_date.year, _date.month + 1).subtract(Duration(days: 1));

  List<DateTime> getCurrentMonthDateTimeList() {
    List<DateTime> currentMonthDateTmeList = [];

    var date = getFirstDate();
    final lastDate = getLastDate();
    while (date.difference(lastDate).inDays <= 0) {
      currentMonthDateTmeList.add(DateTime(date.year, date.month, date.day));
      date = date.add(Duration(days: 1));
    }

    return currentMonthDateTmeList;
  }

  List<DateTime> getPrevMonthDateTimeList() {
    List<DateTime> prevMonthDateTimeList = [];

    var date = getFirstDate();
    final weekdayCursor = WeekdayCursor(begin: date.weekday);

    while (weekdayCursor.current != _beginWeekday) {
      date = date.subtract(Duration(days: 1));
      prevMonthDateTimeList.insert(0, date);
      weekdayCursor.moveToPrev();
    }

    return prevMonthDateTimeList;
  }

  List<DateTime> getNextMonthDateTimeList() {
    List<DateTime> nextMonthDateTimeList = [];

    var date = getLastDate();
    final weekdayCursor = WeekdayCursor(begin: date.weekday);
    print(weekdayCursor.current);
    while (weekdayCursor.current != _endWeekday) {
      date = date.add(Duration(days: 1));
      nextMonthDateTimeList.add(date);
      weekdayCursor.moveToNext();
    }

    return nextMonthDateTimeList;
  }
}
