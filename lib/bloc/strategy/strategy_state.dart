part of 'strategy_bloc.dart';

class StrategyState extends Equatable {
  final Progress status;
  final Strategy selectedStategy;
  final List<Strategy> strategies;
  const StrategyState(
      {required this.strategies,
      required this.status,
      required this.selectedStategy});

  @override
  List<Object> get props => [
        status,
        strategies,
        selectedStategy,
      ];
}

final class StrategyInitial extends StrategyState {
  const StrategyInitial(
      {required super.selectedStategy,
      required super.strategies,
      required super.status});
}
