String meStr() {
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
