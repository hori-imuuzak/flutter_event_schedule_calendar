import 'package:event_schedule_calendar/entity/day.dart';
import 'package:event_schedule_calendar/entity/palette_config.dart';
import 'package:event_schedule_calendar/view/calendar_view/widget/day_cell/widget/event_band.dart';
import 'package:event_schedule_calendar/view/calendar_view/widget/day_cell/widget/remain_event_text.dart';
import 'package:flutter/material.dart';

const maxDisplayEventBand = 2;

class DayCell extends StatelessWidget {
  final Day day;
  final Function onTap;
  final String remainCountPattern;
  final PaletteConfig paletteConfig;

  DayCell({
    this.day,
    this.onTap,
    this.remainCountPattern,
    this.paletteConfig,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> eventBandList = [];
    day.eventList.asMap().forEach((index, e) {
      if (index < maxDisplayEventBand) {
        eventBandList.add(EventBand(event: e));
      }
    });
    final remainEventCount = day.eventList.length - maxDisplayEventBand;

    return GridTile(
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.black, width: 0.5),
              bottom: BorderSide(color: Colors.black, width: 0.5),
            ),
          ),
          child: InkWell(
            onTap: () {
              onTap(day);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _getDayTextBackground(),
                      Text(
                        day.dayString,
                        style:
                            TextStyle(fontSize: 10, color: _getDayTextColor()),
                      ),
                    ],
                  ),
                ),
                ...eventBandList,
                Spacer(),
                RemainEventText(
                  count: remainEventCount,
                  remainCountPattern: remainCountPattern,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getDayTextColor() {
    if (day.isToday) {
      return Colors.white;
    } else if (day.isCurrentMonth) {
      return Colors.black;
    }

    return Colors.black45;
  }

  Widget _getDayTextBackground() {
    if (day.isToday) {
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: paletteConfig.today,
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    return Container(
      width: 16,
      height: 16,
    );
  }
}
