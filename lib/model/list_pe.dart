class DataGetListPerformanceEvaluation {
  List<GetListPerformanceEvaluation> getListPerformanceEvaluations;

  DataGetListPerformanceEvaluation({
    required this.getListPerformanceEvaluations,
  });

  factory DataGetListPerformanceEvaluation.fromJson(Map<String, dynamic> json) => DataGetListPerformanceEvaluation(
        getListPerformanceEvaluations: List<GetListPerformanceEvaluation>.from(
            json["getListPerformanceEvaluations"]
                .map((x) => GetListPerformanceEvaluation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getListPerformanceEvaluations": List<dynamic>.from(
            getListPerformanceEvaluations.map((x) => x.toJson())),
      };
}
class GetListPerformanceEvaluation {
  bool isComplete;
  int completedPercentage;
  int completePerformance;
  int totalPerformance;
  UserPerformanceEvaluation user;

  GetListPerformanceEvaluation({
    required this.isComplete,
    required this.completedPercentage,
    required this.completePerformance,
    required this.totalPerformance,
    required this.user,
  });

  factory GetListPerformanceEvaluation.fromJson(Map<String, dynamic> json) =>
      GetListPerformanceEvaluation(
        isComplete: json["isComplete"],
        completedPercentage: json["completedPercentage"],
        completePerformance: json["completePerformance"],
        totalPerformance: json["totalPerformance"],
        user: UserPerformanceEvaluation.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "isComplete": isComplete,
        "completedPercentage": completedPercentage,
        "completePerformance": completePerformance,
        "totalPerformance": totalPerformance,
        "user": user.toJson(),
      };
}

class UserPerformanceEvaluation {
  int id;
  String name;
  String image;

  UserPerformanceEvaluation({
    required this.id,
    required this.name,
    required this.image,
  });

  factory UserPerformanceEvaluation.fromJson(Map<String, dynamic> json) => UserPerformanceEvaluation(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
