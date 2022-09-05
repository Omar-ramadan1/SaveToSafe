import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:savetosafe/core/model/response.dart';

class LoginAPIService {
  static const BASE_URL =
      'https://backend.savetosafe.com/api/v1';

  static Future<User> loginUser(context, String? username, String? password) async {
    User result;
    const API_URI = '$BASE_URL/auth/login';

    final headers = <String, String>{}
      ..addAll({
        'Accept': 'application/json',
      });

    var map = new Map<String, dynamic>();
    map['email'] = username ?? '';
    map['password'] = password ?? '';
    map['remember_me'] = 'true';

    try {
      var url = Uri.parse(API_URI);
      final response = await http.post(url, headers: headers, body: map);

      print(response.body);

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = User.fromJson(item);
      } else {
        final snackBar = new SnackBar(
            content:
            new Text('${response.statusCode}: ${response.reasonPhrase}'),
            backgroundColor: Colors.red);

        // Find the Scaffold in the Widget tree and use it to show a SnackBar!
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        log('${response.statusCode}: ${response.reasonPhrase}');

        result = User();
      }
    } catch (e) {
      log(e.toString());
      result = User();
    }

    return result;
  }

  static Future<User> registerUser(context, String? fullName, String? email, String? phone, String? password) async {
    User result;
    const API_URI = '$BASE_URL/auth/signup';

    final headers = <String, String>{}
      ..addAll({
        'Accept': 'application/json',
      });

    var map = new Map<String, dynamic>();
    map['name'] = fullName ?? '';
    map['email'] = email ?? '';
    map['phone'] = phone ?? '';
    map['password'] = password ?? '';
    map['password_confirmation'] = password ?? '';
    map['type'] = 'owner';

    try {
      var url = Uri.parse(API_URI);
      final response = await http.post(url, headers: headers, body: map);

      print(response.body);

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = User.fromJson(item);
      } else {
        final snackBar = new SnackBar(
            content:
            new Text('${response.statusCode}: ${response.reasonPhrase}'),
            backgroundColor: Colors.red);

        // Find the Scaffold in the Widget tree and use it to show a SnackBar!
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        log('${response.statusCode}: ${response.reasonPhrase}');

        result = User();
      }
    } catch (e) {
      log(e.toString());
      result = User();
    }

    return result;
  }
}