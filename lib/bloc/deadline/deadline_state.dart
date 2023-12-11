part of 'deadline_bloc.dart';

class DeadlineState extends Equatable {
  final List<ResponseDeadline> deadlines;
  final int strategyId;
  final int departmentId;
  final List<ResponseDeadline> filteredDealines;
  const DeadlineState({
    required this.deadlines,
    required this.strategyId,
    required this.departmentId,
    required this.filteredDealines,
  });

  @override
  List<Object> get props =>
      [deadlines, strategyId, departmentId, filteredDealines];
}

final class DeadlineLoading extends DeadlineState {
  const DeadlineLoading()
      : super(
          deadlines: const <ResponseDeadline>[],
          strategyId: 0,
          departmentId: 0,
          filteredDealines: const <ResponseDeadline>[],
        );
  @override
  List<Object> get props =>
      [deadlines, strategyId, departmentId, filteredDealines];
}

final class DeadlineLoaded extends DeadlineState {
  const DeadlineLoaded({
    required super.deadlines,
    required super.strategyId,
    required super.departmentId,
    required super.filteredDealines,
  });
}

final class DeadlineError extends DeadlineState {
  const DeadlineError()
      : super(
          deadlines: const <ResponseDeadline>[],
          strategyId: 0,
          departmentId: 0,
          filteredDealines: const <ResponseDeadline>[],
        );
}
