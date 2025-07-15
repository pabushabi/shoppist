import 'package:flutter/material.dart';
import 'package:shoppist/features/settings/widgets/settings_tile_widget.dart';
import 'package:shoppist/i18n/strings.g.dart';

class TagsTile extends StatelessWidget {
  const TagsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTileWidget(
      title: context.t.tag.menu,
      rightWidget: OutlinedButton(
        onPressed: () {}, //todo add tags editing menu
        // onPressed: () => showTagEditBottomSheet(context),
        child: Text(context.t.tag.enter),
      ),
    );

  }
}
