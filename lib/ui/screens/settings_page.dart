import 'package:flutter/material.dart';
import 'package:savetosafe/core/utils/constants.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/widgets/custom_text_form_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String route = "settings-page";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? alarmTimeDropdownValue;
  String? alarmMessageDropdownValue;

  final TextEditingController oldPwdController = TextEditingController();
  final TextEditingController newPwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    alarmTimeDropdownValue = Constants.alarmIntervals[1];
    alarmMessageDropdownValue = Constants.alarmMessage[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsPageTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(S.of(context).settingsPageLanguage),
              // trailing: LanguageSwitch(),
            ),
            ExpansionTile(
              title: Text(S.of(context).settingsPageChangePwd),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        CustomTextFormWidget(
                          textController: oldPwdController,
                          obscureText: true,
                          labelText: S.of(context).settingsPageChangePwdOldPwd,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return S
                                  .of(context)
                                  .settingsPageChangePwdEmptyError;
                            }
                          },
                        ),
                        CustomTextFormWidget(
                          textController: newPwdController,
                          obscureText: true,
                          labelText: S.of(context).settingsPageChangePwdNewPwd,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return S
                                  .of(context)
                                  .settingsPageChangePwdEmptyError;
                            } else if (value!.length < 8) {
                              return S
                                  .of(context)
                                  .settingsPageChangePwdWeakError;
                            }
                          },
                        ),
                        CustomTextFormWidget(
                          textController: confirmPwdController,
                          obscureText: true,
                          labelText:
                              S.of(context).settingsPageChangePwdNewPwdCnf,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return S
                                  .of(context)
                                  .settingsPageChangePwdEmptyError;
                            }
                            if (value != newPwdController.text) {
                              return S
                                  .of(context)
                                  .settingsPageChangePwdMismatchError;
                            }
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child:
                              Text(S.of(context).settingsPageChangePwdButton),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(S.of(context).settingsPageAlarmInterval),
              trailing: DropdownButton<String>(
                value: alarmTimeDropdownValue,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String? newValue) {
                  setState(() {
                    alarmTimeDropdownValue = newValue;
                  });
                },
                items: Constants.alarmIntervals
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    child: Text(
                        S.of(context).settingsPageAlarmIntervalDropDown(value)),
                    value: value,
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title: Text(S.of(context).settingsPageAlarmMessage),
              trailing: DropdownButton<String>(
                value: alarmMessageDropdownValue,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String? newValue) {
                  setState(() {
                    alarmMessageDropdownValue = newValue;
                  });
                },
                items: Constants.alarmMessage
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    child: Text(
                        S.of(context).settingsPageAlarmMessageDropDown(value)),
                    value: value,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
