part of 'overall_progress_bloc.dart';

class OverallProgressState extends Equatable {
  final Progress progress;
  final List<PieChartSectionData> list;

  const OverallProgressState({required this.progress, required this.list});
  @override
  List<Object> get props => [progress, list];
}

final class OverallProgressLoading extends OverallProgressState {
  const OverallProgressLoading({
    super.progress = Progress.loading,
    super.list = const <PieChartSectionData>[],
  });
}
