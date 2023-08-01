import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/home/repositories/shopping_list_repository.dart';
import 'package:shoppist/features/home/repositories/tags_repository.dart';
import 'package:shoppist/features/l18n/blocs/l18n_cubit.dart';
import 'package:shoppist/features/l18n/repositories/l18n_repository.dart';
import 'package:shoppist/features/settings/blocs/family_code/family_code_cubit.dart';
import 'package:shoppist/features/settings/blocs/notifications/notifications_cubit.dart';
import 'package:shoppist/features/settings/repositories/notifications_repository.dart';

/// Инстанс [GetIt]
final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //====================TOOLS==========
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);
  getIt.registerLazySingleton(() => PrefsUtils(getIt()));

  final firestore = FirebaseFirestore.instance;
  getIt.registerLazySingleton(() => firestore);

  //====================HOME===========
  getIt.registerLazySingleton(() => ShoppingListCubit(getIt()));
  getIt.registerLazySingleton<ShoppingListRepository>(
    () => ShoppingListRepositoryImpl(getIt()),
  );
  //===================FAMILY==========
  getIt.registerSingleton<FamilyCodeCubit>(FamilyCodeCubit());
  //===================PUSH============
  getIt.registerLazySingleton<NotificationSettingsRepository>(
    () => NotificationSettingsRepositoryImpl(),
  );
  getIt.registerLazySingleton<NotificationsCubit>(
    () => NotificationsCubit(getIt()),
  );
  //===================TAGS============
  getIt.registerLazySingleton<TagsRepository>(() => TagsRepositoryImpl());
  getIt.registerLazySingleton<TagsCubit>(() => TagsCubit(getIt()));
  //===================L18N============
  getIt.registerLazySingleton(() => L18nCubit(l18nRepository: getIt()));
  getIt.registerLazySingleton<L18nRepository>(
    () => L18nRepositoryImpl(),
  );
}
