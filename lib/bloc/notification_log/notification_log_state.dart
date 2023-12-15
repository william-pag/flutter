part of 'notification_log_bloc.dart';

class NotificationLogState extends Equatable {
  final Progress status;
  final List<NotificationLog> notiLogs;
  const NotificationLogState({required this.status, required this.notiLogs});

  @override
  List<Object> get props => [status, notiLogs];
}

final class NotificationLogInitial extends NotificationLogState {
  const NotificationLogInitial(
      {super.status = Progress.loading,
      super.notiLogs = const <NotificationLog>[]});
}
