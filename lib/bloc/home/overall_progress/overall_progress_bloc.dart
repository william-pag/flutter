import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/config/http.dart';
import 'package:pag_flutter/model/overall_progress.dart';
import 'package:pag_flutter/service/home/index.dart';

part 'overall_progress_event.dart';
part 'overall_progress_state.dart';

class OverallProgressBloc
    extends Bloc<OverallProgressEvent, OverallProgressState> {
  OverallProgressBloc() : super(const OverallProgressLoading()) {
    on<InitialOverallEvent>(_getOverallProgress);
  }

  void _getOverallProgress(
    InitialOverallEvent event,
    Emitter<OverallProgressState> emit,
  ) async {
    emit(const OverallProgressLoading());
    final response = await compute(
      (String token) {
        return HomeService.shared.getOverallProgress(token: token);
      },
      HttpClient.shard.token,
    );

    if (response.hasError) {
      emit(const OverallProgressState(
        progress: Progress.error,
        overall: null,
      ));
    } else {
      emit(OverallProgressState(
        progress: Progress.loaded,
        overall: response.data,
      ));
    }
  }
}
