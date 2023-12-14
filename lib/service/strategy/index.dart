import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/query_string/query/query.dart';

class StrategyService {
  static final shard = StrategyService();

  Future<ResponseDAO<List<Strategy>>> getAllStrategies(
      {required String token}) async {
    final String queryStr = getAllStategiesStr();
    HttpClient.shard.token = token;
    final response = await HttpClient.shard.query(queryStr);
    if (response.hasError) {
      return ResponseDAO(
        hasError: true,
        error: response.error,
      );
    } else {
      final List<Strategy> strategies =
          List.from(Strategies.fromJson(response.data).data.getAllStrategies)
            ..insert(0, Strategy(id: 0, name: 'All Strategies'));
      return ResponseDAO(
        hasError: false,
        data: strategies,
      );
    }
  }
}
