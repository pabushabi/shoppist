import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';
import 'package:uuid/uuid.dart';

part 'family_code_state.dart';

class FamilyCodeCubit extends Cubit<FamilyCodeState> {
  FamilyCodeCubit() : super(const FamilyCodeState(code: '')) {
    init();
  }

  void init() {
    if (getIt<PrefsUtils>().isFirstOpen() ||
        getIt<PrefsUtils>().getFamilyCode().isEmpty) {
      final code = const Uuid().v4().split('-').first;
      getIt<PrefsUtils>().saveFamilyCode(code);
      emit(state.copyWith(code: code));
    } else {
      final code = getIt<PrefsUtils>().getFamilyCode();
      emit(state.copyWith(code: code));
    }
  }

  void changeCode(String newCode) {
    if (newCode.isEmpty) return;
    getIt<PrefsUtils>().saveFamilyCode(newCode);
    emit(state.copyWith(code: newCode));
  }
}
