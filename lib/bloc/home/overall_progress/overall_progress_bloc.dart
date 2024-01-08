import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/config/http.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/model/triple.dart';
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
    final List<ResponseDAO<Object>> response = await compute(
      (Triple<String, int, int> data) {
        return Future.wait([
          HomeService.shared.getOverallProgress(
            token: data.first,
            strategyId: data.second,
            departmentId: data.third,
          ),
          HomeService.shared.getPE(
            token: data.first,
            strategyId: data.second,
            departmentId: data.third,
          ),
          HomeService.shared.getLOC(
            token: data.first,
            strategyId: data.second,
            departmentId: data.third,
          ),
          HomeService.shared.getSA(
            token: data.first,
            strategyId: data.second,
            departmentId: data.third,
          ),
          HomeService.shared.getListPE(
            token: data.first,
            strategyId: data.second,
            departmentId: data.third,
          ),
        ]);
      },
      Triple<String, int, int>(HttpClient.shard.token, 0, 0),
    );

    final List<List<PieChartSectionData>> arr = [];

    if (response[0].hasError ||
        response[1].hasError ||
        response[2].hasError ||
        response[3].hasError ||
        response[4].hasError) {
      emit(const OverallProgressState(
        progress: Progress.error,
        list: [],
        listPE: [],
      ));
    } else {
      const radius = 30.0;
      {
        const index = 0;
        final progress = response[index].data! as OverallProgress;
        arr.insert(index, [
          PieChartSectionData(
              value: progress.complete.toDouble(),
              color: Colors.blue.shade300,
              radius: radius,
              showTitle: false,
              title: '${progress.percentComplete.toDouble()}%'),
          PieChartSectionData(
            value: (progress.overall - progress.complete).toDouble(),
            color: Colors.grey.shade300,
            radius: radius,
            showTitle: false,
          )
        ]);
      }
      {
        const index = 1;
        final progress = response[index].data! as OverallProgress;
        arr.insert(index, [
          PieChartSectionData(
              value: progress.complete.toDouble(),
              color: Colors.blue.shade900,
              radius: radius,
              showTitle: false,
              title: '${progress.percentComplete.toDouble()}%'),
          PieChartSectionData(
            value: (progress.overall - progress.complete).toDouble(),
            color: Colors.grey.shade300,
            radius: radius,
            showTitle: false,
          )
        ]);
      }
      {
        const index = 2;
        final progress = response[index].data! as OverallProgress;
        arr.insert(index, [
          PieChartSectionData(
              value: progress.complete.toDouble(),
              color: Colors.teal,
              radius: radius,
              showTitle: false,
              title: '${progress.percentComplete.toDouble()}%'),
          PieChartSectionData(
            value: (progress.overall - progress.complete).toDouble(),
            color: Colors.grey.shade300,
            radius: radius,
            showTitle: false,
          )
        ]);
      }
      {
        const index = 3;
        final progress = response[index].data! as OverallProgress;
        arr.insert(index, [
          PieChartSectionData(
              value: progress.complete.toDouble(),
              color: Colors.pinkAccent,
              radius: radius,
              showTitle: false,
              title: '${progress.percentComplete.toDouble()}%'),
          PieChartSectionData(
            value: (progress.overall - progress.complete).toDouble(),
            color: Colors.grey.shade300,
            radius: radius,
            showTitle: false,
          )
        ]);
      }
      emit(OverallProgressState(
        progress: Progress.loaded,
        list: arr,
        listPE: response[4].data! as List<GetListPerformanceEvaluation>
      ));
    }
  }
}
