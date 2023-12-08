class Departments {
  Data data;

  Departments({
    required this.data,
  });

  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Department> getAllDepartments;

  Data({
    required this.getAllDepartments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getAllDepartments: List<Department>.from(
            json["getAllDepartments"].map((x) => Department.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllDepartments":
            List<dynamic>.from(getAllDepartments.map((x) => x.toJson())),
      };
}

class Department {
  int id;
  String name;
  DepartmentStrategy? strategy;

  Department({
    required this.id,
    required this.name,
    required this.strategy,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
        strategy: json["strategy"] == null
            ? null
            : DepartmentStrategy.fromJson(json["strategy"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "strategy": strategy?.toJson(),
      };
}

class DepartmentStrategy {
  int id;

  DepartmentStrategy({
    required this.id,
  });

  factory DepartmentStrategy.fromJson(Map<String, dynamic> json) =>
      DepartmentStrategy(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
