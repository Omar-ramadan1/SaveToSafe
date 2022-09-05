import 'dart:convert';

import 'package:intl/intl.dart';

class MedicalAppointment {
  MedicalAppointment({
    this.id,
    required this.name,
    required this.date,
    this.createdAt,
  });

  final int? id;
  final String name;
  final DateTime date;
  final DateTime? createdAt;

  MedicalAppointment copyWith({
    int? id,
    String? name,
    DateTime? date,
    DateTime? createdAt,
  }) =>
      MedicalAppointment(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
      );

  String toRawJson() => json.encode(toJson());

  factory MedicalAppointment.fromJson(Map<String, dynamic> json) =>
      MedicalAppointment(
        id: json["id"],
        name: json["name"],
        date: DateTime.parse(json["date"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "date": DateFormat("y-MM-dd HH:mm:ss").format(date),
        // "created_at": createdAt?.toIso8601String(),
      };
}
