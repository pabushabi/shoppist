import 'package:shoppist/i18n/strings.g.dart';

class Locales {
  static const ru = 'ru';
  static const en = 'en';

  static const all = [ru, en];
}

class PrefsKeys {
  static const appLocale = 'APP_LOCALE';
  static const isFirstOpen = 'IS_FIRST_OPEN';
  static const familyCode = 'FAMILY_CODE';
  static const tags = 'TAGS';
  static const sort = 'SORT';
  static const isNotificationsEnabled = 'PUSH_ENABLED';
  static const isNearlyEndEnabled = 'PUSH_NEARLY_ENABLED';
  static const isDailyEnabled = 'PUSH_DAILY_ENABLED';
  static const dailyTime = 'PUSH_DAILY_TIME';
  static const theme = 'THEME';
}

class ColorTexts {
  static List<String> texts = [
    t.colors.red,
    t.colors.pink,
    t.colors.purple,
    t.colors.deepPurple,
    t.colors.indigo,
    t.colors.blue,
    t.colors.lightBlue,
    t.colors.cyan,
    t.colors.teal,
    t.colors.green,
    t.colors.lightGreen,
    t.colors.lime,
    t.colors.yellow,
    t.colors.amber,
    t.colors.orange,
    t.colors.deepOrange,
    t.colors.brown,
    t.colors.blueGrey,
  ];
}

enum SortModel  {
  alphabetic,
  type,
  none
}
