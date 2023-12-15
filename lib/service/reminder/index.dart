import 'package:pag_flutter/config/config.dart' show HttpClient, ResponseDAO;
import 'package:pag_flutter/model/model.dart'
    show NotificationLogs, NotificationLog;
import 'package:pag_flutter/query_string/query/query.dart' show getRemindersStr;

final class ReminderService {
  static final shared = ReminderService();
  Future<ResponseDAO<List<NotificationLog>>> getReminders(
      {required String token, int userId = 0}) async {
    final queryStr = getRemindersStr(userId: userId);
    HttpClient.shard.token = token;
    final response = await HttpClient.shard.query(queryStr);
    if (response.hasError) {
      return ResponseDAO(hasError: true, error: response.error);
    } else {
      final data =
          NotificationLogs.fromJson(response.data).data.getAllNotificationLogs;
      return ResponseDAO(hasError: false, data: data);
    }
  }
}
