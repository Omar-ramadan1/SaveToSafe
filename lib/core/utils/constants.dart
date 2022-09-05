class Constants {
  Constants._();

  static const accessToken = "access_token";
  static const locale = "locale";

  static const double padding = 20;
  static const double avatarRadius = 45;

  static final List<String> languages = ['English', 'Deutsch'];
  static final List<String> roles = ['owner', 'guardian'];
  static final List<String> assetsMobilityTypes = [
    'Auto',
    'Mobile/Wohnwagen',
    'Motorrad',
    'Arbeitsmaschine',
    'Yacht'
  ];

  static final List<String> assetsPropertyTypes = [
    'Apartment with garage',
    'Apartment without garage',
    'House',
    'Hotel',
  ];

  static final List<String> assetsInsuranceTypes = [
    'Life insurance',
    'Car insurance',
    'Private liability insurance',
    'Disability insurance',
    'Work Disability insurance',
    'Child disability insurance',
    'Legal protection insurance and / or work legal protection',
    'Animal liability insurance',
    'Death benefit insurance',
    'Others',
  ];

  static final List<String> assetsOthersTypes = [
    'farm',
    'Property',
    'Store/shop',
    'Company/Start-up',
    'Garden',
    'others',
  ];

  static final List<String> alarmIntervals = [
    'every_9_hours',
    'every_12_hours',
    'every_24_hours',
  ];

  static final List<String> alarmMessage = [
    'are_you_ok',
    'hope_you_are_fine',
    'stay_healthy',
    'want_to_check_on_you',
  ];
}
