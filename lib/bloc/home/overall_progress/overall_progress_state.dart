part of 'overall_progress_bloc.dart';

class OverallProgressState extends Equatable {
  final Progress progress;
  final List<List<PieChartSectionData>> list;
  final List<GetListPerformanceEvaluation> listPE;

  const OverallProgressState({required this.progress, required this.list, required this.listPE});
  @override
  List<Object> get props => [progress, list, listPE];
}

final class OverallProgressLoading extends OverallProgressState {
  const OverallProgressLoading({
    super.progress = Progress.loading,
    super.list = const <List<PieChartSectionData>>[],
    super.listPE = const <GetListPerformanceEvaluation>[],
  });
}
