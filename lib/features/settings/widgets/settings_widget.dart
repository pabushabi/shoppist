import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/features/l18n/blocs/l18n_cubit.dart';
import 'package:shoppist/features/settings/blocs/family_code/family_code_cubit.dart';
import 'package:shoppist/features/settings/blocs/notifications/notifications_cubit.dart';
import 'package:shoppist/features/settings/widgets/edit_family_code_dialog.dart';
import 'package:shoppist/i18n/strings.g.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late final TextEditingController _familyCodeController;
  final TextEditingController _newCodeController = TextEditingController();
  late final TextEditingController _dailyTimeTextController;

  @override
  void initState() {
    super.initState();
    _familyCodeController = (context.read<FamilyCodeCubit>().state.code.isEmpty)
        ? TextEditingController()
        : TextEditingController(
            text: context.read<FamilyCodeCubit>().state.code,
          );
    _dailyTimeTextController =
        (context.read<NotificationsCubit>().state.settings.dailyTime == null)
            ? TextEditingController()
            : TextEditingController(
                text:
                    context.read<NotificationsCubit>().state.settings.dailyTime,
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
                return DropdownButton2(
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
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              t.settings.family_code,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: 144,
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => EditFamilyCodeDialog(
                    newCodeController: _newCodeController,
                  ),
                ),
                child: TextField(
                  controller: _familyCodeController,
                  enabled: false,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.edit,
                      color: Colors.black87,
                    ),
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
            ),
            IconButton(
              onPressed: () => Share.share(_familyCodeController.text),
              icon: const Icon(Icons.share),
            ),
          ],
        ),
        const SizedBox(height: 10),
        BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            return Column(
              children: [
                SwitchListTile(
                  title: Text(t.push.turn_on),
                  contentPadding: EdgeInsets.zero,
                  value: state.settings.isNotificationsEnabled,
                  onChanged: (value) {
                    Permission.notification.request();
                    context
                        .read<NotificationsCubit>()
                        .changeNotificationSettings(
                          isNotificationEnabled: value,
                        );
                  },
                ),
                SwitchListTile(
                  title: Text(
                    t.push.is_empty,
                    style: TextStyle(
                      color: !state.settings.isNotificationsEnabled
                          ? Theme.of(context).disabledColor
                          : null,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  value: state.settings.isNearlyEndEnabled,
                  onChanged: (value) => state.settings.isNotificationsEnabled
                      ? context
                          .read<NotificationsCubit>()
                          .changeNotificationSettings(
                            isNearlyEndEnabled: value,
                          )
                      : null,
                ),
                SwitchListTile(
                  title: Text(
                    t.push.reports,
                    style: TextStyle(
                      color: !state.settings.isNotificationsEnabled
                          ? Theme.of(context).disabledColor
                          : null,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  value: state.settings.isDailyEnabled,
                  onChanged: (value) => state.settings.isNotificationsEnabled
                      ? context
                          .read<NotificationsCubit>()
                          .changeNotificationSettings(
                            isDailyEnabled: value,
                          )
                      : null,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.push.time_of_reports,
                      style: TextStyle(
                        fontSize: 16,
                        color: state.settings.isNotificationsEnabled &&
                                state.settings.isDailyEnabled
                            ? null
                            : Theme.of(context).disabledColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (state.settings.isNotificationsEnabled &&
                            state.settings.isDailyEnabled) {
                          showDialog(
                            context: context,
                            builder: (context) => TimePickerDialog(
                              initialTime: TimeOfDay.now(),
                            ),
                          ).then(
                            (value) {
                              context
                                  .read<NotificationsCubit>()
                                  .changeNotificationSettings(
                                    dailyTime: '${value.hour}:${value.minute}',
                                  );
                              _dailyTimeTextController.text =
                                  '${value.hour}:${value.minute}';
                            },
                          );
                        }
                      },
                      child: SizedBox(
                        width: 144,
                        child: TextField(
                          enabled: false,
                          controller: _dailyTimeTextController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.black87,
                            ),
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
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        // Row(
        //   children: [
        //     Text(
        //       t.tag.menu,
        //       style: const TextStyle(fontSize: 16),
        //     ),
        //     const Spacer(),
        //     OutlinedButton(
        //       onPressed: () => showTagEditBottomSheet(context),
        //       child: Text(t.tag.enter),
        //     ),
        //   ],
        // ),
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
