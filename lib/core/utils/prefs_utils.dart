import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppist/core/constants/constants.dart';

class PrefsUtils {
  final SharedPreferences prefs;

  const PrefsUtils(this.prefs);

  Future<void> saveLocale(String locale) async =>
      await prefs.setString(PrefsKeys.appLocale, locale);

  String? getLocale() => prefs.getString(PrefsKeys.appLocale);

  Future<void> setNotFirstOpen() async {
    await prefs.setBool(PrefsKeys.isFirstOpen, false);
  }

  bool isFirstOpen() {
    final isFirstOpen = prefs.getBool(PrefsKeys.isFirstOpen);
    if (isFirstOpen != null) {
      return isFirstOpen;
    }
    return true;
  }

  Future<void> saveFamilyCode(String code) async =>
      await prefs.setString(PrefsKeys.familyCode, code);

  String getFamilyCode() {
    final familyCode = prefs.getString(PrefsKeys.familyCode);
    if (familyCode != null) return familyCode;
    return '';
  }

  Future<void> saveTags(List<String> tags) async {
    await prefs.setStringList(PrefsKeys.tags, tags);
  }

  List<String>? getTags() => prefs.getStringList(PrefsKeys.tags);

  void deleteTags() => prefs.remove(PrefsKeys.tags);
}
