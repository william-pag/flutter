String getDeadlinesStr({int stategyId = 0, int departmentId = 0}) {
  return '''
    {
      getAllDepartments(strategyId: $stategyId, departmentId: $departmentId) {
        id
        name
        deadlineLOC
        deadlineConfirmLOC
        deadlineSelfAssessment
        deadlinePerformanceEvaluation
        strategy {
          id
          name
        }
      }
    }
  ''';
}