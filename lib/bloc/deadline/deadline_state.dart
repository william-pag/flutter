part of 'deadline_bloc.dart';

sealed class DeadlineState extends Equatable {
  const DeadlineState();
  
  @override
  List<Object> get props => [];
}

final class DeadlineInitial extends DeadlineState {}
