part of 'summary_users_bloc.dart';

class SummaryUsersState extends Equatable {
  final Progress status;
  final List<SummaryUser> users;

  const SummaryUsersState({required this.status, required this.users});

  @override
  List<Object> get props => [status, users];
}

final class SummaryUsersInitial extends SummaryUsersState {
  const SummaryUsersInitial(
      {super.status = Progress.loading, super.users = const <SummaryUser>[]});
}
