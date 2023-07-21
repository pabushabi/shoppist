import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/features/l18n/repositories/l18n_repository.dart';

part 'l18n_state.dart';

class L18nCubit extends Cubit<L18nState> {
  final L18nRepository _l18nRepository;

  L18nCubit({required L18nRepository l18nRepository})
      : _l18nRepository = l18nRepository,
        super(const L18nState()) {
    getCurrentLocale();
  }

  late StreamSubscription<String> _localeSubscription;

  void getCurrentLocale() {
    log('get current locale');
    _localeSubscription = _l18nRepository.getLocale().listen(
      (locale) {
        emit(state.copyWith(languageCode: locale));
      },
    );
  }

  void changeLocale(String languageCode) {
    if (languageCode == state.languageCode) {
      return;
    }
    _l18nRepository.saveLocale(languageCode);
  }

  @override
  Future<void> close() {
    _localeSubscription.cancel();
    _l18nRepository.dispose();
    return super.close();
  }
}
