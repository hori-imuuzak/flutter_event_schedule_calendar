import 'package:example/entity/event.dart';
import 'package:example/ext/same_date.dart';

class EventService {
  List<Event> filter(List<Event> eventList, DateTime dateTime) {
    return eventList.where((e) => dateTime.isSameDay(e.dateTime)).toList();
  }
}
