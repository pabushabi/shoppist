import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Главный подключаемый модуль для di
@module
abstract class AppInjectableModule {
  /// Инициализирует  [SharedPreferences]
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
