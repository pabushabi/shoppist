import 'package:shoppist/i18n/strings.g.dart';

class HomeWidgetData {
  final String? headline;
  final String? item1;
  final String? item2;
  final String? item3;
  final String? item4;
  final String? item5;

  HomeWidgetData({
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.headline,
  });

  factory HomeWidgetData.fromList(List<String> list) {
    assert(list.length <= 5);

    return switch (list.length) {
      0 => HomeWidgetData(item1: t.widget.wowEmpty, item2: t.widget.goodWork),
      1 => HomeWidgetData(item1: list.first),
      2 => HomeWidgetData(item1: list.first, item2: list[1]),
      3 => HomeWidgetData(item1: list.first, item2: list[1], item3: list[2]),
      4 => HomeWidgetData(
        item1: list.first,
        item2: list[1],
        item3: list[2],
        item4: list[3],
      ),
      5 => HomeWidgetData(
        item1: list.first,
        item2: list[1],
        item3: list[2],
        item4: list[3],
        item5: list[4],
      ),
      _ => HomeWidgetData(),
    };
  }
}