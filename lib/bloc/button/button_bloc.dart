import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'button_event.dart';
part 'button_state.dart';

enum ButtonStatus {
  loading,
  active,
  inActive,
  success
}
class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(const ButtonInitial()) {
    on<ChangeBtnStatus>((event, emit) {
      emit(ButtonState(btnState: event.btnStatus));
    });
  }
}
