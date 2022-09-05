import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:savetosafe/core/model/medical_appointment.dart';
import 'package:savetosafe/core/service/api_base.dart';

class MedicalAppointmentAPIService extends APIBase<MedicalAppointment> {
  late String API_URI;
  BuildContext context;

  MedicalAppointmentAPIService(this.context) {
    this.API_URI = BASE_URL + '/doctor-appointments';
  }

  @override
  Future<MedicalAppointment> create(MedicalAppointment appointment) async {
    MedicalAppointment? createdAppointment;
    try {
      var url = Uri.parse(API_URI);

      final response = await http.post(url,
          headers: headers, body: jsonEncode(appointment.toJson()));

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        createdAppointment = MedicalAppointment.fromJson(json["content"][0]);
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
    return createdAppointment!;
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
  Future<List<MedicalAppointment>> get() async {
    List<MedicalAppointment> appointments = [];
    try {
      var url = Uri.parse(API_URI);
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        appointments = List<MedicalAppointment>.from(
            json["content"]["data"].map((x) => MedicalAppointment.fromJson(x)));
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
    return appointments;
  }

  @override
  Future<MedicalAppointment> update(MedicalAppointment appointment) async {
    assert(appointment.id != null);
    MedicalAppointment? createdAppointment;
    try {
      var url = Uri.parse(API_URI + "/${appointment.id}");

      var body = new Map<String, dynamic>();
      body.addAll(appointment.toJson());
      body['_method'] = "put";

      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        log('${response.statusCode}: ${response.reasonPhrase}');
        Map<String, dynamic> json = jsonDecode(response.body);
        createdAppointment = MedicalAppointment.fromJson(json["content"][0]);
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
    return createdAppointment!;
  }
}
