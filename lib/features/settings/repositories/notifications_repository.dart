import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';
import 'package:shoppist/features/settings/models/notification_settings_model.dart';

abstract class NotificationSettingsRepository {
  void saveNotificationSettings(
    bool? isNotificationEnabled,
    bool? isNearlyEndEnabled,
    bool? isDailyEnabled,
    String? dailyTime,
  );

  NotificationSettingsModel getNotificationSettings();
}

class NotificationSettingsRepositoryImpl
    extends NotificationSettingsRepository {
  @override
  NotificationSettingsModel getNotificationSettings() {
    final bool isNotificationsEnabled =
        getIt<PrefsUtils>().getIsNotificationsEnabled();
    final bool isNearlyEndEnabled = getIt<PrefsUtils>().getIsNearlyEndEnabled();
    final bool isDailyEnabled = getIt<PrefsUtils>().getIsDailyEnabled();
    final String dailyTime = getIt<PrefsUtils>().getDailyTime();

    return NotificationSettingsModel(
      isNotificationsEnabled: isNotificationsEnabled,
      isNearlyEndEnabled: isNearlyEndEnabled,
      isDailyEnabled: isDailyEnabled,
      dailyTime: dailyTime,
    );
  }

  @override
  void saveNotificationSettings(
    bool? isNotificationEnabled,
    bool? isNearlyEndEnabled,
    bool? isDailyEnabled,
    String? dailyTime,
  ) {
    if (isNotificationEnabled != null) {
      getIt<PrefsUtils>().setIsNotificationsEnabled(isNotificationEnabled);
    }
    if (isNearlyEndEnabled != null) {
      getIt<PrefsUtils>().setIsNearlyEndEnabled(isNearlyEndEnabled);
    }
    if (isDailyEnabled != null) {
      getIt<PrefsUtils>().setIsDailyEnabled(isDailyEnabled);
    }
    if (dailyTime != null ) {
      getIt<PrefsUtils>().setDailyTime(dailyTime);
    }
  }
}
