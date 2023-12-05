part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  const LoginState({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}


class LoginInitial extends LoginState {
  const LoginInitial() : super(email: '', password: '');
}