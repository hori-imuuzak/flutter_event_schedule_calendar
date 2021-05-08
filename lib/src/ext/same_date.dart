extension SameDate on DateTime {
  bool isSameDay(DateTime d) =>
      this.difference(d).inDays == 0 && this.day == d.day;
}
