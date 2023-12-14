part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {}

final class UsersLoading extends UsersEvent {
  @override
  List<Object?> get props => [];
}

final class SelectUser extends UsersEvent {
  final UserModel user;

  SelectUser({required this.user});

  @override
  List<Object?> get props => [user];
}
