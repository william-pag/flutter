class LoginModel {
  Data data;

  LoginModel({
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Login login;

  Data({
    required this.login,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    login: Login.fromJson(json["login"]),
  );

  Map<String, dynamic> toJson() => {
    "login": login.toJson(),
  };
}

class Login {
  String accessToken;

  Login({
    required this.accessToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
  };
}
