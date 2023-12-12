import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pag_flutter/service/shared_preferences/index.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  TokenBloc() : super(const TokenLoading()) {
    on<LoadToken>((LoadToken event, Emitter<TokenState> emit) async {
      emit(const TokenLoading());
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
      }
    });
  }
}
