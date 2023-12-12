part of 'deadline_bloc.dart';

class DeadlineState extends Equatable {
  final Progress status;
  final List<ResponseDeadline> deadlines;
  final int strategyId;
  final int departmentId;
  const DeadlineState({
    required this.deadlines,
    required this.strategyId,
    required this.departmentId,
    required this.status,
  });

  @override
  List<Object> get props => [deadlines, strategyId, departmentId, status];
}

final class DeadlineLoading extends DeadlineState {
  const DeadlineLoading()
      : super(
          deadlines: const <ResponseDeadline>[],
          strategyId: 0,
          departmentId: 0,
          status: Progress.loading,
        );
  @override
  List<Object> get props => [deadlines, strategyId, departmentId];
}

final class DeadlineLoaded extends DeadlineState {
  const DeadlineLoaded({
    required super.deadlines,
    required super.strategyId,
    required super.departmentId,
    required super.status,
  });
}

final class DeadlineError extends DeadlineState {
  const DeadlineError()
      : super(
          deadlines: const <ResponseDeadline>[],
          strategyId: 0,
          departmentId: 0,
          status: Progress.error,
        );
}
