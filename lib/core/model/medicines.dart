
// To parse this JSON data, do
//
//     final debt = debtFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:savetosafe/core/utils/globals.dart';

enum Repetition { daily, weekly, monthly }

class Medicine {
  Medicine({
    this.id,
    required this.name,
    required this.repetition,
    this.repetitionDates = const [],
    this.repetitionTime = const [],
    this.repetitionDays = const [],
    required this.numberOfRepetition,
    this.createdAt,
  });

  final int? id;
  final String name;
  final Repetition repetition;
  final List<int> repetitionDates;
  final List<String> repetitionDays;
  final List<String> repetitionTime;
  final int numberOfRepetition;
  final DateTime? createdAt;

  Medicine copyWith({
    int? id,
    String? name,
    Repetition? repetition,
    List<int>? repetitionDates,
    List<String>? repetitionDays,
    List<String>? repetitionTimes,
    int? numberOfRepetition,
    DateTime? createdAt,
  }) =>
      Medicine(
        id: id ?? this.id,
        name: name ?? this.name,
        repetition: repetition ?? this.repetition,
        repetitionDates: repetitionDates ?? this.repetitionDates,
        repetitionDays: repetitionDays ?? this.repetitionDays,
        repetitionTime: repetitionTimes ?? this.repetitionTime,
        numberOfRepetition: numberOfRepetition ?? this.numberOfRepetition,
        createdAt: createdAt ?? this.createdAt,
      );

  String toRawJson() => json.encode(toJson());

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        name: json["name"],
        repetition: Repetition.values.firstWhere((r) {
          return r.toString().split(".")[1] == json["repetition"];
        }),
        repetitionDates: json["repetition_dates"] == null
            ? []
            : List<int>.from(json["repetition_dates"].map((x) => x)),
        repetitionDays: json["repetition_days"] == null
            ? []
            : List<String>.from(json["repetition_days"].map((x) => x)),
        repetitionTime: json["repetition_times"] == null
            ? []
            : List<String>.from(json["repetition_times"].map((x) => x)),
        numberOfRepetition: json["number_of_repetition"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() {
    var now = DateTime.now();
    switch (this.repetition) {
      case Repetition.daily:
        for (int i = 0; i < this.repetitionTime.length; i++) {
          this.repetitionTime[i] = DateFormat("HH:mm").format(
            DateTime(
              now.year,
              now.month,
              now.day,
              int.parse(this.repetitionTime[i].split(":")[0].trim()),
              int.parse(this.repetitionTime[i].split(":")[1].trim()),
            ),
          );
        }
        break;
      case Repetition.weekly:
        for (int i = 0; i < this.repetitionDays.length; i++) {
          this.repetitionDays[i] =
              Globals.weekDays[this.repetitionDays[i].trim()]!;
        }
        break;
      case Repetition.monthly:
        for (int i = 0; i < this.repetitionDates.length; i++) {
          this.repetitionDates[i] = this.repetitionDates[i];
        }
        break;
    }

    return {
      "id": id,
      "name": name,
      "repetition": repetition.toString().split(".")[1],
      "repetition_dates": List<int>.from(repetitionDates.map((x) => x)),
      "repetition_days": List<dynamic>.from(repetitionDays.map((x) => x)),
      "repetition_times": List<dynamic>.from(repetitionTime.map((x) => x)),
      "number_of_repetition": numberOfRepetition,
      // "created_at": createdAt.toIso8601String(),
    };
  }
}
