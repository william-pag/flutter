final class HomeQueryStr {
  static final shared = HomeQueryStr();
  String getOverallProgess({
    required int departmentId,
    required int strategyId,
  }) {
    if (departmentId == 0 && strategyId == 0) {
      return '''
        {
          overallProgress {
            percentComplete
            complete
            overall
          }
        }
      ''';
    }
    return '''
      {
        overallProgress(departmentIds: $departmentId, strategyId: $strategyId) {
          percentComplete
          complete
          overall
        }
      }
    ''';
  }
}
