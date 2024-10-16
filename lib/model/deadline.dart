import 'package:pag_flutter/model/model.dart' show EnumValues;

class Deadlines {
  DataDeadlines data;

  Deadlines({
    required this.data,
  });

  factory Deadlines.fromJson(Map<String, dynamic> json) => Deadlines(
        data: DataDeadlines.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataDeadlines {
  List<GetAllDepartmentDeadlines> getAllDepartments;

  DataDeadlines({
    required this.getAllDepartments,
  });

  factory DataDeadlines.fromJson(Map<String, dynamic> json) => DataDeadlines(
        getAllDepartments: List<GetAllDepartmentDeadlines>.from(
            json["getAllDepartments"]
                .map((x) => GetAllDepartmentDeadlines.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllDepartments":
            List<dynamic>.from(getAllDepartments.map((x) => x.toJson())),
      };
}

class GetAllDepartmentDeadlines {
  int id;
  String name;
  DateTime? deadlineLoc;
  DateTime? deadlineConfirmLoc;
  DateTime? deadlineSelfAssessment;
  DateTime? deadlinePerformanceEvaluation;
  StrategyDeadlines? strategy;

  GetAllDepartmentDeadlines({
    required this.id,
    required this.name,
    required this.deadlineLoc,
    required this.deadlineConfirmLoc,
    required this.deadlineSelfAssessment,
    required this.deadlinePerformanceEvaluation,
    required this.strategy,
  });

  factory GetAllDepartmentDeadlines.fromJson(Map<String, dynamic> json) =>
      GetAllDepartmentDeadlines(
        id: json["id"],
        name: json["name"],
        deadlineLoc: json["deadlineLOC"] == null
            ? null
            : DateTime.parse(json["deadlineLOC"]),
        deadlineConfirmLoc: json["deadlineConfirmLOC"] == null
            ? null
            : DateTime.parse(json["deadlineConfirmLOC"]),
        deadlineSelfAssessment: json["deadlineSelfAssessment"] == null
            ? null
            : DateTime.parse(json["deadlineSelfAssessment"]),
        deadlinePerformanceEvaluation:
            json["deadlinePerformanceEvaluation"] == null
                ? null
                : DateTime.parse(json["deadlinePerformanceEvaluation"]),
        strategy: json["strategy"] == null
            ? null
            : StrategyDeadlines.fromJson(json["strategy"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deadlineLOC": deadlineLoc?.toIso8601String(),
        "deadlineConfirmLOC": deadlineConfirmLoc?.toIso8601String(),
        "deadlineSelfAssessment": deadlineSelfAssessment?.toIso8601String(),
        "deadlinePerformanceEvaluation":
            deadlinePerformanceEvaluation?.toIso8601String(),
        "strategy": strategy?.toJson(),
      };
}

class StrategyDeadlines {
  int id;
  NameStrategy name;

  StrategyDeadlines({
    required this.id,
    required this.name,
  });

  factory StrategyDeadlines.fromJson(Map<String, dynamic> json) =>
      StrategyDeadlines(
        id: json["id"],
        name: nameValuesDeadline.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValuesDeadline.reverse[name],
      };
}

enum NameStrategy { HUMAN_RESOURCES, PRIVATE_EQUITY, SALES, VENTURE }

final nameValuesDeadline = EnumValues({
  "Human Resources": NameStrategy.HUMAN_RESOURCES,
  "Private Equity": NameStrategy.PRIVATE_EQUITY,
  "Sales": NameStrategy.SALES,
  "Venture": NameStrategy.VENTURE
});

class ResponseDeadline {
  final int id;
  final String dateDeadline;
  final String deadline;
  final String department;
  final String subDepartment;
  StrategyDeadlines? strategy;

  ResponseDeadline({
    required this.id,
    required this.dateDeadline,
    required this.deadline,
    required this.department,
    required this.subDepartment,
    this.strategy,
  });
}
