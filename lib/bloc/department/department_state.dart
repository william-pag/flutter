part of 'department_bloc.dart';

class DepartmentState extends Equatable {
  final Progress status;
  final Department selectedDepartment;
  final List<Department> departments;
  final int strategyId;
  const DepartmentState({
    required this.status,
    required this.selectedDepartment,
    required this.departments,
    required this.strategyId,
  });

  @override
  List<Object> get props =>
      [status, selectedDepartment, departments, strategyId];
}

final class DepartmentInitial extends DepartmentState {
  const DepartmentInitial(
      {required super.status,
      required super.selectedDepartment,
      required super.departments,
      required super.strategyId});
}
