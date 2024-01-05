import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/config/http.dart';
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

    final List<List<PieChartSectionData>> arr = [];

    if (response.hasError) {
      emit(const OverallProgressState(
        progress: Progress.error,
        list: [],
      ));
    } else {
      const radius = 30.0;
      final progress = response.data!;
      arr.insert(0, [
        PieChartSectionData(
            value: progress.complete.toDouble(),
            color: Colors.blueAccent,
            radius: radius,
            showTitle: false,
            title: '${progress.percentComplete.toDouble()}%'),
        PieChartSectionData(
          value: (progress.overall - progress.complete).toDouble(),
          color: Colors.grey,
          radius: radius,
          showTitle: false,
        )
      ]);
      emit(OverallProgressState(
        progress: Progress.loaded,
        list: arr,
      ));
    }
  }
}
