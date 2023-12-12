import 'package:intl/intl.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/query_string/query/query.dart';

class DepartmentService {
  static final shard = DepartmentService();

  Future<ResponseDAO<List<Department>>> getDepartments({
    int strategyId = 0,
  }) async {
    final String queryStr = getDepartmentsStr(strategyId: strategyId);
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

    final List<GetAllDepartmentDeadlines> rawDeadlines =
        Deadlines.fromJson(response.data).data.getAllDepartments;
    final responseDeadline = _mapDeadline(rawDeadlines);
    return ResponseDAO(hasError: false, data: responseDeadline);
  }

  List<ResponseDeadline> _mapDeadline(
      List<GetAllDepartmentDeadlines> rawDeadlines) {
    List<ResponseDeadline> responseDeadline = <ResponseDeadline>[];
    for (var i = 0; i < rawDeadlines.length; i++) {
      final GetAllDepartmentDeadlines deadlines = rawDeadlines[i];
      final department =
          '${deadlines.strategy?.name != null ? nameValues.reverse[deadlines.strategy?.name] : 'Deadline'} - ${deadlines.name}';
      String deadlineLoc = 'Overdue';
      String dateLoc = 'Invalid Date';
      if (deadlines.deadlineLoc != null) {
        deadlineLoc =
            '${DateTime.now().difference(deadlines.deadlineLoc!).inDays} Days Overdue';
        dateLoc = DateFormat('dd-MM-yyyy').format(deadlines.deadlineLoc!);
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        dateDeadline: dateLoc,
        deadline: deadlineLoc,
        department: department,
        subDepartment: 'List Of Contributors',
      ));
      String deadlineConfirmLoc = 'Overdue';
      String dateConfirmLoc = 'Invalid Date';
      if (deadlines.deadlineConfirmLoc != null) {
        deadlineConfirmLoc =
            '${DateTime.now().difference(deadlines.deadlineConfirmLoc!).inDays} Days Overdue';
        dateConfirmLoc =
            DateFormat('dd-MM-yyyy').format(deadlines.deadlineConfirmLoc!);
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        dateDeadline: dateConfirmLoc,
        deadline: deadlineConfirmLoc,
        department: department,
        subDepartment: 'Confirm LOC',
      ));
      String deadlineSelfAssessment = 'Overdue';
      String dateSelfAssessment = 'Invalid Date';
      if (deadlines.deadlineConfirmLoc != null) {
        deadlineConfirmLoc =
            '${DateTime.now().difference(deadlines.deadlineSelfAssessment!).inDays} Days Overdue';
        dateSelfAssessment =
            DateFormat('dd-MM-yyyy').format(deadlines.deadlineSelfAssessment!);
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        dateDeadline: dateSelfAssessment,
        deadline: deadlineSelfAssessment,
        department: department,
        subDepartment: 'Self Assessment',
      ));
      String deadlinePerformanceEvaluation = 'Overdue';
      String datePerformanceEvaluation = 'Invalid Date';
      if (deadlines.deadlineConfirmLoc != null) {
        deadlineConfirmLoc =
            '${DateTime.now().difference(deadlines.deadlinePerformanceEvaluation!).inDays} Days Overdue';
        datePerformanceEvaluation = DateFormat('dd-MM-yyyy')
            .format(deadlines.deadlinePerformanceEvaluation!);
      }
      responseDeadline.add(ResponseDeadline(
        id: deadlines.id,
        dateDeadline: datePerformanceEvaluation,
        deadline: deadlinePerformanceEvaluation,
        department: department,
        subDepartment: 'Performance Evaluation',
      ));
    }

    return responseDeadline;
  }
}
