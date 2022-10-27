import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit.dart';
import 'package:shoppist/features/home/views/home_page.dart';
import 'package:shoppist/services/injection.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<ShoppingListCubit>(),
          child: const HomePage(),
        );
      },
    ),
    // GoRoute(
    //   path: '/b',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ScreenB();
    //   },
    // ),
  ],
);