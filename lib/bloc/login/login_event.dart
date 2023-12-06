part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class ExecuteLoginEvent extends LoginEvent {
  final String email;
  final String password;

  ExecuteLoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}