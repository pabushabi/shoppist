import 'package:equatable/equatable.dart';

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
