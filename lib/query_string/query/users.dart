final class UserQueryString {
  static final shared = UserQueryString();

  String getListSelectingUsers() {
    return '''
      {
        getAllUsers {
          id
          name
        }
      }
    ''';
  }

  String getListSummaryUsers() {
    return '''
      {
        getAllUsers {
          id
          name
          image
          title {
            id
            name
          }
        }
      }
    ''';
  }

  String getDetailedUser({required int userId}) {
    return '''
      {
        getOneUser(id: $userId) {
          id
          image
          name
          title {
              id
              name
          }
          lastLogin
          email
          location {
              name
          }
          department {
              name
          }
          strategy {
              name
          }
          evaluator {
              name
          }
          evaluationType {
              name
          }
        }
      }
    ''';
  }
}
