class OverallProgress {
  int percentComplete;
  int complete;
  int overall;

  OverallProgress({
    required this.percentComplete,
    required this.complete,
    required this.overall,
  });

  factory OverallProgress.fromJson(Map<String, dynamic> json) =>
      OverallProgress(
        percentComplete: json["percentComplete"],
        complete: json["complete"],
        overall: json["overall"],
      );

  Map<String, dynamic> toJson() => {
        "percentComplete": percentComplete,
        "complete": complete,
        "overall": overall,
      };
}
