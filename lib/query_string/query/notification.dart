class NotificationQueryString {
  static final shard = NotificationQueryString();
  
  String getAllNotifications() {
    return '''
      {
        getAllNotificationShorts {
          id
          subject
          updatedAt
        }
      }
    ''';
  }
}