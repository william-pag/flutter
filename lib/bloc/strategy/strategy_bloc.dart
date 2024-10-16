import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart' show Progress, HttpClient;
import 'package:pag_flutter/model/model.dart' show Strategy;
import 'package:pag_flutter/service/service.dart' show StrategyService;

part 'strategy_event.dart';
part 'strategy_state.dart';

class StrategyBloc extends Bloc<StrategyEvent, StrategyState> {
  StrategyBloc()
      : super(
          StrategyInitial(
            strategies: <Strategy>[Strategy(id: 0, name: 'All Strategies')],
            status: Progress.initial,
            selectedStategy: Strategy(id: 0, name: 'All Strategies'),
          ),
        ) {
    on<StrategyLoading>((
      StrategyLoading event,
      Emitter<StrategyState> emit,
    ) async {
      emit(
        StrategyState(
          status: Progress.loading,
          strategies: state.strategies,
          selectedStategy: state.strategies[0],
        ),
      );
      final response = await compute(
        (String token) {
          return StrategyService.shard.getAllStrategies(token: token);
        },
        HttpClient.shard.token,
      );
      if (response.hasError) {
        emit(
          StrategyState(
            status: Progress.error,
            strategies: state.strategies,
            selectedStategy: state.strategies[0],
          ),
        );
      } else {
        emit(
          StrategyState(
            status: Progress.loaded,
            strategies: response.data!,
            selectedStategy: response.data!.first,
          ),
        );
      }
    });

    on<SelectStrategy>((
      SelectStrategy event,
      Emitter<StrategyState> emit,
    ) async {
      emit(
        StrategyState(
          status: Progress.loaded,
          strategies: state.strategies,
          selectedStategy: event.selectedStategy,
        ),
      );
    });
  }
}
