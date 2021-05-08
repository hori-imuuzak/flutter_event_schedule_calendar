const _weekday = [
  0,
  DateTime.monday,
  DateTime.tuesday,
  DateTime.wednesday,
  DateTime.thursday,
  DateTime.friday,
  DateTime.saturday,
  DateTime.sunday,
];

class WeekdayCursor {
  int _cursor = 1;

  WeekdayCursor({int begin})
      : assert(DateTime.monday <= begin),
        assert(begin <= DateTime.sunday) {
    this._cursor = begin;
  }

  int get current => _weekday[_cursor];

  void moveToNext() {
    _cursor++;
    if (_cursor > 7) {
      _cursor = 1;
    }
  }

  void moveToPrev() {
    _cursor--;
    if (_cursor <= 0) {
      _cursor = 7;
    }
  }

  int getAt(int index) {
    final atIndex = _cursor + index;
    if (atIndex > 7) {
      return _weekday[atIndex % 7];
    }

    return _weekday[atIndex];
  }
}
