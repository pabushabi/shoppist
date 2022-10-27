// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../features/home/blocs/shopping_list_cubit.dart' as _i4;
import 'app_injectable_module.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appInjectableModule = _$AppInjectableModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => appInjectableModule.prefs,
    preResolve: true,
  );
  gh.factory<_i4.ShoppingListCubit>(() => _i4.ShoppingListCubit());
  return get;
}

class _$AppInjectableModule extends _i5.AppInjectableModule {}
