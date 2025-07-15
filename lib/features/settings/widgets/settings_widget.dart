import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/core/ui_kit/substrate_widget.dart';
import 'package:shoppist/features/settings/widgets/family_tile.dart';
import 'package:shoppist/features/settings/widgets/language_tile.dart';
import 'package:shoppist/features/settings/widgets/notifications_tiles.dart';
import 'package:shoppist/features/settings/widgets/theme_tile.dart';
import 'package:shoppist/i18n/strings.g.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      title: Translations.of(context).settings.settings,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      body: const [
        SubstrateWidget(
          child: Column(
            children: [
              LanguageTile(),
              Divider(),
              FamilyTile(),
              Divider(),
              NotificationsTiles(),
              Divider(),
              // TagsTile(), //todo add tags editing menu
              SizedBox(height: 4),
              ThemeTile(),
            ],
          ),
        ),
      ],
    );
  }
}
