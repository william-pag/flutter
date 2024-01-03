import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart' show Progress, HttpClient;
import 'package:pag_flutter/service/service.dart' show UserService;
import 'package:pag_flutter/service/shared_preferences/index.dart'
    show LocalStorage;

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  TokenBloc() : super(const TokenLoading()) {
    on<LoadToken>((LoadToken event, Emitter<TokenState> emit) async {
      emit(const TokenLoading());
      String? token = await LocalStorage.shard.getValue(key: 'token');

      if (token == null) {
        emit(const TokenState(
          isAuthorized: false,
          token: null,
          status: Progress.loaded,
        ));
      } else {
        HttpClient.shard.token = token;
        final response = await UserService.shared.me();
        if (response.hasError) {
          emit(const TokenState(
            isAuthorized: false,
            token: null,
            status: Progress.loaded,
          ));
        } else {
          emit(TokenState(
            isAuthorized: true,
            token: state.token,
            status: Progress.loaded,
          ));
        }
      }
    });
  }
}
