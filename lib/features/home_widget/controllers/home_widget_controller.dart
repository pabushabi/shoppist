import 'package:home_widget/home_widget.dart';
import 'package:shoppist/features/home_widget/models/home_widget_data.dart';

class HomeWidgetController {
  static const String _widgetName = 'HomeWidgetReceiver';
  static const String _headline = 'headline';
  static const String _headlineTitle = 'Список';
  static const String _item1 = 'list_item_1';
  static const String _item2 = 'list_item_2';
  static const String _item3 = 'list_item_3';
  static const String _item4 = 'list_item_4';
  static const String _item5 = 'list_item_5';

  static void updateWidget(HomeWidgetData data) {
    HomeWidget.saveWidgetData(_headline, data.headline ?? _headlineTitle);
    HomeWidget.saveWidgetData(_item1, data.item1);
    HomeWidget.saveWidgetData(_item2, data.item2);
    HomeWidget.saveWidgetData(_item3, data.item3);
    HomeWidget.saveWidgetData(_item4, data.item4);
    HomeWidget.saveWidgetData(_item5, data.item5);

    HomeWidget.updateWidget(androidName: _widgetName);
  }

  static void pinWidget() =>
      HomeWidget.requestPinWidget(androidName: 'HomeAppWidget');
}
