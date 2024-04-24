import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shoppist/core/services/notifications_listener.dart';

class NotificationController {
  static ReceivedAction? initialAction;

  static Future<void> init() async {
    await AwesomeNotifications().initialize(
      'resource://mipmap/ic_notification',
      [
        NotificationChannel(
          channelKey: 'alerts',
          channelName: 'Alerts',
          channelDescription: 'Alerts about products what about to run out',
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Private,
          // defaultColor: Colors.orange,
          channelShowBadge: true,
        ),
        NotificationChannel(
          channelKey: 'reports',
          channelName: 'Reports',
          channelDescription: 'Daily reports',
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Private,
          // defaultColor: Colors.orange,
          channelShowBadge: true,
        ),
      ],
      debug: true,
    );

    // initialAction = await AwesomeNotifications()
    //     .getInitialNotificationAction(removeFromActionEvents: false);
    // startListeningNotificationEvents();
    notificationListener();
  }

  static Future<void> startListeningNotificationEvents() async {
    // AwesomeNotifications().actionStream.listen((event) {
    //   log('action listener $event');
    // });
  }

  static Future<void> createNewNotification({
    required String title,
    required String body,
    required String channelKey,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: channelKey,
        title: title,
        body: body,
        notificationLayout: NotificationLayout.BigText,
      ),
    );
  }

  static Future<void> scheduleNewNotification({
    required String channelKey,
    required String title,
    required String body,
    NotificationSchedule? schedule,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: channelKey,
        title: title,
        body: body,
        notificationLayout: NotificationLayout.BigText,
      ),
      schedule: schedule ??
          NotificationCalendar.fromDate(
            date: DateTime.now().add(const Duration(hours: 2)),
          ),
    );
  }

  static Future<void> removeOldScheduled(String channel) async {
    final scheduled = await AwesomeNotifications().listScheduledNotifications();
    final withChannel =
        scheduled.where((e) => e.content?.channelKey == channel);
    if (withChannel.isNotEmpty) {
      AwesomeNotifications().cancelSchedulesByChannelKey(channel);
    }
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
