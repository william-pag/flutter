import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/overall_progress.dart';
import 'package:pag_flutter/query_string/query/home_page.dart';

class HomeService {
  static final shared = HomeService();

  Future<ResponseDAO<OverallProgress>> getOverallProgress({
    required String token,
    int strategyId = 0,
    int departmentId = 0,
  }) async {
    final String queryStr = HomeQueryStr.shared.getOverallProgess(
      departmentId: departmentId,
      strategyId: strategyId,
    );

    HttpClient.shard.token = token;
    final response = await HttpClient.shard.query(queryStr);
    if (response.hasError) {
      return ResponseDAO(
        hasError: true,
        error: response.error,
      );
    } else {
      final overallProgress =
          OverallProgress.fromJson(response.data['data']['overallProgress']);
      return ResponseDAO(
        hasError: false,
        data: overallProgress,
      );
    }
  }
}
