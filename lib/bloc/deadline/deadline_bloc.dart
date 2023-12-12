import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/service/service.dart';

part 'deadline_event.dart';
part 'deadline_state.dart';

class DeadlineBloc extends Bloc<DeadlineEvent, DeadlineState> {
  DeadlineBloc() : super(const DeadlineLoading()) {
    on<LoadDeadline>((
      LoadDeadline event,
      Emitter<DeadlineState> emit,
    ) async {
      emit(const DeadlineLoading());
      final response = await DepartmentService.shard.getDeadlines();
      if (response.hasError) {
        emit(const DeadlineError());
      } else {
        emit(DeadlineLoaded(
          status: Progress.loaded,
          deadlines: response.data!,
          strategyId: 0,
          departmentId: 0,
        ));
      }
    });

    on<FilterDeadline>((
      FilterDeadline event,
      Emitter<DeadlineState> emit,
    ) async {
      emit(const DeadlineLoading());
      final deadlines = await DepartmentService.shard.getDeadlines(
        stategyId: event.strategyId,
        departmentId: event.departmentId,
      );
      emit(DeadlineLoaded(
        status: Progress.loaded,
        deadlines: deadlines.data!,
        strategyId: 0,
        departmentId: 0,
      ));
    });
  }
}
