import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:savetosafe/core/service/auth_api_service.dart';
import 'package:savetosafe/core/utils/constants.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/screens/auth/login_page.dart';

class RegistrationPage extends StatefulWidget {
  static const String route = 'register';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? role;

  @override
  void initState() {
    super.initState();
    role = Constants.roles[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).registrationPageTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).registrationPageNameLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return S.of(context).registrationPageNameError;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).registrationPagePhoneLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _phoneController,
                    maxLength: 10,
                    validator: (value) {
                      if ((value?.isEmpty ?? true) ||
                          ((value?.length ?? 0) != 10)) {
                        return S.of(context).registrationPagePhoneError;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).registrationPageEmailLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    validator: (value) {
                      if ((value?.isEmpty ?? true) ||
                          (!EmailValidator.validate(value ?? ''))) {
                        return S.of(context).registrationPageEmailError;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).registrationPagePasswordLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return S.of(context).registrationPagePasswordError;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText:
                          S.of(context).registrationPagePasswordConfirmLabel,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController2,
                    validator: (value) {
                      if ((value?.isEmpty ?? true) ||
                          (value != _passwordController.text)) {
                        return S
                            .of(context)
                            .registrationPagePasswordConfirmError;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: DropdownButtonFormField(
                    onChanged: (String? value) {
                      setState(() {
                        role = value;
                      });
                    },
                    items: Constants.roles
                        .map((e) => DropdownMenuItem(
                              child: Text(S
                                  .of(context)
                                  .registrationPageRoleDropdown(e)),
                              value: e,
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: S.of(context).registrationPageType,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return S.of(context).registrationPageRoleError;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: Text(S.of(context).registrationPageRegisterButton),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        bool wasSuccess = await AuthAPIService.signUpAPI(
                          context: context,
                          email: _emailController.text,
                          name: _fullNameController.text,
                          password: _passwordController.text,
                          phone: _phoneController.text,
                          role: role!,
                        );
                        if (wasSuccess) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginPage.route, (route) => false);
                        }
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  child: Text(S.of(context).registrationPageSigninButton),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
