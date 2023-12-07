String loginMutation({required String email, required String password}) {
  return '''
    mutation {
      login(email: "$email", password: "$password") {
        accessToken
      }
    }
  ''';
}
