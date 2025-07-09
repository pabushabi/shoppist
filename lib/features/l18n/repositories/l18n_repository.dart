import 'dart:async';
import 'dart:io';

import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';

abstract class L18nRepository {
  Stream<String> getLocale();

  Future saveLocale(String locale);

  void dispose();
}

class L18nRepositoryImpl implements L18nRepository {
  L18nRepositoryImpl() {
    _init();
  }

  final _controller = StreamController<String>();

  void _init() {
    try {
      final locale = getIt<PrefsUtils>().getLocale();

      if (locale == null) {
        final systemLocale = Platform.localeName;
        late final String locale;

        if (systemLocale.substring(0, 2) == Locales.ru) {
          locale = Locales.ru;
        } else {
          locale = Locales.en;
        }

        _controller.add(locale);
        saveLocale(locale);
        return;
      }

      if (locale == Locales.en) {
        _controller.add(Locales.en);
        return;
      }

      _controller.add(Locales.ru);
    } catch (_) {
      saveLocale(Locales.ru);
    }
  }

  @override
  Stream<String> getLocale() async* {
    yield* _controller.stream;
  }

  @override
  Future<void> saveLocale(String locale) async {
    _controller.add(locale);
    getIt<PrefsUtils>().saveLocale(locale);
  }

  @override
  void dispose() => _controller.close();
}
