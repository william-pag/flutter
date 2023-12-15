import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/service/service.dart';

part 'notification_log_event.dart';
part 'notification_log_state.dart';

class NotificationLogBloc
    extends Bloc<NotificationLogEvent, NotificationLogState> {
  NotificationLogBloc() : super(const NotificationLogInitial()) {
    on<LoadNotificationLog>((
      LoadNotificationLog event,
      Emitter<NotificationLogState> emit,
    ) async {
      emit(const NotificationLogInitial());
      final response = await compute(
        (String token) {
          return ReminderService.shared.getReminders(token: token);
        },
        HttpClient.shard.token,
      );
      if (response.hasError || response.data == null) {
        emit(
          const NotificationLogState(
            status: Progress.error,
            notiLogs: <NotificationLog>[],
          ),
        );
      } else {
        emit(
          NotificationLogState(
            status: Progress.loaded,
            notiLogs: response.data!,
          ),
        );
      }
    });
  }
}
