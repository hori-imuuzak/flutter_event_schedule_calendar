import 'package:event_schedule_calendar/src/entity/day_cell_config.dart';
import 'package:event_schedule_calendar/src/entity/palette_config.dart';
import 'package:event_schedule_calendar/src/entity/weekday_label_config.dart';

class CalendarConfig {
  WeekdayLabelConfig? weekdayLabelConfig;
  PaletteConfig? paletteConfig;
  CellConfig? dayCellConfig;

  final int beginWeekday;
  final String remainEventCountPattern;

  CalendarConfig({
    this.weekdayLabelConfig,
    this.paletteConfig,
    this.dayCellConfig,
    this.beginWeekday = DateTime.sunday,
    this.remainEventCountPattern = '他 %s 件',
  }) : assert(DateTime.monday <= beginWeekday &&
            beginWeekday <= DateTime.sunday) {
    if (weekdayLabelConfig == null) {
      this.weekdayLabelConfig = WeekdayLabelConfig();
    }

    if (paletteConfig == null) {
      this.paletteConfig = PaletteConfig();
    }

    if (dayCellConfig == null) {
      this.dayCellConfig = CellConfig();
    }
  }
}
