import 'package:flutter/material.dart';
import 'package:shoppist/core/services/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingListCubit>(
          create: (BuildContext context) => getIt<ShoppingListCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'shoppist',
        theme: ThemeData(
          // colorSchemeSeed: const Color(0xff6750a4),
          useMaterial3: true,
        ),
      ),
    );
  }
}
