import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shoppist/features/settings/blocs/notifications/notifications_cubit.dart';
import 'package:shoppist/i18n/strings.g.dart';

class NotificationsTiles extends StatelessWidget {
  const NotificationsTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final notificationCubit = context.read<NotificationsCubit>();

        return Column(
          children: [
            SwitchListTile(
              title: Text(context.t.push.turn_on),
              contentPadding: EdgeInsets.zero,
              value: state.settings.isNotificationsEnabled,
              onChanged: (value) {
                Permission.notification.request();
                notificationCubit.changeNotificationSettings(
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
                  ? notificationCubit.changeNotificationSettings(
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
                  ? notificationCubit.changeNotificationSettings(
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
                  onTap: () async {
                    if (state.settings.isNotificationsEnabled &&
                        state.settings.isDailyEnabled) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime:
                            state.settings.dailyTimeOfDay ?? TimeOfDay.now(),
                      );

                      if (time != null) {
                        notificationCubit.changeNotificationSettings(
                          dailyTime: '${time.hour}:${time.minute}',
                        );
                      }
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        state.settings.dailyTimeFormatted ?? t.push.not_set,
                        style: TextStyle(
                          fontSize: 16,
                          color: state.settings.isNotificationsEnabled &&
                                  state.settings.isDailyEnabled
                              ? null
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.edit,
                        color: Theme.of(context).hintColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
