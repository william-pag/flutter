part of 'deadline_bloc.dart';

class DeadlineEvent extends Equatable {
  const DeadlineEvent();

  @override
  List<Object> get props => [];
}

class LoadDeadline extends DeadlineEvent {}

class FilterDeadline extends DeadlineEvent {
  final int strategyId;
  final int departmentId;

  const FilterDeadline({this.strategyId = 0, this.departmentId = 0});
}
