import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart' show Progress, HttpClient;
import 'package:pag_flutter/model/model.dart' show Department, Strategy;
import 'package:pag_flutter/service/service.dart' show DepartmentService;

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
            strategyId: 0,
          ),
        ) {
    on<DepartmentLoading>((
      DepartmentLoading event,
      Emitter<DepartmentState> emit,
    ) async {
      emit(
        DepartmentState(
          status: Progress.loading,
          strategyId: 0,
          departments: state.departments,
          selectedDepartment: state.departments[0],
        ),
      );
      final response = await compute(
        (String token) {
          return DepartmentService.shard.getDepartments(token: token);
        },
        HttpClient.shard.token,
      );
      if (response.hasError) {
        emit(
          DepartmentState(
            strategyId: 0,
            status: Progress.error,
            departments: state.departments,
            selectedDepartment: state.departments[0],
          ),
        );
      } else {
        emit(
          DepartmentState(
            strategyId: 0,
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
          strategyId: state.strategyId,
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
        final response = await compute(
          (String token) {
            return DepartmentService.shard.getDepartments(
              token: token,
              strategyId: event.strategy.id,
            );
          },
          HttpClient.shard.token,
        );

        if (response.hasError) {
          emit(
            DepartmentState(
              strategyId: 0,
              status: Progress.error,
              departments: state.departments,
              selectedDepartment: state.departments[0],
            ),
          );
        } else {
          emit(
            DepartmentState(
              strategyId: event.strategy.id,
              status: Progress.loaded,
              departments: response.data!,
              selectedDepartment: response.data!.first,
            ),
          );
        }
      } else {
        emit(
          DepartmentState(
            status: Progress.loaded,
            strategyId: 0,
            departments: state.departments,
            selectedDepartment: state.departments[0],
          ),
        );
      }
    });
  }
}
