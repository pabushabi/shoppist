import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NotificationSettingsModel extends Equatable {
  final bool isNotificationsEnabled;
  final bool isNearlyEndEnabled;
  final bool isDailyEnabled;
  final String? dailyTime;

  const NotificationSettingsModel({
    required this.isNotificationsEnabled,
    required this.isNearlyEndEnabled,
    required this.isDailyEnabled,
    this.dailyTime,
  });

  String? get dailyTimeFormatted => dailyTime != null
      ? '${dailyTime!.split(':').first.padLeft(2, '0')}:${dailyTime!.split(':').last.padLeft(2, '0')}'
      : null;

  TimeOfDay? get dailyTimeOfDay => dailyTime != null
      ? TimeOfDay(
          hour: int.parse(dailyTime!.split(':').first),
          minute: int.parse(dailyTime!.split(':').last))
      : null;

  int? get getHour => int.tryParse(dailyTime!.split(':').first);

  int? get getMinute => int.tryParse(dailyTime!.split(':').last);

  factory NotificationSettingsModel.initial() =>
      const NotificationSettingsModel(
        isNotificationsEnabled: false,
        isNearlyEndEnabled: false,
        isDailyEnabled: false,
      );

  @override
  List<Object?> get props => [
        isNotificationsEnabled,
        isNearlyEndEnabled,
        isDailyEnabled,
        dailyTime,
      ];
}
