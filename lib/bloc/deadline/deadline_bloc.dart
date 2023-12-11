import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deadline_event.dart';
part 'deadline_state.dart';

class DeadlineBloc extends Bloc<DeadlineEvent, DeadlineState> {
  DeadlineBloc() : super(DeadlineInitial()) {
    on<DeadlineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
