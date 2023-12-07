class MeModel {
  MeData data;

  MeModel({
    required this.data,
  });

  factory MeModel.fromJson(Map<String, dynamic> json) => MeModel(
        data: MeData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class MeData {
  MeClass me;

  MeData({
    required this.me,
  });

  factory MeData.fromJson(Map<String, dynamic> json) => MeData(
        me: MeClass.fromJson(json["me"]),
      );

  Map<String, dynamic> toJson() => {
        "me": me.toJson(),
      };
}

class MeClass {
  int id;
  String name;
  String image;
  String email;

  MeClass({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
  });

  factory MeClass.fromJson(Map<String, dynamic> json) => MeClass(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email": email,
      };
}
