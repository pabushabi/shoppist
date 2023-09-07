import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';

abstract class SortRepository {
  SortModel getCurrentSort();

  void setCurrentSort(SortModel sort);
}

class SortRepositoryImpl implements SortRepository {
  @override
  SortModel getCurrentSort() {
    final sort = getIt<PrefsUtils>().getSort();
    SortModel model;
    switch (sort) {
      case 'SortModel.type':
        model = SortModel.type;
        break;
      case 'SortModel.alphabetic':
        model = SortModel.alphabetic;
        break;
      default:
        model = SortModel.none;
        break;
    }
    return model;
  }

  @override
  void setCurrentSort(SortModel sort) {
    getIt<PrefsUtils>().saveSort('$sort');
  }
}
