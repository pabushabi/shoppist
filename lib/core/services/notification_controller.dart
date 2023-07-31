import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
  static ReceivedAction? initialAction;
  static const String _channel = 'alerts';

  static Future<void> init() async {
    await AwesomeNotifications().initialize(
      'resource://mipmap/ic_notification',
      [
        NotificationChannel(
          channelKey: _channel,
          channelName: 'Alerts',
          channelDescription: 'Pushs about products what about to run out',
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Private,
          defaultColor: Colors.orange,
          ledColor: Colors.orange,
        ),
      ],
      debug: true,
    );

    // initialAction = await AwesomeNotifications()
    //     .getInitialNotificationAction(removeFromActionEvents: false);
    startListeningNotificationEvents();
  }

  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications().actionStream.listen((event) {
      log('action listener $event');
    });
  }

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
    ReceivedAction action,
  ) async {
    log('Message sent via notification input: "${action.buttonKeyInput}"');
  }

  static Future<void> createNewNotification({
    required String title,
    required String body,
    String? channelKey,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: channelKey ?? _channel,
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
        payload: {'notificationId': '1234567890'},
      ),
      // actionButtons: [
      //   NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
      // ],
    );
  }

  static Future<void> scheduleNewNotification({
    required String title,
    required String body,
    String? channelKey,
    NotificationSchedule? schedule,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: channelKey ?? _channel,
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
        payload: {'notificationId': '1234567890'},
      ),
      // actionButtons: [
      //   NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
      // ],
      schedule: schedule ?? NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(hours: 2)),
      ),
    );
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
