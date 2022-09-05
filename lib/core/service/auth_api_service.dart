import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:savetosafe/core/model/response.dart';
import 'package:savetosafe/core/utils/constants.dart';
import 'package:savetosafe/core/utils/globals.dart';

class AuthAPIService {
  static const BASE_URL = 'https://backend.savetosafe.com/api/v1';

  static Future<User> loginAPI({
    required String email,
    required String password,
    bool rememberMe = true,
    required BuildContext context,
  }) async {
    User user;
    const API_URI = '$BASE_URL/auth/login';

    final headers = <String, String>{}..addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

    var body = new Map<String, dynamic>();
    body['remember_me'] = rememberMe;
    body['email'] = email;
    body['password'] = password;

    try {
      var url = Uri.parse(API_URI);
      final response =
          await http.post(url, body: json.encode(body), headers: headers);

      if (response.statusCode == 200) {
        Response data = Response.fromJson(json.decode(response.body));
        user = data.content!.user!;
        Globals.accessToken = data.content!.accessToken!;
        log("${user.email} successfully logged in");
      } else {
        final snackBar = new SnackBar(
          content:
              new Text('${json.decode(response.body)['status']['message']}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
        user = User();
      }
    } catch (e) {
      log(e.toString());
      user = User();
    }
    return user;
  }

  static Future<bool> signUpAPI({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
    required BuildContext context,
  }) async {
    const API_URI = '$BASE_URL/auth/signup';

    final headers = <String, String>{}..addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

    var body = Map<String, dynamic>();

    body['name'] = name;
    body['email'] = email;
    body['phone'] = phone;
    body['password'] = password;
    body['password_confirmation'] = password;
    body['type'] = role;

    try {
      var url = Uri.parse(API_URI);
      final response =
          await http.post(url, body: json.encode(body), headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final snackBar = new SnackBar(
          content: new Text(data['status']['message']),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
      } else {
        final snackBar = new SnackBar(
          content:
              new Text('${json.decode(response.body)['status']['message']}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
    return true;
  }

  static Future<bool> logoutAPI(context) async {
    const API_URI = '$BASE_URL/auth/logout';

    var token = Globals.preferences!.getString(Constants.accessToken);

    final headers = <String, String>{}..addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

    try {
      var url = Uri.parse(API_URI);
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Globals.user = null;
        Globals.accessToken = '';
        log("${Globals.user?.email} successfully logged out");
      } else {
        final snackBar = new SnackBar(
          content: new Text('${response.statusCode}: ${response.reasonPhrase}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        log('${response.statusCode}: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
    return true;
  }
}
