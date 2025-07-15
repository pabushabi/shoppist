import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/settings/blocs/theme/app_theme_cubit.dart';
import 'package:shoppist/features/settings/widgets/settings_tile_widget.dart';
import 'package:shoppist/i18n/strings.g.dart';

class ThemeTile extends StatelessWidget {
  const ThemeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTileWidget(
      title: context.t.settings.theme,
      rightWidget: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return SegmentedButton(
            segments: ThemeMode.values
                .map(
                  (theme) => ButtonSegment(
                    value: theme,
                    icon: switch (theme) {
                      ThemeMode.system => const Icon(Icons.brightness_auto),
                      ThemeMode.dark => const Icon(Icons.dark_mode_outlined),
                      ThemeMode.light => const Icon(Icons.light_mode_outlined),
                    },
                  ),
                )
                .toList(),
            selected: {mode},
            onSelectionChanged: (value) =>
                context.read<AppThemeCubit>().setTheme(value.first),
          );
        },
      ),
    );
  }
}
