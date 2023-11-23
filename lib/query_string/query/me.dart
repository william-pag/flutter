String me() {
  return '''
  query {
    me {
      id
      name
      image
    }
  }
  ''';
}