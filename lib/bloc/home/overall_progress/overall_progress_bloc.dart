import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/model/overall_progress.dart';

part 'overall_progress_event.dart';
part 'overall_progress_state.dart';

class OverallProgressBloc
    extends Bloc<OverallProgressEvent, OverallProgressState> {
  OverallProgressBloc() : super(const OverallProgressLoading()) {
    on<InitialOverallEvent>((
      InitialOverallEvent event,
      Emitter<OverallProgressState> emit,
    ) {});
  }
}
