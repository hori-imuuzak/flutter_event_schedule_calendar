class WeekdayLabelConfig {
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;

  WeekdayLabelConfig({
    this.monday = '月',
    this.tuesday = '火',
    this.wednesday = '水',
    this.thursday = '木',
    this.friday = '金',
    this.saturday = '土',
    this.sunday = '日',
  });

  String getLabel(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return monday;
      case DateTime.tuesday:
        return tuesday;
      case DateTime.wednesday:
        return wednesday;
      case DateTime.thursday:
        return thursday;
      case DateTime.friday:
        return friday;
      case DateTime.saturday:
        return saturday;
      case DateTime.sunday:
        return sunday;
    }

    return '';
  }
}
