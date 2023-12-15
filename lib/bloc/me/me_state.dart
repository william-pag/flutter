part of 'me_bloc.dart';

class MeState extends Equatable {
  final Progress status;
  final MeClass? me;
  const MeState({required this.me, required this.status});

  @override
  List<Object?> get props => [me];
}

final class MeInitial extends MeState {
  const MeInitial({super.me, super.status = Progress.loading});
}
