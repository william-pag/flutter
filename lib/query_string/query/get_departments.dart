String getDepartmentsStr({int strategyId = 0}) {
  return '''
  {
    getAllDepartments(strategyId: $strategyId) {
        id
        name
        strategy {
          id
        }
    }
  }
  ''';
}
