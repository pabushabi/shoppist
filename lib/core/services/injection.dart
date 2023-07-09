import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';

/// Инстанс [GetIt]
final GetIt getIt = GetIt.instance;

Future<void> init() async {
  //====================HOME===========
  getIt.registerLazySingleton(() => ShoppingListCubit());

  //====================TOOLS==========
  // final prefs = await SharedPreferences.getInstance();
}
