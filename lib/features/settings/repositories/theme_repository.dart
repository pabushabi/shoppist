import 'package:flutter/material.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';

abstract class ThemeRepository {
  void saveTheme(ThemeMode theme);

  ThemeMode getTheme();
}

class ThemeRepositoryImpl extends ThemeRepository {
  @override
  ThemeMode getTheme() {
    final theme = getIt<PrefsUtils>().getTheme();
    return switch (theme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  @override
  void saveTheme(ThemeMode theme) {
    final themeString = switch (theme) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    getIt<PrefsUtils>().setTheme(themeString);
  }
}
