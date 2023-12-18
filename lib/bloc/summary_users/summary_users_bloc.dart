import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/config/http.dart';
import 'package:pag_flutter/model/user.dart';
import 'package:pag_flutter/service/service.dart';

part 'summary_users_event.dart';
part 'summary_users_state.dart';

class SummaryUsersBloc extends Bloc<SummaryUsersEvent, SummaryUsersState> {
  SummaryUsersBloc() : super(const SummaryUsersInitial()) {
    on<LoadSummaryUsers>((event, emit) async {
      emit(const SummaryUsersInitial());

      final response = await compute(
        (String token) {
          return UserService.shared.getListSummaryUsers(token: token);
        },
        HttpClient.shard.token,
      );

      if (response.hasError) {
        emit(const SummaryUsersState(
          status: Progress.error,
          users: <SummaryUser>[],
        ));
      } else {
        emit(SummaryUsersState(
          status: Progress.loaded,
          users: response.data!,
        ));
      }
    });
  }
}
