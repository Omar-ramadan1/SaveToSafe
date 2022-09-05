// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static String m0(count) => "Authorized Person ${count}";

  static String m1(roleDropDown) => "${Intl.select(roleDropDown, {
            'owner': 'Owner',
            'guardian': 'Guardian',
          })}";

  static String m2(medicineRepetitionValue) =>
      "${Intl.select(medicineRepetitionValue, {
            'daily': 'Daily',
            'weekly': 'Weekly',
            'monthly': 'Monthly',
          })}";

  static String m3(alarmIntervalDropDown) =>
      "${Intl.select(alarmIntervalDropDown, {
            'every_9_hours': 'Every 9 hours',
            'every_12_hours': 'Every 12 hours',
            'every_24_hours': 'Every 24 hours',
          })}";

  static String m4(alarmMessageDropDown) =>
      "${Intl.select(alarmMessageDropDown, {
            'are_you_ok': 'Are you ok?',
            'hope_you_are_fine': 'Hope you are fine',
            'stay_healthy': 'Stay Healthy!',
            'want_to_check_on_you': 'Want to check on you',
            'other': 'Other',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("Save2Safe"),
        "assetPageAddNewButton":
            MessageLookupByLibrary.simpleMessage("Add new"),
        "assetPageBank": MessageLookupByLibrary.simpleMessage("Bank"),
        "assetPageBankAccNumber":
            MessageLookupByLibrary.simpleMessage("Account number"),
        "assetPageBankAccOwner":
            MessageLookupByLibrary.simpleMessage("Account owner"),
        "assetPageBankName": MessageLookupByLibrary.simpleMessage("Bank name"),
        "assetPageInsurance": MessageLookupByLibrary.simpleMessage("Insurance"),
        "assetPageInsuranceAgency":
            MessageLookupByLibrary.simpleMessage("Insurance agency"),
        "assetPageInsuranceNumber":
            MessageLookupByLibrary.simpleMessage("Insurance number"),
        "assetPageMobility": MessageLookupByLibrary.simpleMessage("Mobility"),
        "assetPageMobilityMark": MessageLookupByLibrary.simpleMessage("Mark"),
        "assetPageMobilityRegNum":
            MessageLookupByLibrary.simpleMessage("Registration number"),
        "assetPageNextButton": MessageLookupByLibrary.simpleMessage("Next"),
        "assetPageOther": MessageLookupByLibrary.simpleMessage("Other"),
        "assetPageOtherBusinessLicense":
            MessageLookupByLibrary.simpleMessage("Business license"),
        "assetPageOtherDistrictOffice":
            MessageLookupByLibrary.simpleMessage("District Court/ Tax office"),
        "assetPageOtherItemAddress":
            MessageLookupByLibrary.simpleMessage("Address of the item"),
        "assetPageOtherOtherRegNum":
            MessageLookupByLibrary.simpleMessage("Registration number"),
        "assetPagePrevButton": MessageLookupByLibrary.simpleMessage("Prev"),
        "assetPageProperty": MessageLookupByLibrary.simpleMessage("Property"),
        "assetPagePropertyAddress":
            MessageLookupByLibrary.simpleMessage("Address"),
        "assetPagePropertyApartmentLand":
            MessageLookupByLibrary.simpleMessage("Apartment land register no."),
        "assetPagePropertyDistrictCourt":
            MessageLookupByLibrary.simpleMessage("District Court"),
        "assetPagePropertyDivisionLand":
            MessageLookupByLibrary.simpleMessage("Division land register no."),
        "assetPageTitle": MessageLookupByLibrary.simpleMessage("Your assets"),
        "assetPageTypeDropDownField":
            MessageLookupByLibrary.simpleMessage("Type"),
        "authorityPageAddPersonButton":
            MessageLookupByLibrary.simpleMessage("Add Authorized person"),
        "authorityPageAddressError":
            MessageLookupByLibrary.simpleMessage("Address cannot be empty"),
        "authorityPageAddressLabel":
            MessageLookupByLibrary.simpleMessage("Address"),
        "authorityPageEmailError":
            MessageLookupByLibrary.simpleMessage("E-mail cannot be empty"),
        "authorityPageEmailLabel":
            MessageLookupByLibrary.simpleMessage("E-mail"),
        "authorityPageFullnameError":
            MessageLookupByLibrary.simpleMessage("Name cannot be empty"),
        "authorityPageFullnameLabel":
            MessageLookupByLibrary.simpleMessage("Full name"),
        "authorityPageHeading": m0,
        "authorityPageMobileError": MessageLookupByLibrary.simpleMessage(
            "Mobile number cannot be empty"),
        "authorityPageMobileLabel":
            MessageLookupByLibrary.simpleMessage("Mobile number"),
        "authorityPageRelationshipError":
            MessageLookupByLibrary.simpleMessage("Cannot be empty"),
        "authorityPageRelationshipLabel":
            MessageLookupByLibrary.simpleMessage("Relationship degree"),
        "authorityPageTitle":
            MessageLookupByLibrary.simpleMessage("Add Authority"),
        "debtsPageAddress": MessageLookupByLibrary.simpleMessage("Address"),
        "debtsPageAddressError":
            MessageLookupByLibrary.simpleMessage("Address cannot be empty"),
        "debtsPageDebt": MessageLookupByLibrary.simpleMessage("Debt ID"),
        "debtsPageDesc": MessageLookupByLibrary.simpleMessage("I owe to"),
        "debtsPageName": MessageLookupByLibrary.simpleMessage("Name"),
        "debtsPageNameError":
            MessageLookupByLibrary.simpleMessage("Name cannot be empty"),
        "debtsPageNewDebt": MessageLookupByLibrary.simpleMessage("New Debt"),
        "debtsPagePhone": MessageLookupByLibrary.simpleMessage("Phone"),
        "debtsPagePhoneError":
            MessageLookupByLibrary.simpleMessage("Phone cannot be empty"),
        "debtsPageSaveButton": MessageLookupByLibrary.simpleMessage("Save"),
        "debtsPageTitle": MessageLookupByLibrary.simpleMessage("Add Debts"),
        "debtsPageValue": MessageLookupByLibrary.simpleMessage("Value (in €)"),
        "debtsPageValueError":
            MessageLookupByLibrary.simpleMessage("Value cannot be empty"),
        "loginPageEmailErrorEmpty":
            MessageLookupByLibrary.simpleMessage("Email cannot be empty"),
        "loginPageEmailErrorInvalid":
            MessageLookupByLibrary.simpleMessage("Invalid email"),
        "loginPageEmailHint":
            MessageLookupByLibrary.simpleMessage("abc@example.com"),
        "loginPageEmailLabel":
            MessageLookupByLibrary.simpleMessage("Enter email"),
        "loginPageForgotPwd":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "loginPageLoginButton": MessageLookupByLibrary.simpleMessage("Login"),
        "loginPagePasswordErrorEmpty":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "loginPagePasswordErrorWeak":
            MessageLookupByLibrary.simpleMessage("Weak Password"),
        "loginPagePasswordHint":
            MessageLookupByLibrary.simpleMessage("Password"),
        "loginPagePasswordLabel":
            MessageLookupByLibrary.simpleMessage("Enter password"),
        "loginPageRegisterButton":
            MessageLookupByLibrary.simpleMessage("Register"),
        "loginPageRememberMe":
            MessageLookupByLibrary.simpleMessage("Remember me"),
        "loginPageTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "personalInfoPageAddressError":
            MessageLookupByLibrary.simpleMessage("Address cannot be empty"),
        "personalInfoPageAddressLabel":
            MessageLookupByLibrary.simpleMessage("Address"),
        "personalInfoPageAltAddressError": MessageLookupByLibrary.simpleMessage(
            "Alternate address cannot be empty"),
        "personalInfoPageAltAddressLabel":
            MessageLookupByLibrary.simpleMessage("Alternate address"),
        "personalInfoPageDateOfBirthError":
            MessageLookupByLibrary.simpleMessage("Invalid date of birth"),
        "personalInfoPageDateOfBirthLabel":
            MessageLookupByLibrary.simpleMessage("Date of Birth"),
        "personalInfoPageEmailError":
            MessageLookupByLibrary.simpleMessage("Invalid email"),
        "personalInfoPageEmailLabel":
            MessageLookupByLibrary.simpleMessage("Email address"),
        "personalInfoPageFirstNameError":
            MessageLookupByLibrary.simpleMessage("First name cannot be empty"),
        "personalInfoPageFirstNameLabel":
            MessageLookupByLibrary.simpleMessage("First name"),
        "personalInfoPageLastNameError":
            MessageLookupByLibrary.simpleMessage("Last name cannot be empty"),
        "personalInfoPageLastNameLabel":
            MessageLookupByLibrary.simpleMessage("Last name"),
        "personalInfoPageNationalityError":
            MessageLookupByLibrary.simpleMessage("Nationality cannot be empty"),
        "personalInfoPageNationalityLabel":
            MessageLookupByLibrary.simpleMessage("Nationality"),
        "personalInfoPageNextButton":
            MessageLookupByLibrary.simpleMessage("Next"),
        "personalInfoPageTelephoneError":
            MessageLookupByLibrary.simpleMessage("Invalid telephone number"),
        "personalInfoPageTelephoneLabel":
            MessageLookupByLibrary.simpleMessage("Telephone number"),
        "personalInfoPageTitle":
            MessageLookupByLibrary.simpleMessage("Add Personal Info"),
        "registrationPageEmailError":
            MessageLookupByLibrary.simpleMessage("Invalid Email"),
        "registrationPageEmailLabel":
            MessageLookupByLibrary.simpleMessage("Email"),
        "registrationPageNameError":
            MessageLookupByLibrary.simpleMessage("Name cannot be empty"),
        "registrationPageNameLabel":
            MessageLookupByLibrary.simpleMessage("Full name"),
        "registrationPagePasswordConfirmError":
            MessageLookupByLibrary.simpleMessage("Password mismatch"),
        "registrationPagePasswordConfirmLabel":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "registrationPagePasswordError":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "registrationPagePasswordLabel":
            MessageLookupByLibrary.simpleMessage("Password"),
        "registrationPagePhoneError":
            MessageLookupByLibrary.simpleMessage("Invalid Phone"),
        "registrationPagePhoneLabel":
            MessageLookupByLibrary.simpleMessage("Phone"),
        "registrationPageRegisterButton":
            MessageLookupByLibrary.simpleMessage("Register"),
        "registrationPageRoleDropdown": m1,
        "registrationPageRoleError":
            MessageLookupByLibrary.simpleMessage("Please select a role"),
        "registrationPageSigninButton":
            MessageLookupByLibrary.simpleMessage("Already registered? Login"),
        "registrationPageTitle":
            MessageLookupByLibrary.simpleMessage("Registration"),
        "registrationPageType": MessageLookupByLibrary.simpleMessage("Role"),
        "reminderPageAppointment":
            MessageLookupByLibrary.simpleMessage("Appointment"),
        "reminderPageAppointmentAdd":
            MessageLookupByLibrary.simpleMessage("Add appointment"),
        "reminderPageAppointmentDate":
            MessageLookupByLibrary.simpleMessage("Date"),
        "reminderPageAppointmentName":
            MessageLookupByLibrary.simpleMessage("Appointment name"),
        "reminderPageAppointmentNameError":
            MessageLookupByLibrary.simpleMessage(
                "Appointment name cannot be empty"),
        "reminderPageAppointmentSave":
            MessageLookupByLibrary.simpleMessage("Save appointment"),
        "reminderPageCreatedAt":
            MessageLookupByLibrary.simpleMessage("Created at"),
        "reminderPageDelete": MessageLookupByLibrary.simpleMessage("Delete"),
        "reminderPageEdit": MessageLookupByLibrary.simpleMessage("Edit"),
        "reminderPageMedicine":
            MessageLookupByLibrary.simpleMessage("Medicine"),
        "reminderPageMedicineAdd":
            MessageLookupByLibrary.simpleMessage("Add medicine"),
        "reminderPageMedicineName":
            MessageLookupByLibrary.simpleMessage("Medicine name"),
        "reminderPageMedicineNameError": MessageLookupByLibrary.simpleMessage(
            "Medicine name cannot be empty"),
        "reminderPageMedicineRepetition":
            MessageLookupByLibrary.simpleMessage("Repetition on"),
        "reminderPageMedicineRepetitionCount":
            MessageLookupByLibrary.simpleMessage("No. of Repetition"),
        "reminderPageMedicineRepetitionType":
            MessageLookupByLibrary.simpleMessage("Repeat"),
        "reminderPageMedicineRepetitionTypeValue": m2,
        "reminderPageMedicineSave":
            MessageLookupByLibrary.simpleMessage("Save medicine"),
        "reminderPageTitle": MessageLookupByLibrary.simpleMessage("Reminders"),
        "settingsPageAlarmInterval":
            MessageLookupByLibrary.simpleMessage("Alarm Interval"),
        "settingsPageAlarmIntervalDropDown": m3,
        "settingsPageAlarmMessage":
            MessageLookupByLibrary.simpleMessage("Alarm Message"),
        "settingsPageAlarmMessageDropDown": m4,
        "settingsPageChangePwd":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "settingsPageChangePwdButton":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "settingsPageChangePwdEmptyError":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "settingsPageChangePwdMismatchError":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "settingsPageChangePwdNewPwd":
            MessageLookupByLibrary.simpleMessage("New Password"),
        "settingsPageChangePwdNewPwdCnf":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "settingsPageChangePwdOldPwd":
            MessageLookupByLibrary.simpleMessage("Old Password"),
        "settingsPageChangePwdWeakError":
            MessageLookupByLibrary.simpleMessage("Password is too weak"),
        "settingsPageLanguage":
            MessageLookupByLibrary.simpleMessage("Language"),
        "settingsPageTitle": MessageLookupByLibrary.simpleMessage("Settings")
      };
}
