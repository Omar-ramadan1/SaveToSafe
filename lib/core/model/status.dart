import 'dart:convert';

class Status {
  Status({
    required this.code,
    required this.message,
    required this.validation,
  });

  final int code;
  final String message;
  final List<dynamic> validation;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
        validation: List<dynamic>.from(json["validation"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "validation": List<dynamic>.from(validation.map((x) => x)),
      };
}
