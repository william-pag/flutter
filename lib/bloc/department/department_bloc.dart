import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/service/service.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc()
      : super(
          DepartmentInitial(
            status: Progress.initial,
            departments: <Department>[
              Department(id: 0, name: 'All Departments', strategy: null)
            ],
            selectedDepartment:
                Department(id: 0, name: 'All Departments', strategy: null),
          ),
        ) {
    on<DepartmentLoading>((
      DepartmentLoading event,
      Emitter<DepartmentState> emit,
    ) async {
      emit(
        DepartmentState(
          status: Progress.loading,
          departments: state.departments,
          selectedDepartment: state.departments[0],
        ),
      );
      final response = await DepartmentService.shard.getDepartments();
      if (response.hasError) {
        emit(
          DepartmentState(
            status: Progress.error,
            departments: state.departments,
            selectedDepartment: state.departments[0],
          ),
        );
      } else {
        emit(
          DepartmentState(
            status: Progress.loaded,
            departments: response.data!,
            selectedDepartment: response.data!.first,
          ),
        );
      }
    });

    on<SelectDepartment>((
      SelectDepartment event,
      Emitter<DepartmentState> emit,
    ) async {
      emit(
        DepartmentState(
          status: Progress.loaded,
          departments: state.departments,
          selectedDepartment: event.selectedDepartment,
        ),
      );
    });

    on<FilterDepartments>((
      FilterDepartments event,
      Emitter<DepartmentState> emit,
    ) async {
      if (event.strategy.id != 0) {
        final filteredDepartments =
            state.departments.where((Department depart) {
          return depart.id == 0 || depart.strategy?.id == event.strategy.id;
        }).toList();

        emit(
          DepartmentFilter(
            status: Progress.loaded,
            departments: state.departments,
            selectedDepartment: filteredDepartments[0],
            filteredDepartments: filteredDepartments,
          ),
        );
      } else {
        emit(
          DepartmentState(
            status: Progress.loaded,
            departments: state.departments,
            selectedDepartment: state.departments[0],
          ),
        );
      }
    });
  }
}
