class UsersModel {
  DataUsers data;

  UsersModel({
    required this.data,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        data: DataUsers.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataUsers {
  List<UserModel> getAllUsers;

  DataUsers({
    required this.getAllUsers,
  });

  factory DataUsers.fromJson(Map<String, dynamic> json) => DataUsers(
        getAllUsers: List<UserModel>.from(
            json["getAllUsers"].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllUsers": List<dynamic>.from(getAllUsers.map((x) => x.toJson())),
      };
}

class UserModel {
  int id;
  String name;

  UserModel({
    required this.id,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
