import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'self_assessment_event.dart';
part 'self_assessment_state.dart';

class SelfAssessmentBloc extends Bloc<SelfAssessmentEvent, SelfAssessmentState> {
  SelfAssessmentBloc() : super(SelfAssessmentInitial()) {
    on<SelfAssessmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
