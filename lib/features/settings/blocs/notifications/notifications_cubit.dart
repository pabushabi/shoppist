import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppist/features/settings/models/notification_settings_model.dart';
import 'package:shoppist/features/settings/repositories/notifications_repository.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationSettingsRepository _repository;

  NotificationsCubit(this._repository) : super(NotificationsState.initial()){
    getNotificationSettings();
  }

  void getNotificationSettings() {
    final settings = _repository.getNotificationSettings();
    emit(
      state.copyWith(
        settings: NotificationSettingsModel(
          isNotificationsEnabled: settings.isNotificationsEnabled,
          isNearlyEndEnabled: settings.isNearlyEndEnabled,
          isDailyEnabled: settings.isDailyEnabled,
          dailyTime: settings.dailyTime,
        ),
      ),
    );
  }

  void changeNotificationSettings({
    bool? isNotificationEnabled,
    bool? isNearlyEndEnabled,
    bool? isDailyEnabled,
    String? dailyTime,
  }) {
    _repository.saveNotificationSettings(
      isNotificationEnabled,
      isNearlyEndEnabled,
      isDailyEnabled,
      dailyTime,
    );
    emit(
      state.copyWith(
        settings: NotificationSettingsModel(
          isNotificationsEnabled:
              isNotificationEnabled ?? state.settings.isNotificationsEnabled,
          isNearlyEndEnabled:
              isNearlyEndEnabled ?? state.settings.isNearlyEndEnabled,
          isDailyEnabled: isDailyEnabled ?? state.settings.isDailyEnabled,
          dailyTime: dailyTime ?? state.settings.dailyTime,
        ),
      ),
    );
  }
}
