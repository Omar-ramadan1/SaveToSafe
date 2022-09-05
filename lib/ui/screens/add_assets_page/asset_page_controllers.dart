import 'package:flutter/widgets.dart';
import 'package:savetosafe/core/utils/constants.dart';

class AssetMobilityControllers {
  String? dropDownMobility = Constants.assetsMobilityTypes[0];
  final TextEditingController markController = TextEditingController();
  final TextEditingController regNumController = TextEditingController();
}

class AssetPropertyControllers {
  String? dropDownProperty = Constants.assetsPropertyTypes[0];
  final TextEditingController divisionLandController = TextEditingController();
  final TextEditingController apartmentLandController = TextEditingController();
  final TextEditingController districtCourtController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
}

class AssetBankControllers {
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accNumController = TextEditingController();
  final TextEditingController accOwnerController = TextEditingController();
}

class AssetInsuranceControllers {
  String? dropDownInsurance = Constants.assetsInsuranceTypes[0];
  final TextEditingController insuranceAgencyController =
      TextEditingController();
  final TextEditingController insuranceNumController = TextEditingController();
}

class AssetOtherControllers {
  String? dropDownOthers = Constants.assetsOthersTypes[0];
  final TextEditingController otherRegNumController = TextEditingController();
  final TextEditingController businessLicenseController =
      TextEditingController();
  final TextEditingController districtOfficeController =
      TextEditingController();
  final TextEditingController itemAddressController = TextEditingController();
}
