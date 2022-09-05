import 'package:flutter/material.dart';
import 'package:savetosafe/core/utils/globals.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/screens/add_authority_persons.dart';
import 'package:savetosafe/ui/screens/add_debts_page.dart';
import 'package:savetosafe/ui/screens/add_reminders_page.dart';
import 'package:savetosafe/ui/screens/settings_page.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("${Globals.user?.name}"),
              accountEmail: Text("${Globals.user?.email}"),
              currentAccountPicture: CircleAvatar(
                  child: Text(
                Globals.user?.name?.substring(0, 1) ?? "S2S",
                style: Theme.of(context).textTheme.headline5,
              )),
              currentAccountPictureSize: Size.square(55),
            ),
            ListTile(
              title: Text(S.of(context).debtsPageTitle),
              onTap: () {
                Navigator.of(context).pushNamed(AddDebtsPage.route);
              },
            ),
            ListTile(
              title: Text(S.of(context).authorityPageTitle),
              onTap: () {
                Navigator.of(context).pushNamed(AddAuthorityPerson.route);
              },
            ),
            ListTile(
              title: Text(S.of(context).reminderPageTitle),
              onTap: () {
                Navigator.of(context).pushNamed(AddRemindersPage.route);
              },
            ),
            ListTile(
              title: Text(S.of(context).settingsPageTitle),
              onTap: () {
                Navigator.of(context).pushNamed(SettingsPage.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
