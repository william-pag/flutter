class NotificationLogs {
  DataNotificationLog data;

  NotificationLogs({
    required this.data,
  });

  factory NotificationLogs.fromJson(Map<String, dynamic> json) =>
      NotificationLogs(
        data: DataNotificationLog.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataNotificationLog {
  List<NotificationLog> getAllNotificationLogs;

  DataNotificationLog({
    required this.getAllNotificationLogs,
  });

  factory DataNotificationLog.fromJson(Map<String, dynamic> json) =>
      DataNotificationLog(
        getAllNotificationLogs: List<NotificationLog>.from(
            json["getAllNotificationLogs"]
                .map((x) => NotificationLog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllNotificationLogs":
            List<dynamic>.from(getAllNotificationLogs.map((x) => x.toJson())),
      };
}

class NotificationLog {
  int id;
  String subject;
  String content;
  String toName;
  String key;
  DateTime createdAt;

  NotificationLog({
    required this.id,
    required this.subject,
    required this.content,
    required this.toName,
    required this.key,
    required this.createdAt,
  });

  factory NotificationLog.fromJson(Map<String, dynamic> json) =>
      NotificationLog(
        id: json["id"],
        subject: json["subject"],
        content: json["content"],
        toName: json["toName"],
        key: json["key"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "content": content,
        "toName": toName,
        "key": key,
        "createdAt": createdAt.toIso8601String(),
      };
}
