import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shoppist/core/services/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/l18n/blocs/l18n_cubit.dart';
import 'package:shoppist/features/settings/blocs/family_code/family_code_cubit.dart';
import 'package:shoppist/features/settings/blocs/notifications/notifications_cubit.dart';
import 'package:shoppist/i18n/strings.g.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingListCubit>(
          create: (context) => getIt<ShoppingListCubit>()..getItems(),
        ),
        BlocProvider<L18nCubit>(create: (context) => getIt<L18nCubit>()),
        BlocProvider<FamilyCodeCubit>(
          create: (context) => getIt<FamilyCodeCubit>()..init(),
        ),
        BlocProvider<TagsCubit>(create: (context) => getIt<TagsCubit>()),
        BlocProvider<NotificationsCubit>(
          create: (context) => getIt<NotificationsCubit>(),
        ),
      ],
      child: BlocListener<L18nCubit, L18nState>(
        listenWhen: (prev, next) => prev.languageCode != next.languageCode,
        listener: (context, state) =>
            LocaleSettings.setLocaleRaw(state.languageCode),
        child: MaterialApp.router(
          routerConfig: router,
          title: 'shoppist',
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
