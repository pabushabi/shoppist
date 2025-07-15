import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/features/l18n/blocs/l18n_cubit.dart';
import 'package:shoppist/features/settings/widgets/settings_tile_widget.dart';
import 'package:shoppist/i18n/strings.g.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTileWidget(
      title: context.t.settings.language,
      rightWidget: BlocBuilder<L18nCubit, L18nState>(
        builder: (context, state) {
          return DropdownButton2(
            value: state.languageCode,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
            items: [
              ...Locales.all.map(
                    (element) => DropdownMenuItem(
                  value: element,
                  child: Text(element),
                ),
              ),
            ],
            onChanged: (lang) {
              if (lang != null && lang != 'sys') {
                context.read<L18nCubit>().changeLocale(lang);
              }
            },
          );
        },
      ),
    );
  }
}
