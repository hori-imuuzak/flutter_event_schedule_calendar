import 'package:event_schedule_calendar/entity/event.dart';
import 'package:flutter/material.dart';

class EventBand extends StatelessWidget {
  final Event event;

  EventBand({
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      margin: const EdgeInsets.only(bottom: 4, right: 4, left: 0.5),
      decoration: BoxDecoration(
        color: event.color ?? Colors.green,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        event.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
}
