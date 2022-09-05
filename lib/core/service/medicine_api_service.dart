import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:savetosafe/core/model/medicines.dart';
import 'package:savetosafe/core/service/api_base.dart';

class MedicineAPIService extends APIBase<Medicine> {
  late String API_URI;
  BuildContext context;

  MedicineAPIService(this.context) {
    this.API_URI = BASE_URL + '/medicines';
  }

  @override
  Future<Medicine> create(Medicine medicine) async {
    Medicine? createdMedicine;
    try {
      var url = Uri.parse(API_URI);

      final response = await http.post(url,
          headers: headers, body: jsonEncode(medicine.toJson()));

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        createdMedicine = Medicine.fromJson(json["content"][0]);
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
    return createdMedicine!;
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
  Future<List<Medicine>> get() async {
    List<Medicine> medicine = [];
    try {
      var url = Uri.parse(API_URI);
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        medicine = List<Medicine>.from(
            json["content"]["data"].map((x) => Medicine.fromJson(x)));
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
    return medicine;
  }

  @override
  Future<Medicine> update(Medicine medicine) async {
    assert(medicine.id != null);
    Medicine? createdMedicine;
    try {
      var url = Uri.parse(API_URI + "/${medicine.id}");

      var body = new Map<String, dynamic>();
      body.addAll(medicine.toJson());
      body['_method'] = "put";

      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        createdMedicine = Medicine.fromJson(json["content"][0]);
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
    return createdMedicine!;
  }
}
