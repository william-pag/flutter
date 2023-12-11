import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/query_string/query/get_deadline.dart';
import 'package:pag_flutter/query_string/query/query.dart';

class DepartmentService {
  static final shard = DepartmentService();

  Future<ResponseDAO<List<Department>>> getDepartments() async {
    final String queryStr = getDepartmentsStr();
    final response = await HttpClient.shard.query(queryStr);
    if (response.hasError) {
      return ResponseDAO(
        hasError: true,
        error: response.error,
      );
    } else {
      final List<Department> departments = List.from(
          Departments.fromJson(response.data).data.getAllDepartments)
        ..insert(0, Department(id: 0, name: 'All Departments', strategy: null));
      return ResponseDAO(
        hasError: false,
        data: departments,
      );
    }
  }

  Future<ResponseDAO<List<ResponseDeadline>>> getDeadlines({
    int stategyId = 0,
    int departmentId = 0,
  }) async {
    final String queryStr = getDeadlinesStr(
      stategyId: stategyId,
      departmentId: departmentId,
    );
    final response = await HttpClient.shard.query(queryStr);
    if (response.hasError) {
      return ResponseDAO(
        hasError: true,
        error: response.error,
      );
    }

    const List<ResponseDeadline> responseDeadline = <ResponseDeadline>[];

    final List<GetAllDepartmentDeadlines> rawDeadlines =
        Deadlines.fromJson(response.data).data.getAllDepartments;
    for (var i = 0; i < rawDeadlines.length; i++) {
      final GetAllDepartmentDeadlines deadlines = rawDeadlines[i];
      final department = '${deadlines.strategy!.name} - ${deadlines.name}';
      String deadlineLoc = 'Invalid Date';
      if(deadlines.deadlineLoc != null) {
        deadlineLoc = '${DateTime.now().difference(deadlines.deadlineLoc!).inDays} days';
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        name: deadlines.name,
        deadline: deadlineLoc,
        department: department,
        subDepartment: 'List Of Contributors',
      ));
      String deadlineConfirmLoc = 'Invalid Date';
      if (deadlines.deadlineConfirmLoc != null) {
        deadlineConfirmLoc =
            '${DateTime.now().difference(deadlines.deadlineConfirmLoc!).inDays} days';
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        name: deadlines.name,
        deadline: deadlineConfirmLoc,
        department: department,
        subDepartment: 'Confirm LOC',
      ));
      String deadlineSelfAssessment = 'Invalid Date';
      if (deadlines.deadlineConfirmLoc != null) {
        deadlineConfirmLoc =
            '${DateTime.now().difference(deadlines.deadlineSelfAssessment!).inDays} days';
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        name: deadlines.name,
        deadline: deadlineSelfAssessment,
        department: department,
        subDepartment: 'Self Assessment',
      ));
      String deadlinePerformanceEvaluation = 'Invalid Date';
      if (deadlines.deadlineConfirmLoc != null) {
        deadlineConfirmLoc =
            '${DateTime.now().difference(deadlines.deadlinePerformanceEvaluation!).inDays} days';
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        name: deadlines.name,
        deadline: deadlinePerformanceEvaluation,
        department: department,
        subDepartment: 'Performance Evaluation',
      ));
    }
    return ResponseDAO(hasError: false, data: responseDeadline);
  }
}
