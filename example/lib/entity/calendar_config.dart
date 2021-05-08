import 'package:example/entity/palette_config.dart';
import 'package:example/entity/weekday_label_config.dart';

class CalendarConfig {
  WeekdayLabelConfig weekdayLabelConfig;
  PaletteConfig paletteConfig;

  final int beginWeekday;
  final String remainEventCountPattern;

  CalendarConfig({
    this.weekdayLabelConfig,
    this.paletteConfig,
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
  }
}
