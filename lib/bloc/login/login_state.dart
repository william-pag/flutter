part of 'login_bloc.dart';
class LoginState extends Equatable {
  final String email;
  final String password;
  final ButtonStatus btnSingIn;
  const LoginState({required this.email, required this.password, required this.btnSingIn,});

  @override
  List<Object?> get props => [email, password, btnSingIn];
}


class LoginInitial extends LoginState {
  const LoginInitial() : super(email: '', password: '', btnSingIn: ButtonStatus.active);
}
