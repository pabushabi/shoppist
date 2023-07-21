import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/features/l18n/blocs/l18n_cubit.dart';
import 'package:shoppist/features/settings/blocs/family_code_cubit.dart';
import 'package:shoppist/features/settings/widgets/edit_family_code_dialog.dart';
import 'package:shoppist/i18n/strings.g.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late final TextEditingController _familyCodeController;
  final TextEditingController _newCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _familyCodeController = (context.read<FamilyCodeCubit>().state.code.isEmpty)
        ? TextEditingController()
        : TextEditingController(
            text: context.read<FamilyCodeCubit>().state.code,
          );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      title: Translations.of(context).settings.settings,
      body: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.settings.language,
              style: const TextStyle(fontSize: 16),
            ),
            BlocBuilder<L18nCubit, L18nState>(
              builder: (context, state) {
                return DropdownButton(
                  value: state.languageCode,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  items: [
                    // DropdownMenuItem(
                    //   value: 'sys',
                    //   child: Text(t.settings.system),
                    // ),
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
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.settings.family_code,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: 120,
              child: TextField(
                controller: _familyCodeController,
                onSubmitted: (val) {
                  context.read<FamilyCodeCubit>().changeCode(val);
                },
                enabled: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) =>
                    EditFamilyCodeDialog(newCodeController: _newCodeController),
              ),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () async => await Clipboard.setData(
                ClipboardData(text: _familyCodeController.text),
              ),
              icon: const Icon(Icons.copy),
            ),
            IconButton(
              onPressed: () => Share.share(_familyCodeController.text),
              icon: const Icon(Icons.share),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     Text(t.settings.theme),
        //     DropdownButton(
        //       items: const [
        //         DropdownMenuItem(value: 'system', child: Text('system')),
        //         DropdownMenuItem(value: 'light', child: Text('light')),
        //         DropdownMenuItem(value: 'dark', child: Text('dark')),
        //       ],
        //       onChanged: (lang) {},
        //     ),
        //   ],
        // ),
        const SizedBox(height: 100),
      ],
    );
  }
}
