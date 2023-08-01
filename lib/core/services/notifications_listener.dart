import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/services/notification_controller.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/settings/blocs/notifications/notifications_cubit.dart';
import 'package:shoppist/i18n/strings.g.dart';

void notificationListener() {
  ShoppingListState prevState = getIt<ShoppingListCubit>().state;

  getIt<ShoppingListCubit>().stream.listen(
    (state) {
      if (!getIt<NotificationsCubit>().state.settings.isNotificationsEnabled) {
        return;
      }
      if (prevState.items != state.items) {
        var shouldNotifyItems = state.items
            .where((element) => element.amount <= 1)
            .toList()
          ..sort((a, b) => a.amount.compareTo(b.amount));
        if (shouldNotifyItems.isNotEmpty) {
          String body = t.push.attention;
          for (var item in shouldNotifyItems) {
            body +=
                '${item.name} ${item.amount == 0 ? '(${t.push.ran_out})' : '(${item.amount} ${t.push.left})'}, ';
          }
          if (getIt<NotificationsCubit>().state.settings.isNearlyEndEnabled) {
            NotificationController.removeOldScheduled('alerts');
            NotificationController.scheduleNewNotification(
              channelKey: 'alerts',
              title: t.push.productsRanOut,
              body: body.replaceRange(body.length - 2, body.length, ''),
              schedule: NotificationCalendar.fromDate(
                date: DateTime.now().add(const Duration(hours: 2)),
              ),
            );
          }

          if (getIt<NotificationsCubit>().state.settings.isDailyEnabled &&
              getIt<NotificationsCubit>().state.settings.dailyTime != null) {
            NotificationController.removeOldScheduled('reports');
            NotificationController.scheduleNewNotification(
              channelKey: 'reports',
              title: t.push.daily_report,
              body: body.replaceRange(body.length - 2, body.length, ''),
              schedule: NotificationCalendar(
                hour: getIt<NotificationsCubit>().state.settings.getHour,
                minute: getIt<NotificationsCubit>().state.settings.getMinute,
                repeats: true,
              ),
            );
          }
        }
      }

      prevState = state;
    },
  );
}
