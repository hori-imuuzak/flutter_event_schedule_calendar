import 'package:event_schedule_calendar/src/entity/event.dart';
import 'package:event_schedule_calendar/src/ext/same_date.dart';

class EventService {
  List<Event> filter(List<Event> eventList, DateTime dateTime) {
    return eventList.where((e) => dateTime.isSameDay(e.dateTime)).toList();
  }
}
