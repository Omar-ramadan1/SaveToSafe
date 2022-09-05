import 'package:flutter/material.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/screens/add_assets_page/add_assets_page.dart';

class AddPersonalInfoPage extends StatelessWidget {
  static const String route = 'personal_info';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).personalInfoPageTitle),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageLastNameLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageFirstNameLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageDateOfBirthLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageAddressLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageAltAddressLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageTelephoneLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageEmailLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).personalInfoPageNationalityLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: ElevatedButton(
                    child: Text(S.of(context).personalInfoPageNextButton),
                    onPressed: () {
                      Navigator.pushNamed(context, AddAssetsPage.route);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
