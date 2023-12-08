part of 'department_bloc.dart';

abstract class DepartmentEvent extends Equatable {}

final class DepartmentLoading extends DepartmentEvent {
  @override
  List<Object?> get props => [];
}

final class DepartmentLoaded extends DepartmentEvent {
  @override
  List<Object?> get props => [];
}

final class DepartmentError extends DepartmentEvent {
  @override
  List<Object?> get props => [];
}

final class SelectDepartment extends DepartmentEvent {
  final Department selectedDepartment;

  SelectDepartment({required this.selectedDepartment});
  @override
  List<Object?> get props => [selectedDepartment];
}

final class FilterDepartments extends DepartmentEvent {
  final Strategy strategy;

  FilterDepartments({required this.strategy});

  @override
  List<Object?> get props => [strategy];
}
