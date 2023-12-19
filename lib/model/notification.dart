import 'package:pag_flutter/model/model.dart';

class NotificationShorts {
  DataNotificationShort data;

  NotificationShorts({
    required this.data,
  });

  factory NotificationShorts.fromJson(Map<String, dynamic> json) => NotificationShorts(
        data: DataNotificationShort.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataNotificationShort {
  List<NotificationShort> getAllNotificationShorts;

  DataNotificationShort({
    required this.getAllNotificationShorts,
  });

  factory DataNotificationShort.fromJson(Map<String, dynamic> json) => DataNotificationShort(
        getAllNotificationShorts: List<NotificationShort>.from(
            json["getAllNotificationShorts"]
                .map((x) => NotificationShort.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllNotificationShorts":
            List<dynamic>.from(getAllNotificationShorts.map((x) => x.toJson())),
      };
}

class NotificationShort {
  int id;
  Subject subject;
  DateTime updatedAt;

  NotificationShort({
    required this.id,
    required this.subject,
    required this.updatedAt,
  });

  factory NotificationShort.fromJson(Map<String, dynamic> json) =>
      NotificationShort(
        id: json["id"],
        subject: subjectValues.map[json["subject"]]!,
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subjectValues.reverse[subject],
        "updatedAt": updatedAt.toIso8601String(),
      };
}

enum Subject {
  A_LIST_OF_CONTRIBUTORS_NEEDS_YOUR_APPROVAL,
  NOTIFICATION_TO_APPROVE_A_LIST_OF_CONTRIBUTORS,
  NOTIFICATION_TO_COMPLETE_ALL_MISSING_FORMS,
  YOUR_LIST_OF_CONTRIBUTORS_HAS_NOT_BEEN_SUBMITTED,
  YOUR_SELF_ASSESSMENT_HAS_NOT_BEEN_SUBMITTED,
  YOU_HAVE_BEEN_ASKED_TO_SUBMIT_AN_EVALUATION,
  YOU_HAVE_OUTSTANDING_PERFORMANCE_EVALUATIONS
}

final subjectValues = EnumValues({
  "A List of Contributors needs your approval":
      Subject.A_LIST_OF_CONTRIBUTORS_NEEDS_YOUR_APPROVAL,
  "Notification to approve a List of Contributors":
      Subject.NOTIFICATION_TO_APPROVE_A_LIST_OF_CONTRIBUTORS,
  "Notification to complete all missing forms":
      Subject.NOTIFICATION_TO_COMPLETE_ALL_MISSING_FORMS,
  "Your List of Contributors has not been submitted":
      Subject.YOUR_LIST_OF_CONTRIBUTORS_HAS_NOT_BEEN_SUBMITTED,
  "Your Self-assessment has not been submitted":
      Subject.YOUR_SELF_ASSESSMENT_HAS_NOT_BEEN_SUBMITTED,
  "You have been asked to submit an evaluation":
      Subject.YOU_HAVE_BEEN_ASKED_TO_SUBMIT_AN_EVALUATION,
  "You have outstanding performance evaluations":
      Subject.YOU_HAVE_OUTSTANDING_PERFORMANCE_EVALUATIONS
});
