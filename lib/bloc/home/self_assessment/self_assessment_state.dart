part of 'self_assessment_bloc.dart';

sealed class SelfAssessmentState extends Equatable {
  const SelfAssessmentState();
  
  @override
  List<Object> get props => [];
}

final class SelfAssessmentInitial extends SelfAssessmentState {}
