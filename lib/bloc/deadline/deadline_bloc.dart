import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/service/service.dart';

part 'deadline_event.dart';
part 'deadline_state.dart';

class DeadlineBloc extends Bloc<DeadlineEvent, DeadlineState> {
  DeadlineBloc() : super(const DeadlineLoading()) {
    on<LoadingDeadline>((
      LoadingDeadline event,
      Emitter<DeadlineState> emit,
    ) async {
      emit(const DeadlineLoading());
      final deadlines = await DepartmentService.shard.getDeadlines();
      await Future.delayed(const Duration(seconds: 2));
      emit(DeadlineLoaded(deadlines: deadlines.data!, strategyId: 0, departmentId: 0, filteredDealines: state.filteredDealines));
    });
  }
}
