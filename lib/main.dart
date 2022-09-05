import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:savetosafe/core/utils/globals.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/screens/add_authority_persons.dart';
import 'package:savetosafe/ui/screens/add_debts_page.dart';
import 'package:savetosafe/ui/screens/add_personal_info_page.dart';
import 'package:savetosafe/ui/screens/add_reminders_page.dart';
import 'package:savetosafe/ui/screens/settings_page.dart';

import 'widgets/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Globals.initialize();
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return S.of(context).appTitle;
      },
      darkTheme: ThemeData.dark(),
      onGenerateRoute: router.generateRoute,
    //  home: AddPersonalInfoPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        Locale('de', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // TODO: Fix when making final routing based on personal data
      initialRoute: Globals.accessToken == "" ? '/' : AddPersonalInfoPage.route,
      // initialRoute: '/',
    );
  }
}
