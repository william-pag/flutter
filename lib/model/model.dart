export 'strategy.dart';
export 'error.dart';
export 'login.dart';
export 'me.dart';
export 'department.dart';
export 'deadline.dart';
export 'user.dart';
export 'triple.dart';
export 'pair.dart';
export 'notification_log.dart';

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
