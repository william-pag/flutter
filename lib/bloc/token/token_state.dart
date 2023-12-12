part of 'token_bloc.dart';

class TokenState extends Equatable {
  final bool isAuthorized;
  final Progress status;
  final String? token;
  const TokenState(
      {required this.isAuthorized, required this.token, required this.status});

  @override
  List<Object?> get props => [token, status, isAuthorized];
}

final class TokenLoading extends TokenState {
  const TokenLoading()
      : super(token: null, status: Progress.loading, isAuthorized: false);
}
