import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart' show Progress, HttpClient;
import 'package:pag_flutter/model/model.dart' show UserModel;
import 'package:pag_flutter/service/service.dart' show UserService;

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersInitial()) {
    on<UsersLoading>((UsersLoading event, Emitter<UsersState> emit) async {
      emit(const UsersState(
        status: Progress.loading,
        users: <UserModel>[],
        selectedUser: null,
      ));
      final response = await compute(
        (String token) {
          return UserService.shared.getListSelectingUsers(token: token);
        },
        HttpClient.shard.token,
      );
      if (response.hasError || response.data == null) {
        emit(const UsersState(
          status: Progress.error,
          users: <UserModel>[],
          selectedUser: null,
        ));
      } else {
        emit(UsersState(
          status: Progress.loaded,
          users: response.data!,
          selectedUser: response.data!.first,
        ));
      }
    });

    on<SelectUser>((SelectUser event, Emitter<UsersState> emit) {
      emit(UsersState(
        status: Progress.loaded,
        users: state.users,
        selectedUser: event.user,
      ));
    });
  }
}
