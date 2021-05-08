import 'package:example/model/weekday_cursor.dart';
import 'package:flutter/material.dart';

// TODO: i18n
const weekdayLabel = {
  DateTime.monday: '月',
  DateTime.tuesday: '火',
  DateTime.wednesday: '水',
  DateTime.thursday: '木',
  DateTime.friday: '金',
  DateTime.saturday: '土',
  DateTime.sunday: '日',
};

class WeekdayLabel extends StatelessWidget {
  final int _beginWeekday;

  WeekdayLabel(this._beginWeekday);

  @override
  Widget build(BuildContext context) {
    final weekdayCursor = WeekdayCursor(begin: _beginWeekday);

    return SizedBox(
      height: 16,
      child: GridView.count(
        crossAxisCount: 7,
        childAspectRatio: 3.6,
        children: List.generate(
          7,
          (index) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            child: Text(
              weekdayLabel[weekdayCursor.getAt(index)],
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
