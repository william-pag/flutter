part of 'button_bloc.dart';

class ButtonState extends Equatable {
  final ButtonStatus btnState;
  const ButtonState({required this.btnState});
  
  @override
  List<Object> get props => [];
}

final class ButtonInitial extends ButtonState {
  const ButtonInitial() : super(btnState: ButtonStatus.active);
}
