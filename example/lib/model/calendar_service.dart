class CalendarService {
  DateTime _date;
  DateTime get date => _date;

  CalendarService() {
    final now = DateTime.now();
    _date = DateTime(now.year, now.month, 1);
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
    var weekday = date.weekday;
    while (weekday > DateTime.monday) {
      date = date.subtract(Duration(days: 1));
      prevMonthDateTimeList.insert(0, date);
      weekday--;
    }

    return prevMonthDateTimeList;
  }

  List<DateTime> getNextMonthDateTimeList() {
    List<DateTime> nextMonthDateTimeList = [];

    var date = getLastDate();
    var weekday = date.weekday;
    while (weekday < DateTime.sunday) {
      date = date.add(Duration(days: 1));
      nextMonthDateTimeList.add(date);
      weekday++;
    }

    return nextMonthDateTimeList;
  }
}
