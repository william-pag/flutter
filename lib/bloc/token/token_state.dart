part of 'token_bloc.dart';

class TokenState extends Equatable {
  final String token;
  const TokenState({required this.token});
  
  @override
  List<Object> get props => [token];
}

final class TokenInitial extends TokenState {
  const TokenInitial() : super(token: '');
}
