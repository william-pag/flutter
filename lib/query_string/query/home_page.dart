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
  String getPE({
    required int departmentId,
    required int strategyId,
  }) {
    if (departmentId == 0 && strategyId == 0) {
      return '''
        {
          performanceEvaluation {
            percentComplete
            complete
            overall
          }
        }
      ''';
    }
    return '''
      {
        performanceEvaluation(departmentIds: $departmentId, strategyId: $strategyId) {
          percentComplete
          complete
          overall
        }
      }
    ''';
  }
  String getLOC({
    required int departmentId,
    required int strategyId,
  }) {
    if (departmentId == 0 && strategyId == 0) {
      return '''
        {
          listContributors {
            percentComplete
            complete
            overall
          }
        }
      ''';
    }
    return '''
      {
        listContributors(departmentIds: $departmentId, strategyId: $strategyId) {
          percentComplete
          complete
          overall
        }
      }
    ''';
  }

  String getSA({
    required int departmentId,
    required int strategyId,
  }) {
    if (departmentId == 0 && strategyId == 0) {
      return '''
        {
          selfAssessments {
            percentComplete
            complete
            overall
          }
        }
      ''';
    }
    return '''
      {
        selfAssessments(departmentIds: $departmentId, strategyId: $strategyId) {
          percentComplete
          complete
          overall
        }
      }
    ''';
  }

  String getListPE({
    required int departmentId,
    required int strategyId,
  }) {
    if (departmentId == 0 && strategyId == 0) {
      return '''
        {
          getListPerformanceEvaluations {
            isComplete
            completedPercentage
            completePerformance
            totalPerformance
            user {
              id
              name
              image
            }
          }
        }
      ''';
    }
    return '''
      {
        getListPerformanceEvaluations(departmentIds: $departmentId, strategyId: $strategyId) {
          isComplete
          completedPercentage
          completePerformance
          totalPerformance
          user {
            id
            name
            image
          }
        }
      }
    ''';
  }
}
