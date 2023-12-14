import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart' show Progress, HttpClient;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pag_flutter/service/service.dart' show UserService;
import 'package:pag_flutter/service/shared_preferences/index.dart'
    show LocalStorage;

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  TokenBloc() : super(const TokenLoading()) {
    on<LoadToken>((LoadToken event, Emitter<TokenState> emit) async {
      emit(const TokenLoading());
      await Future.delayed(const Duration(seconds: 2));
      String? token;
      if (kIsWeb) {
        token = await LocalStorage.shard.getValue(key: 'token');
      } else {
        token = state.token;
      }

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
