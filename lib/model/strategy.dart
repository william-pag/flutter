class Strategies {
  StrategiesData data;

  Strategies({
    required this.data,
  });

  factory Strategies.fromJson(Map<String, dynamic> json) => Strategies(
        data: StrategiesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class StrategiesData {
  List<Strategy> getAllStrategies;

  StrategiesData({
    required this.getAllStrategies,
  });

  factory StrategiesData.fromJson(Map<String, dynamic> json) => StrategiesData(
        getAllStrategies: List<Strategy>.from(
            json["getAllStrategies"].map((x) => Strategy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllStrategies":
            List<dynamic>.from(getAllStrategies.map((x) => x.toJson())),
      };
}

class Strategy {
  int id;
  String name;

  Strategy({
    required this.id,
    required this.name,
  });

  factory Strategy.fromJson(Map<String, dynamic> json) => Strategy(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
