part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final NotificationSettingsModel settings;

  const NotificationsState({
    required this.settings,
  });

  factory NotificationsState.initial() => NotificationsState(
        settings: NotificationSettingsModel.initial(),
      );

  NotificationsState copyWith({NotificationSettingsModel? settings}) =>
      NotificationsState(settings: settings ?? this.settings);

  @override
  List<Object?> get props => [settings];
}
