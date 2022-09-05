// To parse this JSON data, do
//
//     final cono = conoFromJson(jsonString);

import 'dart:convert';

class Debt {
  Debt({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.amount,
    this.createdAt,
  });

  final int? id;
  final String name;
  final String phone;
  final String address;
  final double amount;
  final DateTime? createdAt;

  Debt copyWith({
    int? id,
    String? name,
    String? phone,
    String? address,
    double? amount,
    DateTime? createdAt,
  }) =>
      Debt(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
      );

  String toRawJson() => json.encode(toJson());

  factory Debt.fromJson(Map<String, dynamic> json) => Debt(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        amount: json["amount"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "phone": phone,
        "address": address,
        "amount": amount,
        // "created_at": createdAt?.toIso8601String(),
      };
}
