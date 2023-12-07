part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginBtnStatus btnSignIn;
  const LoginState({
    required this.email,
    required this.password,
    required this.btnSignIn,
  });

  @override
  List<Object?> get props => [email, password, btnSignIn];
}

class LoginInitial extends LoginState {
  const LoginInitial()
      : super(email: '', password: '', btnSignIn: LoginBtnStatus.active);
}
