import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppist/features/home/views/home_page.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    if (state.uri.scheme == 'glance-action' && state.uri.path == '/CALLBACK') {
      return '/';
    }

    return null;
  }
);
