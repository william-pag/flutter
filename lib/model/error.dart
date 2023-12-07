import 'dart:convert';

class Error {
  List<ErrorElement> errors;
  dynamic data;

  Error({
    required this.errors,
    required this.data,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errors: List<ErrorElement>.from(
            json["errors"].map((x) => ErrorElement.fromJson(x))),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
        "data": data,
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
