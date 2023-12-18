// ignore_for_file: constant_identifier_names

import 'package:pag_flutter/model/model.dart' show EnumValues;

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

// ----------------------------------

class SummaryUsers {
  DataSummaryUser data;

  SummaryUsers({
    required this.data,
  });

  factory SummaryUsers.fromJson(Map<String, dynamic> json) => SummaryUsers(
        data: DataSummaryUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataSummaryUser {
  List<SummaryUser> getAllUsers;

  DataSummaryUser({
    required this.getAllUsers,
  });

  factory DataSummaryUser.fromJson(Map<String, dynamic> json) =>
      DataSummaryUser(
        getAllUsers: List<SummaryUser>.from(
            json["getAllUsers"].map((x) => SummaryUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllUsers": List<dynamic>.from(getAllUsers.map((x) => x.toJson())),
      };
}

class SummaryUser {
  int id;
  String name;
  String image;
  Title title;

  SummaryUser({
    required this.id,
    required this.name,
    required this.image,
    required this.title,
  });

  factory SummaryUser.fromJson(Map<String, dynamic> json) => SummaryUser(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        title: Title.fromJson(json["title"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "title": title.toJson(),
      };
}

class Title {
  int id;
  NameTitle name;

  Title({
    required this.id,
    required this.name,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        id: json["id"],
        name: nameValuesTitle.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValuesTitle.reverse[name],
      };
}

enum NameTitle {
  ACCOUNTANT,
  ADMINISTRATION_ASSISTANT,
  ANALYST,
  ASSOCIATE,
  COUNTRY_MANAGER,
  LEGAL_COUNSEL,
  MANAGER,
  MANAGING_DIRECTOR,
  MANAGING_PARTNER,
  SENIOR_ACCOUNTANT,
  SENIOR_ASSOCIATE,
  SUPERVISOR
}

final nameValuesTitle = EnumValues({
  "Accountant": NameTitle.ACCOUNTANT,
  "Administration Assistant": NameTitle.ADMINISTRATION_ASSISTANT,
  "Analyst": NameTitle.ANALYST,
  "Associate": NameTitle.ASSOCIATE,
  "Country Manager": NameTitle.COUNTRY_MANAGER,
  "Legal Counsel": NameTitle.LEGAL_COUNSEL,
  "Manager": NameTitle.MANAGER,
  "Managing Director": NameTitle.MANAGING_DIRECTOR,
  "Managing Partner": NameTitle.MANAGING_PARTNER,
  "Senior Accountant": NameTitle.SENIOR_ACCOUNTANT,
  "Senior Associate": NameTitle.SENIOR_ASSOCIATE,
  "Supervisor": NameTitle.SUPERVISOR
});

// -------------------------------

class GetDetailUser {
  DataDetailUser data;

  GetDetailUser({
    required this.data,
  });

  factory GetDetailUser.fromJson(Map<String, dynamic> json) => GetDetailUser(
        data: DataDetailUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataDetailUser {
  DetailUser getOneUser;

  DataDetailUser({
    required this.getOneUser,
  });

  factory DataDetailUser.fromJson(Map<String, dynamic> json) => DataDetailUser(
        getOneUser: DetailUser.fromJson(json["getOneUser"]),
      );

  Map<String, dynamic> toJson() => {
        "getOneUser": getOneUser.toJson(),
      };
}

class DetailUser {
  int id;
  String image;
  String name;
  Title title;
  DateTime lastLogin;
  String email;
  DepartmentUser location;
  DepartmentUser department;
  DepartmentUser strategy;
  DepartmentUser evaluator;
  DepartmentUser evaluationType;

  DetailUser({
    required this.id,
    required this.image,
    required this.name,
    required this.title,
    required this.lastLogin,
    required this.email,
    required this.location,
    required this.department,
    required this.strategy,
    required this.evaluator,
    required this.evaluationType,
  });

  factory DetailUser.fromJson(Map<String, dynamic> json) => DetailUser(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        title: Title.fromJson(json["title"]),
        lastLogin: DateTime.parse(json["lastLogin"]),
        email: json["email"],
        location: DepartmentUser.fromJson(json["location"]),
        department: DepartmentUser.fromJson(json["department"]),
        strategy: DepartmentUser.fromJson(json["strategy"]),
        evaluator: DepartmentUser.fromJson(json["evaluator"]),
        evaluationType: DepartmentUser.fromJson(json["evaluationType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "title": title.toJson(),
        "lastLogin": lastLogin.toIso8601String(),
        "email": email,
        "location": location.toJson(),
        "department": department.toJson(),
        "strategy": strategy.toJson(),
        "evaluator": evaluator.toJson(),
        "evaluationType": evaluationType.toJson(),
      };
}

class DepartmentUser {
  String name;

  DepartmentUser({
    required this.name,
  });

  factory DepartmentUser.fromJson(Map<String, dynamic> json) => DepartmentUser(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
