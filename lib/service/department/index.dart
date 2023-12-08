import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
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
}
