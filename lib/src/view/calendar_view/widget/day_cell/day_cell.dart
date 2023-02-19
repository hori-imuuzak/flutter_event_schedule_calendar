import 'package:event_schedule_calendar/src/entity/day.dart';
import 'package:event_schedule_calendar/src/entity/day_cell_config.dart';
import 'package:event_schedule_calendar/src/entity/palette_config.dart';
import 'package:event_schedule_calendar/src/view/calendar_view/widget/day_cell/widget/event_band.dart';
import 'package:event_schedule_calendar/src/view/calendar_view/widget/day_cell/widget/remain_event_text.dart';
import 'package:flutter/material.dart';

const maxDisplayEventBand = 2;

class DayCell extends StatelessWidget {
  final Day? day;
  final Function? onTap;
  final String? remainCountPattern;
  final PaletteConfig? paletteConfig;
  final CellConfig? dayCellConfig;

  DayCell(
      {this.day,
      this.onTap,
      this.remainCountPattern,
      this.paletteConfig,
      this.dayCellConfig});

  @override
  Widget build(BuildContext context) {
    final List<Widget> eventBandList = [];
    day!.eventList!.asMap().forEach((index, e) {
      if (index < maxDisplayEventBand) {
        eventBandList.add(EventBand(event: e));
      }
    });
    final remainEventCount = day!.eventList!.length - maxDisplayEventBand;

    return GridTile(
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: _getBoxBackground(),
                width: _getDayCellBorderWidth(),
              ),
              bottom: BorderSide(
                color: _getBoxBackground(),
                width: _getDayCellBorderWidth(),
              ),
            ),
          ),
          child: InkWell(
            onTap: () {
              onTap!(day);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color: _getDayTextBackground(),
                          shape: CircleBorder(
                            side: BorderSide(
                              width: _selectedBorderWidth(),
                              color: _selectedBorderActive(),
                              style: _selectedBorderStyle(),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            day!.dayString,
                            style: TextStyle(
                                fontSize: _getlabelSize(),
                                color: _getDayTextColor()),
                          ),
                        ),
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
    if (day!.isToday) {
      return paletteConfig!.todayFontColor;
    } else if (day!.isCurrentMonth) {
      return paletteConfig!.dayFontColorInMonth;
    }

    return paletteConfig!.dayFontColorNotInMonth;
  }

  Color _getBoxBackground() {
    if (paletteConfig == null)
      return Colors.black;
    else
      return paletteConfig!.boxColor;
  }

  double _getlabelSize() {
    if (dayCellConfig == null)
      return 10;
    else
      return dayCellConfig!.fontSize;
  }

  double _getDayCellBorderWidth() {
    if (dayCellConfig == null)
      return 0.5;
    else
      return dayCellConfig!.dayCellBorderWidth;
  }

  Color _getDayTextBackground() {
    if (day!.isToday) {
      return paletteConfig!.today;
    }

    return Colors.transparent;
  }

  Color _selectedBorderActive() {
    if (day!.isToday) {
      return paletteConfig!.selectedBorder;
    }

    return Colors.transparent;
  }

  double _selectedBorderWidth() => dayCellConfig!.selectedBorderWidth;

  BorderStyle _selectedBorderStyle() => dayCellConfig!.selectedBorderStyle;
}
