import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shoppist/features/settings/repositories/theme_repository.dart';


class AppThemeCubit extends Cubit<ThemeMode> {
  AppThemeCubit(this._repository) : super(ThemeMode.system) {
    _getSavedTheme();
  }

  final ThemeRepository _repository;

  void setTheme(ThemeMode mode) {
    emit(mode);
    _saveTheme();
  }

  void _getSavedTheme() {
    final theme = _repository.getTheme();
    emit(theme);
  }

  void _saveTheme() {
    _repository.saveTheme(state);
  }
}
