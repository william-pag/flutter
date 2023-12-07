class ErrorResponse {
  List<ErrorElement> errors;

  ErrorResponse({
    required this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        errors: List<ErrorElement>.from(
            json["errors"].map((x) => ErrorElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class ErrorElement {
  String message;
  Extensions extensions;

  ErrorElement({
    required this.message,
    required this.extensions,
  });

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        extensions: Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "extensions": extensions.toJson(),
      };
}

class Extensions {
  String code;

  Extensions({
    required this.code,
  });

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
