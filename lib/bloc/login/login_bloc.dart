import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/service/service.dart';

part 'login_event.dart';
part 'login_state.dart';

enum LoginBtnStatus { loading, active, inActive, success }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<ExecuteLoginEvent>((event, emit) async {
      emit(
        LoginState(
          email: state.email,
          password: state.password,
          btnSignIn: LoginBtnStatus.loading,
        ),
      );
      await UserService.shared.login(
        email: event.email,
        password: event.password,
      );
      emit(
        LoginState(
          email: state.email,
          password: state.password,
          btnSignIn: LoginBtnStatus.success,
        ),
      );
    });
  }
}
