import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/notification.dart';
import 'package:pag_flutter/query_string/query/notification.dart';

class NotificationService {
  static final shared = NotificationService();

  Future<ResponseDAO<List<NotificationShort>>> getMyNotifications() async {
    final queryStr = NotificationQueryString.shard.getAllNotifications();
    final response = await HttpClient.shard.query(queryStr);
    if (response.hasError) {
      return ResponseDAO(
        hasError: true,
        error: response.error,
      );
    } else {
      return ResponseDAO(
        hasError: false,
        data: NotificationShorts.fromJson(response.data)
            .data
            .getAllNotificationShorts,
      );
    }
  }
}
