import 'package:example/model/calendar_service.dart';
import 'package:test/test.dart';

bool isSameDate(DateTime d1, DateTime d2) {
  return d1.difference(d2).inDays == 0 && d1.day == d2.day;
}

void main() {
  group('test model/calendar', () {
    group('2021/5月を基準にしたテスト', () {
      var calendar;
      setUpAll(() {
        calendar = CalendarService();
        calendar.setYearMonth(2021, 5);
      });

      test('setYearMonthに応じたDateTimeが取得できること', () {
        expect(isSameDate(calendar.date, DateTime(2021, 5, 1)), true);
      });

      test('getFirstDateが2021/5/1を返すこと', () {
        final d = calendar.getFirstDate();
        expect(isSameDate(d, DateTime(2021, 5, 1)), true);
      });

      test('getLastDateが2021/5/31を返すこと', () {
        final d = calendar.getLastDate();
        expect(isSameDate(d, DateTime(2021, 5, 31)), true);
      });

      test('getCurrentMonthDateTimeListが2021/5/1~2021/5/31を返すこと', () {
        final list = calendar.getCurrentMonthDateTimeList();

        expect(list.length, 31);
        expect(isSameDate(list[0], DateTime(2021, 5, 1)), true);
        expect(isSameDate(list[9], DateTime(2021, 5, 10)), true);
        expect(isSameDate(list[14], DateTime(2021, 5, 15)), true);
        expect(isSameDate(list[19], DateTime(2021, 5, 20)), true);
        expect(isSameDate(list[30], DateTime(2021, 5, 31)), true);
      });

      test('getPrevMonthDateTimeListが2021/4/26~2021/4/30を返すこと', () {
        final list = calendar.getPrevMonthDateTimeList();

        expect(list.length, 5);
        expect(isSameDate(list[0], DateTime(2021, 4, 26)), true);
        expect(isSameDate(list[1], DateTime(2021, 4, 27)), true);
        expect(isSameDate(list[2], DateTime(2021, 4, 28)), true);
        expect(isSameDate(list[3], DateTime(2021, 4, 29)), true);
        expect(isSameDate(list[4], DateTime(2021, 4, 30)), true);
      });

      test('getNextMonthDateTimeListが2021/6/1~2021/6/6を返すこと', () {
        final list = calendar.getNextMonthDateTimeList();

        expect(list.length, 6);
        expect(isSameDate(list[0], DateTime(2021, 6, 1)), true);
        expect(isSameDate(list[1], DateTime(2021, 6, 2)), true);
        expect(isSameDate(list[2], DateTime(2021, 6, 3)), true);
        expect(isSameDate(list[3], DateTime(2021, 6, 4)), true);
        expect(isSameDate(list[4], DateTime(2021, 6, 5)), true);
        expect(isSameDate(list[5], DateTime(2021, 6, 6)), true);
      });
    });
  });
}
