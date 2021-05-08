import 'package:event_schedule_calendar/model/weekday_cursor.dart';
import 'package:test/test.dart';

void main() {
  group('test entity/weekday_cursor', () {
    group('月曜日を開始曜日とした場合', () {
      test('初期値はDateTime.mondayの値であること', () {
        final cursor = WeekdayCursor(begin: DateTime.monday);
        expect(cursor.current, DateTime.monday);
      });
      test('prevした時はDateTime.sundayの値であること', () {
        final cursor = WeekdayCursor(begin: DateTime.monday);
        cursor.moveToPrev();
        expect(cursor.current, DateTime.sunday);
      });
      test('nextした時はDateTime.tuesdayの値であること', () {
        final cursor = WeekdayCursor(begin: DateTime.monday);
        cursor.moveToNext();
        expect(cursor.current, DateTime.tuesday);
      });
      test('getAtに応じて曜日が取得できること', () {
        final cursor = WeekdayCursor(begin: DateTime.monday);
        expect(cursor.getAt(0), DateTime.monday);
        expect(cursor.getAt(1), DateTime.tuesday);
        expect(cursor.getAt(2), DateTime.wednesday);
        expect(cursor.getAt(3), DateTime.thursday);
        expect(cursor.getAt(4), DateTime.friday);
        expect(cursor.getAt(5), DateTime.saturday);
        expect(cursor.getAt(6), DateTime.sunday);
      });
    });

    group('日曜日を開始曜日とした場合', () {
      test('初期値はDateTime.sundayの値であること', () {
        final cursor = WeekdayCursor(begin: DateTime.sunday);
        expect(cursor.current, DateTime.sunday);
      });
      test('prevした時はDateTime.saturdayの値であること', () {
        final cursor = WeekdayCursor(begin: DateTime.sunday);
        cursor.moveToPrev();
        expect(cursor.current, DateTime.saturday);
      });
      test('nextした時はDateTime.mondayの値であること', () {
        final cursor = WeekdayCursor(begin: DateTime.sunday);
        cursor.moveToNext();
        expect(cursor.current, DateTime.monday);
      });
      test('getAtに応じて曜日が取得できること', () {
        final cursor = WeekdayCursor(begin: DateTime.sunday);
        expect(cursor.getAt(0), DateTime.sunday);
        expect(cursor.getAt(1), DateTime.monday);
        expect(cursor.getAt(2), DateTime.tuesday);
        expect(cursor.getAt(3), DateTime.wednesday);
        expect(cursor.getAt(4), DateTime.thursday);
        expect(cursor.getAt(5), DateTime.friday);
        expect(cursor.getAt(6), DateTime.saturday);
      });
    });
  });
}
