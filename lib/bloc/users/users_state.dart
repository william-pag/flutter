part of 'users_bloc.dart';

class UsersState extends Equatable {
  final Progress status;
  final List<UserModel> users;
  final UserModel? selectedUser;
  const UsersState({
    required this.status,
    required this.users,
    required this.selectedUser,
  });

  @override
  List<Object?> get props => [status, users, selectedUser];
}

final class UsersInitial extends UsersState {
  const UsersInitial({
    super.status = Progress.loading,
    super.users = const <UserModel>[],
    super.selectedUser,
  });
}
