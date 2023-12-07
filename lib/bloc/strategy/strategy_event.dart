part of 'strategy_bloc.dart';

abstract class StrategyEvent extends Equatable {}

final class StrategyLoading extends StrategyEvent {
  @override
  List<Object?> get props => [];
}

final class StrategyLoaded extends StrategyEvent {
  @override
  List<Object?> get props => [];
}

final class StrategyError extends StrategyEvent {
  @override
  List<Object?> get props => [];
}

final class SelectStrategy extends StrategyEvent {
  final Strategy selectedStategy;

  SelectStrategy({required this.selectedStategy});
  @override
  List<Object?> get props => [selectedStategy];
}
