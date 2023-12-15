part of 'notification_log_bloc.dart';

abstract class NotificationLogEvent extends Equatable {}

final class LoadNotificationLog extends NotificationLogEvent {
  @override
  List<Object?> get props => [];
}

final class FilterNotificationLog extends NotificationLogEvent {
  final UserModel user;
  FilterNotificationLog({required this.user});
  @override
  List<Object?> get props => [user];
}
