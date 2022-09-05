import 'package:flutter/material.dart';
import 'package:savetosafe/ui/screens/add_assets_page/add_assets_page.dart';
import 'package:savetosafe/ui/screens/add_authority_persons.dart';
import 'package:savetosafe/ui/screens/add_debts_page.dart';
import 'package:savetosafe/ui/screens/add_personal_info_page.dart';
import 'package:savetosafe/ui/screens/add_reminders_page.dart';
import 'package:savetosafe/ui/screens/auth/login_page.dart';
import 'package:savetosafe/ui/screens/auth/registration_page.dart';
import 'package:savetosafe/ui/screens/settings_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //TODO: Remove / case return
    case '/':
    // return MaterialPageRoute(builder: (context) => AddRemindersPage());
    case LoginPage.route:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case RegistrationPage.route:
      return MaterialPageRoute(builder: (context) => RegistrationPage());
    case AddPersonalInfoPage.route:
      return MaterialPageRoute(builder: (context) => AddPersonalInfoPage());
    case AddAssetsPage.route:
      return MaterialPageRoute(builder: (context) => AddAssetsPage());
    case AddDebtsPage.route:
      return MaterialPageRoute(builder: (context) => AddDebtsPage());
    case AddAuthorityPerson.route:
      return MaterialPageRoute(builder: (context) => AddAuthorityPerson());
    case AddRemindersPage.route:
      return MaterialPageRoute(builder: (context) => AddRemindersPage());
    case SettingsPage.route:
      return MaterialPageRoute(builder: (context) => SettingsPage());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
