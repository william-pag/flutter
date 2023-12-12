String getRemindersStr({int userId = 0}) {
  return '''
  {
    getAllNotificationLogs(userId: $userId) {
      id
      subject
      content
      toName
      key
      createdAt
    }
  }
  ''';
}
