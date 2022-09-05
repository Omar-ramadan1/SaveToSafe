import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savetosafe/core/service/auth_api_service.dart';
import 'package:savetosafe/core/utils/globals.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/screens/add_personal_info_page.dart';
import 'package:savetosafe/ui/screens/auth/registration_page.dart';
import 'package:savetosafe/widgets/language_switch.dart';

class LoginPage extends StatefulWidget {
  static const String route = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? dropdownValue;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool remeberMe = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dropdownValue = Intl.getCurrentLocale();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).loginPageTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(bottom: 80),
                child: LanguageSwitch(),
                // child: DropdownButton<String>(
                //   value: dropdownValue,
                //   iconSize: 24,
                //   elevation: 16,
                //   style: const TextStyle(color: Colors.deepPurple),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue;
                //       Globals.preferences?.setString(Constants.locale, newValue ?? "de");
                //     });
                //     S.load(Locale(newValue!));
                //   },
                //   items: S.delegate.supportedLocales.map<DropdownMenuItem<String>>((Locale locale) {
                //     return DropdownMenuItem(
                //       child: Text(locale.languageCode),
                //       value: locale.languageCode,
                //     );
                //   }).toList(),
                // ),
              ),
              Form(
                key: _key,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: TextFormField(
                        controller: usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: S.of(context).loginPageEmailLabel,
                          hintText: S.of(context).loginPageEmailHint,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(4),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return S.of(context).loginPageEmailErrorEmpty;
                          }
                          if (!EmailValidator.validate(value ?? '')) {
                            return S.of(context).loginPageEmailErrorInvalid;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: S.of(context).loginPagePasswordLabel,
                          hintText: S.of(context).loginPagePasswordHint,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(4),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return S.of(context).loginPagePasswordErrorEmpty;
                          }
                          if (((value?.length) ?? 0) < 6) {
                            return S.of(context).loginPagePasswordErrorWeak;
                          }
                          // if (!isPasswordStrong(value ?? '')) {
                          //   return S.of(context).loginPagePasswordErrorWeak;
                          // }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: remeberMe,
                          onChanged: (value) {
                            setState(() {
                              remeberMe = value ?? true;
                            });
                          },
                        ),
                        Text(S.of(context).loginPageRememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(S.of(context).loginPageForgotPwd),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(),
                  child: Text(S.of(context).loginPageLoginButton),
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      Globals.user = await AuthAPIService.loginAPI(
                        email: usernameController.text,
                        password: passwordController.text,
                        rememberMe: remeberMe,
                        context: context,
                      );
                      if (Globals.user?.email != null) {
                        Navigator.of(context)
                            .pushReplacementNamed(AddPersonalInfoPage.route);
                      }
                    }
                  },
                ),
              ),
              ElevatedButton(
                child: Text(S.of(context).loginPageRegisterButton),
                onPressed: () {
                  Navigator.of(context).pushNamed(RegistrationPage.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
