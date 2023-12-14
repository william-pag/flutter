import 'dart:ffi';
import 'dart:isolate';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart' show Progress, HttpClient;
import 'package:pag_flutter/model/model.dart' show ResponseDeadline;
import 'package:pag_flutter/model/triple.dart';
import 'package:pag_flutter/service/service.dart' show DepartmentService;

part 'deadline_event.dart';
part 'deadline_state.dart';

class DeadlineBloc extends Bloc<DeadlineEvent, DeadlineState> {
  DeadlineBloc() : super(const DeadlineLoading()) {
    on<LoadDeadline>((
      LoadDeadline event,
      Emitter<DeadlineState> emit,
    ) async {
      emit(const DeadlineLoading());
      final response = await compute(
        (String token) {
          return DepartmentService.shard.getDeadlines(token: token);
        },
        HttpClient.shard.token,
      );
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
      final deadlines = await compute(
        (Triple<String, int, int> args) {
          return DepartmentService.shard.getDeadlines(
            token: args.first,
            stategyId: args.second,
            departmentId: args.third,
          );
        },
        Triple<String, int, int>(
          HttpClient.shard.token,
          event.strategyId,
          event.departmentId,
        ),
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
