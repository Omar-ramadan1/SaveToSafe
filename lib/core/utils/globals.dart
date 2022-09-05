import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savetosafe/core/model/response.dart';
import 'package:savetosafe/core/utils/constants.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Globals {
  static SharedPreferences? preferences;
  static User? user;
  static String _accessToken = '';

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    preferences = await SharedPreferences.getInstance();
    _accessToken = preferences!.getString(Constants.accessToken) ?? '';
    Locale locale =
        Locale(preferences!.getString(Constants.locale) ?? Intl.systemLocale);
    print("Loading: ${locale.languageCode}");
    S.delegate.load(locale);
  }

  static String get accessToken => _accessToken;

  static set accessToken(String accessToken) {
    _accessToken = accessToken;
    preferences!.setString(Constants.accessToken, accessToken);
  }

  static const weekDays = <String, String>{
    "mon": "monday",
    "tue": "tuesday",
    "wed": "wednesday",
    "thu": "thursday",
    "fri": "friday",
    "sat": "saturday",
    "sun": "sunday",
  };
}
