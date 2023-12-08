part of 'department_bloc.dart';

class DepartmentState extends Equatable {
  final Progress status;
  final Department selectedDepartment;
  final List<Department> departments;
  const DepartmentState(
      {required this.status,
      required this.selectedDepartment,
      required this.departments});

  @override
  List<Object> get props => [status, selectedDepartment, departments];
}

final class DepartmentInitial extends DepartmentState {
  const DepartmentInitial(
      {required super.status,
      required super.selectedDepartment,
      required super.departments});
}

final class DepartmentFilter extends DepartmentState {
  final List<Department> filteredDepartments;
  const DepartmentFilter({
    required super.status,
    required super.selectedDepartment,
    required super.departments,
    this.filteredDepartments = const <Department>[],
  });
}
