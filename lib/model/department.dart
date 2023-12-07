class Departments {
  DepartmentsData data;

  Departments({
    required this.data,
  });

  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
        data: DepartmentsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DepartmentsData {
  List<GetAllDepartment> getAllDepartments;

  DepartmentsData({
    required this.getAllDepartments,
  });

  factory DepartmentsData.fromJson(Map<String, dynamic> json) =>
      DepartmentsData(
        getAllDepartments: List<GetAllDepartment>.from(
            json["getAllDepartments"].map((x) => GetAllDepartment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllDepartments":
            List<dynamic>.from(getAllDepartments.map((x) => x.toJson())),
      };
}

class GetAllDepartment {
  int id;
  String name;

  GetAllDepartment({
    required this.id,
    required this.name,
  });

  factory GetAllDepartment.fromJson(Map<String, dynamic> json) =>
      GetAllDepartment(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
