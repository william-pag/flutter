class LoginModel {
  LoginData data;

  LoginModel({
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class LoginData {
  Login login;

  LoginData({
    required this.login,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
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
