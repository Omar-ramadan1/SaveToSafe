import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:savetosafe/core/model/debt.dart';
import 'package:savetosafe/core/service/api_base.dart';

class DebtAPIService extends APIBase<Debt> {
  late String API_URI;
  BuildContext context;

  DebtAPIService(this.context) {
    API_URI = BASE_URL + '/debts';
  }

  @override
  Future<Debt> create(Debt debt) async {
    Debt? createdDebt;
    try {
      var url = Uri.parse(API_URI);

      var body = new Map<String, dynamic>();
      body['name'] = debt.name;
      body['phone'] = debt.phone;
      body['address'] = debt.address;
      body['amount'] = debt.amount;

      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        createdDebt = Debt.fromJson(json["content"][0]);
      } else {
        final snackBar = new SnackBar(
          content: new Text('${response.statusCode}: ${response.reasonPhrase}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
        throw Exception("Failed response");
      }
    } catch (e) {
      log(e.toString());
    }
    return createdDebt!;
  }

  @override
  Future<bool> delete(int id) async {
    bool isDeleted = false;
    try {
      var url = Uri.parse(API_URI + "/$id");
      final response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        isDeleted = true;
      } else {
        final snackBar = new SnackBar(
          content: new Text('${response.statusCode}: ${response.reasonPhrase}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      log(e.toString());
    }
    return isDeleted;
  }

  @override
  Future<List<Debt>> get() async {
    List<Debt> debt = [];
    try {
      var url = Uri.parse(API_URI);
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        debt = List<Debt>.from(
            json["content"]["data"].map((x) => Debt.fromJson(x)));
      } else {
        final snackBar = new SnackBar(
          content: new Text('${response.statusCode}: ${response.reasonPhrase}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      log(e.toString());
    }
    return debt;
  }

  @override
  Future<Debt> update(Debt debt) async {
    assert(debt.id != null);
    Debt? createdDebt;
    try {
      var url = Uri.parse(API_URI + "/${debt.id}");

      var body = new Map<String, dynamic>();
      body['name'] = debt.name;
      body['phone'] = debt.phone;
      body['address'] = debt.address;
      body['amount'] = debt.amount;
      body['_method'] = 'put';

      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        createdDebt = Debt.fromJson(json["content"][0]);
      } else {
        final snackBar = new SnackBar(
          content: new Text('${response.statusCode}: ${response.reasonPhrase}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
        throw Exception("Failed response");
      }
    } catch (e) {
      log(e.toString());
    }
    return createdDebt!;
  }
}
