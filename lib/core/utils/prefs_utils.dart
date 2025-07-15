import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppist/core/constants/constants.dart';

class PrefsUtils {
  final SharedPreferences _prefs;

  const PrefsUtils(this._prefs);

  Future<void> saveLocale(String locale) async =>
      await _prefs.setString(PrefsKeys.appLocale, locale);

  String? getLocale() => _prefs.getString(PrefsKeys.appLocale);

  Future<void> setNotFirstOpen() async {
    await _prefs.setBool(PrefsKeys.isFirstOpen, false);
  }

  bool isFirstOpen() {
    final isFirstOpen = _prefs.getBool(PrefsKeys.isFirstOpen);
    if (isFirstOpen != null) {
      return isFirstOpen;
    }
    return true;
  }

  Future<void> saveFamilyCode(String code) async =>
      await _prefs.setString(PrefsKeys.familyCode, code);

  String getFamilyCode() {
    final familyCode = _prefs.getString(PrefsKeys.familyCode);
    if (familyCode != null) return familyCode;
    return '';
  }

  Future<void> saveTags(List<String> tags) async {
    await _prefs.setStringList(PrefsKeys.tags, tags);
  }

  List<String>? getTags() => _prefs.getStringList(PrefsKeys.tags);

  void deleteTags() => _prefs.remove(PrefsKeys.tags);

  Future<void> setIsNotificationsEnabled(bool value) async =>
      await _prefs.setBool(PrefsKeys.isNotificationsEnabled, value);

  Future<void> setIsNearlyEndEnabled(bool value) async =>
      await _prefs.setBool(PrefsKeys.isNearlyEndEnabled, value);

  String getSort() {
    final sort = _prefs.getString(PrefsKeys.sort);
    if (sort != null) return sort;
    return 'SortModel.none';
  }

  Future<void> saveSort(String sort) async =>
      await _prefs.setString(PrefsKeys.sort, sort);
  Future<void> setIsDailyEnabled(bool value) async =>
      await _prefs.setBool(PrefsKeys.isDailyEnabled, value);

  Future<void> setDailyTime(String value) async {
    await _prefs.setString(PrefsKeys.dailyTime, value);
  }

  bool getIsNotificationsEnabled() {
    final isEnabled =  _prefs.getBool(PrefsKeys.isNotificationsEnabled);
    if (isEnabled != null) return isEnabled;
    return false;
  }

  bool getIsNearlyEndEnabled() {
    final isEnabled = _prefs.getBool(PrefsKeys.isNearlyEndEnabled);
    if (isEnabled != null) return isEnabled;
    return false;
  }

  bool getIsDailyEnabled() {
    final isEnabled = _prefs.getBool(PrefsKeys.isDailyEnabled);
    if (isEnabled != null) return isEnabled;
    return false;
  }

  String getDailyTime() {
    final time = _prefs.getString(PrefsKeys.dailyTime);
    if (time != null) return time;
    return '';
  }

  Future<void> setTheme(String theme) async {
    await _prefs.setString(PrefsKeys.theme, theme);
  }

  String getTheme() {
    final theme = _prefs.getString(PrefsKeys.theme);
    if (theme != null) return theme;
    return '';
  }
}
