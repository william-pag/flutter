part of 'department_bloc.dart';

sealed class DepartmentState extends Equatable {
  const DepartmentState();
  
  @override
  List<Object> get props => [];
}

final class DepartmentInitial extends DepartmentState {}
