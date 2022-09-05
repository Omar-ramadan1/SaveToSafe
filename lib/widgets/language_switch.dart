import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';
import 'package:savetosafe/core/utils/constants.dart';
import 'package:savetosafe/core/utils/globals.dart';
import 'package:savetosafe/generated/l10n.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({Key? key}) : super(key: key);

  @override
  _LanguageSwitchState createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  String? languageDropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    languageDropdownValue = Intl.getCurrentLocale();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: languageDropdownValue,
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? newValue) {
        languageDropdownValue = newValue;
        Globals.preferences?.setString(Constants.locale, newValue ?? "de");
        S.load(Locale(newValue!));
        Phoenix.rebirth(context);
      },
      items: S.delegate.supportedLocales
          .map<DropdownMenuItem<String>>((Locale locale) {
        return DropdownMenuItem(
          child: Text(locale.languageCode),
          value: locale.languageCode,
        );
      }).toList(),
    );
  }
}
