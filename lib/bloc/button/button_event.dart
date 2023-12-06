part of 'button_bloc.dart';

abstract class ButtonEvent extends Equatable {}

class ChangeBtnStatus extends ButtonEvent {
  final ButtonStatus btnStatus;

  ChangeBtnStatus({required this.btnStatus});
  
  @override
  List<Object?> get props => [btnStatus];
}