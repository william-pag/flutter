import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';


enum ButtonStatus { loading, active, inActive, success }
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<ExecuteLoginEvent>((event, emit) async {
      emit(
        LoginState(
          email: state.email,
          password: state.password,
          btnSingIn: ButtonStatus.loading,
        ),
      );
      await Future.delayed(const Duration(seconds: 5));
      emit(
        LoginState(
          email: state.email,
          password: state.password,
          btnSingIn: ButtonStatus.success,
        ),
      );
    });
  }
}
