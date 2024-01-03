part of 'overall_progress_bloc.dart';

class OverallProgressState extends Equatable {
  final Progress progress;
  final OverallProgress? overall;

  const OverallProgressState({required this.progress, required this.overall});
  @override
  List<Object?> get props => [progress, overall];
}

final class OverallProgressLoading extends OverallProgressState {
  const OverallProgressLoading({
    super.progress = Progress.loading,
    super.overall,
  });
}
