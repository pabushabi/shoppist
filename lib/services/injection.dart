import 'dart:developer';

import 'package:shoppist/services/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Инстанс [GetIt]
final GetIt getIt = GetIt.instance;

/// Метод для конфигурирования инъекции
@injectableInit
Future<void> configureInjection(String env) async {
  await $initGetIt(getIt, environment: env);
  log('injection successfully configured!', name: '');
}
