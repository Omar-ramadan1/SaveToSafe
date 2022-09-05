// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Save2Safe`
  String get appTitle {
    return Intl.message(
      'Save2Safe',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get assetPageAddNewButton {
    return Intl.message(
      'Add new',
      name: 'assetPageAddNewButton',
      desc: '',
      args: [],
    );
  }

  /// `Bank`
  String get assetPageBank {
    return Intl.message(
      'Bank',
      name: 'assetPageBank',
      desc: '',
      args: [],
    );
  }

  /// `Account number`
  String get assetPageBankAccNumber {
    return Intl.message(
      'Account number',
      name: 'assetPageBankAccNumber',
      desc: '',
      args: [],
    );
  }

  /// `Account owner`
  String get assetPageBankAccOwner {
    return Intl.message(
      'Account owner',
      name: 'assetPageBankAccOwner',
      desc: '',
      args: [],
    );
  }

  /// `Bank name`
  String get assetPageBankName {
    return Intl.message(
      'Bank name',
      name: 'assetPageBankName',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get assetPageInsurance {
    return Intl.message(
      'Insurance',
      name: 'assetPageInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Insurance agency`
  String get assetPageInsuranceAgency {
    return Intl.message(
      'Insurance agency',
      name: 'assetPageInsuranceAgency',
      desc: '',
      args: [],
    );
  }

  /// `Insurance number`
  String get assetPageInsuranceNumber {
    return Intl.message(
      'Insurance number',
      name: 'assetPageInsuranceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mobility`
  String get assetPageMobility {
    return Intl.message(
      'Mobility',
      name: 'assetPageMobility',
      desc: '',
      args: [],
    );
  }

  /// `Mark`
  String get assetPageMobilityMark {
    return Intl.message(
      'Mark',
      name: 'assetPageMobilityMark',
      desc: '',
      args: [],
    );
  }

  /// `Registration number`
  String get assetPageMobilityRegNum {
    return Intl.message(
      'Registration number',
      name: 'assetPageMobilityRegNum',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get assetPageNextButton {
    return Intl.message(
      'Next',
      name: 'assetPageNextButton',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get assetPageOther {
    return Intl.message(
      'Other',
      name: 'assetPageOther',
      desc: '',
      args: [],
    );
  }

  /// `Business license`
  String get assetPageOtherBusinessLicense {
    return Intl.message(
      'Business license',
      name: 'assetPageOtherBusinessLicense',
      desc: '',
      args: [],
    );
  }

  /// `District Court/ Tax office`
  String get assetPageOtherDistrictOffice {
    return Intl.message(
      'District Court/ Tax office',
      name: 'assetPageOtherDistrictOffice',
      desc: '',
      args: [],
    );
  }

  /// `Address of the item`
  String get assetPageOtherItemAddress {
    return Intl.message(
      'Address of the item',
      name: 'assetPageOtherItemAddress',
      desc: '',
      args: [],
    );
  }

  /// `Registration number`
  String get assetPageOtherOtherRegNum {
    return Intl.message(
      'Registration number',
      name: 'assetPageOtherOtherRegNum',
      desc: '',
      args: [],
    );
  }

  /// `Prev`
  String get assetPagePrevButton {
    return Intl.message(
      'Prev',
      name: 'assetPagePrevButton',
      desc: '',
      args: [],
    );
  }

  /// `Property`
  String get assetPageProperty {
    return Intl.message(
      'Property',
      name: 'assetPageProperty',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get assetPagePropertyAddress {
    return Intl.message(
      'Address',
      name: 'assetPagePropertyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Apartment land register no.`
  String get assetPagePropertyApartmentLand {
    return Intl.message(
      'Apartment land register no.',
      name: 'assetPagePropertyApartmentLand',
      desc: '',
      args: [],
    );
  }

  /// `District Court`
  String get assetPagePropertyDistrictCourt {
    return Intl.message(
      'District Court',
      name: 'assetPagePropertyDistrictCourt',
      desc: '',
      args: [],
    );
  }

  /// `Division land register no.`
  String get assetPagePropertyDivisionLand {
    return Intl.message(
      'Division land register no.',
      name: 'assetPagePropertyDivisionLand',
      desc: '',
      args: [],
    );
  }

  /// `Your assets`
  String get assetPageTitle {
    return Intl.message(
      'Your assets',
      name: 'assetPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get assetPageTypeDropDownField {
    return Intl.message(
      'Type',
      name: 'assetPageTypeDropDownField',
      desc: '',
      args: [],
    );
  }

  /// `Add Authorized person`
  String get authorityPageAddPersonButton {
    return Intl.message(
      'Add Authorized person',
      name: 'authorityPageAddPersonButton',
      desc: '',
      args: [],
    );
  }

  /// `Address cannot be empty`
  String get authorityPageAddressError {
    return Intl.message(
      'Address cannot be empty',
      name: 'authorityPageAddressError',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get authorityPageAddressLabel {
    return Intl.message(
      'Address',
      name: 'authorityPageAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `E-mail cannot be empty`
  String get authorityPageEmailError {
    return Intl.message(
      'E-mail cannot be empty',
      name: 'authorityPageEmailError',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get authorityPageEmailLabel {
    return Intl.message(
      'E-mail',
      name: 'authorityPageEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get authorityPageFullnameError {
    return Intl.message(
      'Name cannot be empty',
      name: 'authorityPageFullnameError',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get authorityPageFullnameLabel {
    return Intl.message(
      'Full name',
      name: 'authorityPageFullnameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Authorized Person {count}`
  String authorityPageHeading(Object count) {
    return Intl.message(
      'Authorized Person $count',
      name: 'authorityPageHeading',
      desc: '',
      args: [count],
    );
  }

  /// `Mobile number cannot be empty`
  String get authorityPageMobileError {
    return Intl.message(
      'Mobile number cannot be empty',
      name: 'authorityPageMobileError',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get authorityPageMobileLabel {
    return Intl.message(
      'Mobile number',
      name: 'authorityPageMobileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cannot be empty`
  String get authorityPageRelationshipError {
    return Intl.message(
      'Cannot be empty',
      name: 'authorityPageRelationshipError',
      desc: '',
      args: [],
    );
  }

  /// `Relationship degree`
  String get authorityPageRelationshipLabel {
    return Intl.message(
      'Relationship degree',
      name: 'authorityPageRelationshipLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add Authority`
  String get authorityPageTitle {
    return Intl.message(
      'Add Authority',
      name: 'authorityPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get debtsPageAddress {
    return Intl.message(
      'Address',
      name: 'debtsPageAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address cannot be empty`
  String get debtsPageAddressError {
    return Intl.message(
      'Address cannot be empty',
      name: 'debtsPageAddressError',
      desc: '',
      args: [],
    );
  }

  /// `Debt ID`
  String get debtsPageDebt {
    return Intl.message(
      'Debt ID',
      name: 'debtsPageDebt',
      desc: '',
      args: [],
    );
  }

  /// `I owe to`
  String get debtsPageDesc {
    return Intl.message(
      'I owe to',
      name: 'debtsPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get debtsPageName {
    return Intl.message(
      'Name',
      name: 'debtsPageName',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get debtsPageNameError {
    return Intl.message(
      'Name cannot be empty',
      name: 'debtsPageNameError',
      desc: '',
      args: [],
    );
  }

  /// `New Debt`
  String get debtsPageNewDebt {
    return Intl.message(
      'New Debt',
      name: 'debtsPageNewDebt',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get debtsPagePhone {
    return Intl.message(
      'Phone',
      name: 'debtsPagePhone',
      desc: '',
      args: [],
    );
  }

  /// `Phone cannot be empty`
  String get debtsPagePhoneError {
    return Intl.message(
      'Phone cannot be empty',
      name: 'debtsPagePhoneError',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get debtsPageSaveButton {
    return Intl.message(
      'Save',
      name: 'debtsPageSaveButton',
      desc: '',
      args: [],
    );
  }

  /// `Add Debts`
  String get debtsPageTitle {
    return Intl.message(
      'Add Debts',
      name: 'debtsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Value (in €)`
  String get debtsPageValue {
    return Intl.message(
      'Value (in €)',
      name: 'debtsPageValue',
      desc: '',
      args: [],
    );
  }

  /// `Value cannot be empty`
  String get debtsPageValueError {
    return Intl.message(
      'Value cannot be empty',
      name: 'debtsPageValueError',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get loginPageEmailErrorEmpty {
    return Intl.message(
      'Email cannot be empty',
      name: 'loginPageEmailErrorEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get loginPageEmailErrorInvalid {
    return Intl.message(
      'Invalid email',
      name: 'loginPageEmailErrorInvalid',
      desc: '',
      args: [],
    );
  }

  /// `abc@example.com`
  String get loginPageEmailHint {
    return Intl.message(
      'abc@example.com',
      name: 'loginPageEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get loginPageEmailLabel {
    return Intl.message(
      'Enter email',
      name: 'loginPageEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get loginPageForgotPwd {
    return Intl.message(
      'Forgot Password?',
      name: 'loginPageForgotPwd',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginPageLoginButton {
    return Intl.message(
      'Login',
      name: 'loginPageLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get loginPagePasswordErrorEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'loginPagePasswordErrorEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password`
  String get loginPagePasswordErrorWeak {
    return Intl.message(
      'Weak Password',
      name: 'loginPagePasswordErrorWeak',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPagePasswordHint {
    return Intl.message(
      'Password',
      name: 'loginPagePasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get loginPagePasswordLabel {
    return Intl.message(
      'Enter password',
      name: 'loginPagePasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get loginPageRegisterButton {
    return Intl.message(
      'Register',
      name: 'loginPageRegisterButton',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get loginPageRememberMe {
    return Intl.message(
      'Remember me',
      name: 'loginPageRememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginPageTitle {
    return Intl.message(
      'Login',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Address cannot be empty`
  String get personalInfoPageAddressError {
    return Intl.message(
      'Address cannot be empty',
      name: 'personalInfoPageAddressError',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get personalInfoPageAddressLabel {
    return Intl.message(
      'Address',
      name: 'personalInfoPageAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `Alternate address cannot be empty`
  String get personalInfoPageAltAddressError {
    return Intl.message(
      'Alternate address cannot be empty',
      name: 'personalInfoPageAltAddressError',
      desc: '',
      args: [],
    );
  }

  /// `Alternate address`
  String get personalInfoPageAltAddressLabel {
    return Intl.message(
      'Alternate address',
      name: 'personalInfoPageAltAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date of birth`
  String get personalInfoPageDateOfBirthError {
    return Intl.message(
      'Invalid date of birth',
      name: 'personalInfoPageDateOfBirthError',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get personalInfoPageDateOfBirthLabel {
    return Intl.message(
      'Date of Birth',
      name: 'personalInfoPageDateOfBirthLabel',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get personalInfoPageEmailError {
    return Intl.message(
      'Invalid email',
      name: 'personalInfoPageEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get personalInfoPageEmailLabel {
    return Intl.message(
      'Email address',
      name: 'personalInfoPageEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `First name cannot be empty`
  String get personalInfoPageFirstNameError {
    return Intl.message(
      'First name cannot be empty',
      name: 'personalInfoPageFirstNameError',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get personalInfoPageFirstNameLabel {
    return Intl.message(
      'First name',
      name: 'personalInfoPageFirstNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Last name cannot be empty`
  String get personalInfoPageLastNameError {
    return Intl.message(
      'Last name cannot be empty',
      name: 'personalInfoPageLastNameError',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get personalInfoPageLastNameLabel {
    return Intl.message(
      'Last name',
      name: 'personalInfoPageLastNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Nationality cannot be empty`
  String get personalInfoPageNationalityError {
    return Intl.message(
      'Nationality cannot be empty',
      name: 'personalInfoPageNationalityError',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get personalInfoPageNationalityLabel {
    return Intl.message(
      'Nationality',
      name: 'personalInfoPageNationalityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get personalInfoPageNextButton {
    return Intl.message(
      'Next',
      name: 'personalInfoPageNextButton',
      desc: '',
      args: [],
    );
  }

  /// `Invalid telephone number`
  String get personalInfoPageTelephoneError {
    return Intl.message(
      'Invalid telephone number',
      name: 'personalInfoPageTelephoneError',
      desc: '',
      args: [],
    );
  }

  /// `Telephone number`
  String get personalInfoPageTelephoneLabel {
    return Intl.message(
      'Telephone number',
      name: 'personalInfoPageTelephoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add Personal Info`
  String get personalInfoPageTitle {
    return Intl.message(
      'Add Personal Info',
      name: 'personalInfoPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get registrationPageEmailError {
    return Intl.message(
      'Invalid Email',
      name: 'registrationPageEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get registrationPageEmailLabel {
    return Intl.message(
      'Email',
      name: 'registrationPageEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get registrationPageNameError {
    return Intl.message(
      'Name cannot be empty',
      name: 'registrationPageNameError',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get registrationPageNameLabel {
    return Intl.message(
      'Full name',
      name: 'registrationPageNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password mismatch`
  String get registrationPagePasswordConfirmError {
    return Intl.message(
      'Password mismatch',
      name: 'registrationPagePasswordConfirmError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get registrationPagePasswordConfirmLabel {
    return Intl.message(
      'Confirm Password',
      name: 'registrationPagePasswordConfirmLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get registrationPagePasswordError {
    return Intl.message(
      'Password cannot be empty',
      name: 'registrationPagePasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get registrationPagePasswordLabel {
    return Intl.message(
      'Password',
      name: 'registrationPagePasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone`
  String get registrationPagePhoneError {
    return Intl.message(
      'Invalid Phone',
      name: 'registrationPagePhoneError',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get registrationPagePhoneLabel {
    return Intl.message(
      'Phone',
      name: 'registrationPagePhoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registrationPageRegisterButton {
    return Intl.message(
      'Register',
      name: 'registrationPageRegisterButton',
      desc: '',
      args: [],
    );
  }

  /// `{roleDropDown, select, owner {Owner} guardian {Guardian}}`
  String registrationPageRoleDropdown(Object roleDropDown) {
    return Intl.select(
      roleDropDown,
      {
        'owner': 'Owner',
        'guardian': 'Guardian',
      },
      name: 'registrationPageRoleDropdown',
      desc: '',
      args: [roleDropDown],
    );
  }

  /// `Please select a role`
  String get registrationPageRoleError {
    return Intl.message(
      'Please select a role',
      name: 'registrationPageRoleError',
      desc: '',
      args: [],
    );
  }

  /// `Already registered? Login`
  String get registrationPageSigninButton {
    return Intl.message(
      'Already registered? Login',
      name: 'registrationPageSigninButton',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registrationPageTitle {
    return Intl.message(
      'Registration',
      name: 'registrationPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get registrationPageType {
    return Intl.message(
      'Role',
      name: 'registrationPageType',
      desc: '',
      args: [],
    );
  }

  /// `Appointment`
  String get reminderPageAppointment {
    return Intl.message(
      'Appointment',
      name: 'reminderPageAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Add appointment`
  String get reminderPageAppointmentAdd {
    return Intl.message(
      'Add appointment',
      name: 'reminderPageAppointmentAdd',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get reminderPageAppointmentDate {
    return Intl.message(
      'Date',
      name: 'reminderPageAppointmentDate',
      desc: '',
      args: [],
    );
  }

  /// `Appointment name`
  String get reminderPageAppointmentName {
    return Intl.message(
      'Appointment name',
      name: 'reminderPageAppointmentName',
      desc: '',
      args: [],
    );
  }

  /// `Appointment name cannot be empty`
  String get reminderPageAppointmentNameError {
    return Intl.message(
      'Appointment name cannot be empty',
      name: 'reminderPageAppointmentNameError',
      desc: '',
      args: [],
    );
  }

  /// `Save appointment`
  String get reminderPageAppointmentSave {
    return Intl.message(
      'Save appointment',
      name: 'reminderPageAppointmentSave',
      desc: '',
      args: [],
    );
  }

  /// `Created at`
  String get reminderPageCreatedAt {
    return Intl.message(
      'Created at',
      name: 'reminderPageCreatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get reminderPageDelete {
    return Intl.message(
      'Delete',
      name: 'reminderPageDelete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get reminderPageEdit {
    return Intl.message(
      'Edit',
      name: 'reminderPageEdit',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get reminderPageMedicine {
    return Intl.message(
      'Medicine',
      name: 'reminderPageMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Add medicine`
  String get reminderPageMedicineAdd {
    return Intl.message(
      'Add medicine',
      name: 'reminderPageMedicineAdd',
      desc: '',
      args: [],
    );
  }

  /// `Medicine name`
  String get reminderPageMedicineName {
    return Intl.message(
      'Medicine name',
      name: 'reminderPageMedicineName',
      desc: '',
      args: [],
    );
  }

  /// `Medicine name cannot be empty`
  String get reminderPageMedicineNameError {
    return Intl.message(
      'Medicine name cannot be empty',
      name: 'reminderPageMedicineNameError',
      desc: '',
      args: [],
    );
  }

  /// `Repetition on`
  String get reminderPageMedicineRepetition {
    return Intl.message(
      'Repetition on',
      name: 'reminderPageMedicineRepetition',
      desc: '',
      args: [],
    );
  }

  /// `Days must be from mon, tue, fri etc`
  String get reminderPageMedicineRepetitionDaysError {
    return Intl.message(
      'Days must be from mon, tue, fri etc',
      name: 'reminderPageMedicineRepetitionDaysError',
      desc: '',
      args: [],
    );
  }

  /// `Dates must be from 1-31`
  String get reminderPageMedicineRepetitionDatesError {
    return Intl.message(
      'Dates must be from 1-31',
      name: 'reminderPageMedicineRepetitionDatesError',
      desc: '',
      args: [],
    );
  }

  /// `Time must be from 00:00-23:59`
  String get reminderPageMedicineRepetitionTimesError {
    return Intl.message(
      'Time must be from 00:00-23:59',
      name: 'reminderPageMedicineRepetitionTimesError',
      desc: '',
      args: [],
    );
  }

  /// `Repetition values invalid`
  String get reminderPageMedicineRepetitionError {
    return Intl.message(
      'Repetition values invalid',
      name: 'reminderPageMedicineRepetitionError',
      desc: '',
      args: [],
    );
  }

  /// `No. of Repetition`
  String get reminderPageMedicineRepetitionCount {
    return Intl.message(
      'No. of Repetition',
      name: 'reminderPageMedicineRepetitionCount',
      desc: '',
      args: [],
    );
  }

  /// `Repetition must be > 0`
  String get reminderPageMedicineRepetitionCountError {
    return Intl.message(
      'Repetition must be > 0',
      name: 'reminderPageMedicineRepetitionCountError',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get reminderPageMedicineRepetitionType {
    return Intl.message(
      'Repeat',
      name: 'reminderPageMedicineRepetitionType',
      desc: '',
      args: [],
    );
  }

  /// `{medicineRepetitionValue, select, daily {Daily} weekly {Weekly} monthly {Monthly}}`
  String reminderPageMedicineRepetitionTypeValue(
      Object medicineRepetitionValue) {
    return Intl.select(
      medicineRepetitionValue,
      {
        'daily': 'Daily',
        'weekly': 'Weekly',
        'monthly': 'Monthly',
      },
      name: 'reminderPageMedicineRepetitionTypeValue',
      desc: '',
      args: [medicineRepetitionValue],
    );
  }

  /// `Save medicine`
  String get reminderPageMedicineSave {
    return Intl.message(
      'Save medicine',
      name: 'reminderPageMedicineSave',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get reminderPageTitle {
    return Intl.message(
      'Reminders',
      name: 'reminderPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Alarm Interval`
  String get settingsPageAlarmInterval {
    return Intl.message(
      'Alarm Interval',
      name: 'settingsPageAlarmInterval',
      desc: '',
      args: [],
    );
  }

  /// `{alarmIntervalDropDown, select, every_9_hours {Every 9 hours} every_12_hours {Every 12 hours} every_24_hours {Every 24 hours}}`
  String settingsPageAlarmIntervalDropDown(Object alarmIntervalDropDown) {
    return Intl.select(
      alarmIntervalDropDown,
      {
        'every_9_hours': 'Every 9 hours',
        'every_12_hours': 'Every 12 hours',
        'every_24_hours': 'Every 24 hours',
      },
      name: 'settingsPageAlarmIntervalDropDown',
      desc: '',
      args: [alarmIntervalDropDown],
    );
  }

  /// `Alarm Message`
  String get settingsPageAlarmMessage {
    return Intl.message(
      'Alarm Message',
      name: 'settingsPageAlarmMessage',
      desc: '',
      args: [],
    );
  }

  /// `{alarmMessageDropDown, select, are_you_ok {Are you ok?} hope_you_are_fine {Hope you are fine} stay_healthy {Stay Healthy!} want_to_check_on_you {Want to check on you} other {Other}}`
  String settingsPageAlarmMessageDropDown(Object alarmMessageDropDown) {
    return Intl.select(
      alarmMessageDropDown,
      {
        'are_you_ok': 'Are you ok?',
        'hope_you_are_fine': 'Hope you are fine',
        'stay_healthy': 'Stay Healthy!',
        'want_to_check_on_you': 'Want to check on you',
        'other': 'Other',
      },
      name: 'settingsPageAlarmMessageDropDown',
      desc: '',
      args: [alarmMessageDropDown],
    );
  }

  /// `Change Password`
  String get settingsPageChangePwd {
    return Intl.message(
      'Change Password',
      name: 'settingsPageChangePwd',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get settingsPageChangePwdButton {
    return Intl.message(
      'Change Password',
      name: 'settingsPageChangePwdButton',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get settingsPageChangePwdEmptyError {
    return Intl.message(
      'Password cannot be empty',
      name: 'settingsPageChangePwdEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get settingsPageChangePwdMismatchError {
    return Intl.message(
      'Passwords do not match',
      name: 'settingsPageChangePwdMismatchError',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get settingsPageChangePwdNewPwd {
    return Intl.message(
      'New Password',
      name: 'settingsPageChangePwdNewPwd',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get settingsPageChangePwdNewPwdCnf {
    return Intl.message(
      'Confirm New Password',
      name: 'settingsPageChangePwdNewPwdCnf',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get settingsPageChangePwdOldPwd {
    return Intl.message(
      'Old Password',
      name: 'settingsPageChangePwdOldPwd',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak`
  String get settingsPageChangePwdWeakError {
    return Intl.message(
      'Password is too weak',
      name: 'settingsPageChangePwdWeakError',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsPageLanguage {
    return Intl.message(
      'Language',
      name: 'settingsPageLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsPageTitle {
    return Intl.message(
      'Settings',
      name: 'settingsPageTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<S> load(Locale locale) => S.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
