import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart' show Progress;
import 'package:pag_flutter/model/model.dart' show MeClass;
import 'package:pag_flutter/service/service.dart' show UserService;

part 'me_event.dart';
part 'me_state.dart';

class MeBloc extends Bloc<MeEvent, MeState> {
  MeBloc() : super(const MeInitial()) {
    on<LoadMe>((LoadMe event, Emitter<MeState> emit) async {
      emit(const MeInitial());
      final response = await UserService.shared.me();
      if (response.hasError || response.data == null) {
        emit(const MeState(me: null, status: Progress.error));
      } else {
        emit(MeState(me: response.data!, status: Progress.loaded));
      }
    });
  }
}
