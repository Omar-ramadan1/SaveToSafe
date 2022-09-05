import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:savetosafe/core/utils/constants.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/screens/add_assets_page/asset_page_controllers.dart';
import 'package:savetosafe/ui/widgets/custom_text_form_widget.dart';
import 'package:savetosafe/widgets/drawer.dart';

class AddAssetsPage extends StatefulWidget {
  static const String route = '/add_assets';

  @override
  _AddAssetsPageState createState() => _AddAssetsPageState();
}

class _AddAssetsPageState extends State<AddAssetsPage> {
  final pageViewController = PageController();

  List<AssetMobilityControllers> _assetmobilityControllers = [];
  List<AssetPropertyControllers> _assetpropertyControllers = [];
  List<AssetBankControllers> _assetbankControllers = [];
  List<AssetInsuranceControllers> _assetinsuranceControllers = [];
  List<AssetOtherControllers> _assetotherControllers = [];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _mobilityKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _propertyKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _bankKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _insuranceKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _otherKey = GlobalKey<FormState>();

  int _currentPage = 0;

  int mobilityCount = 1;
  int propertyCount = 1;
  int bankCount = 1;
  int insuranceCount = 1;
  int otherCount = 1;

  @override
  void initState() {
    super.initState();

    _assetmobilityControllers = [AssetMobilityControllers()];
    _assetpropertyControllers = [AssetPropertyControllers()];
    _assetbankControllers = [AssetBankControllers()];
    _assetinsuranceControllers = [AssetInsuranceControllers()];
    _assetotherControllers = [AssetOtherControllers()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(S.of(context).assetPageTitle),
      ),
      drawer: NavigationDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: pageViewController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int position) {
                setState(() {
                  _currentPage = position;
                });
              },
              children: [
                mobilityWidget(_assetmobilityControllers),
                propertyWidget(_assetpropertyControllers),
                bankWidget(_assetbankControllers),
                insuranceWidget(_assetinsuranceControllers),
                othersWidget(_assetotherControllers),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text(S.of(context).assetPagePrevButton),
                  onPressed: () {
                    if (_currentPage > 0) {
                      pageViewController.animateToPage(_currentPage - 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    } else if (_currentPage > 3)
                      print("Should have navigated here to");
                  },
                ),
                ElevatedButton(
                  child: Text(S.of(context).assetPageNextButton),
                  onPressed: () {
                    if (_currentPage <= 3) {
                      pageViewController.animateToPage(_currentPage + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    } else if (_currentPage > 3)
                      print("Should have navigated here to");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mobilityWidget(List<AssetMobilityControllers> controllers) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _mobilityKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).assetPageMobility,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ...controllers
                  .map((AssetMobilityControllers c) =>
                      mobilityWidgetRepeatable(c))
                  .toList(),
              TextButton(
                child: Text(S.of(context).assetPageAddNewButton),
                onPressed: () {
                  setState(() {
                    _assetmobilityControllers.add(AssetMobilityControllers());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mobilityWidgetRepeatable(AssetMobilityControllers controller) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              S.of(context).assetPageTypeDropDownField,
            ),
            SizedBox(width: 8),
            DropdownButton<String>(
              value: controller.dropDownMobility,
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                log('Changed!');
                setState(() {
                  controller.dropDownMobility = newValue;
                });
              },
              items: Constants.assetsMobilityTypes
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        CustomTextFormWidget(
          textController: controller.markController,
          labelText: S.of(context).assetPageMobilityMark,
        ),
        CustomTextFormWidget(
          textController: controller.regNumController,
          validator: (String? value) {
            if (controller.markController.text.isNotEmpty &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
          labelText: S.of(context).assetPageMobilityRegNum,
        ),
      ],
    );
  }

  Widget propertyWidget(List<AssetPropertyControllers> controllers) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _propertyKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).assetPageProperty,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ...controllers
                  .map((AssetPropertyControllers c) =>
                      propertyWidgetRepeatable(c))
                  .toList(),
              TextButton(
                child: Text(S.of(context).assetPageAddNewButton),
                onPressed: () {
                  setState(() {
                    _assetpropertyControllers.add(AssetPropertyControllers());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget propertyWidgetRepeatable(AssetPropertyControllers controller) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              S.of(context).assetPageTypeDropDownField,
            ),
            SizedBox(width: 8),
            DropdownButton<String>(
              value: controller.dropDownProperty,
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                log('Changed!');
                setState(() {
                  controller.dropDownProperty = newValue;
                });
              },
              items: Constants.assetsPropertyTypes
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        CustomTextFormWidget(
          textController: controller.divisionLandController,
          labelText: S.of(context).assetPagePropertyDivisionLand,
          validator: (String? value) {
            if ((controller.apartmentLandController.text.isNotEmpty ||
                    controller.districtCourtController.text.isNotEmpty ||
                    controller.addressController.text.isNotEmpty) &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.apartmentLandController,
          labelText: S.of(context).assetPagePropertyApartmentLand,
          validator: (String? value) {
            if ((controller.divisionLandController.text.isNotEmpty ||
                    controller.districtCourtController.text.isNotEmpty ||
                    controller.addressController.text.isNotEmpty) &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.districtCourtController,
          labelText: S.of(context).assetPagePropertyDistrictCourt,
        ),
        CustomTextFormWidget(
          textController: controller.addressController,
          labelText: S.of(context).assetPagePropertyAddress,
        ),
      ],
    );
  }

  Widget bankWidget(List<AssetBankControllers> controllers) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _bankKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).assetPageBank,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ...controllers
                  .map((AssetBankControllers c) => bankWidgetRepeatable(c))
                  .toList(),
              TextButton(
                child: Text(S.of(context).assetPageAddNewButton),
                onPressed: () {
                  setState(() {
                    _assetbankControllers.add(AssetBankControllers());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bankWidgetRepeatable(AssetBankControllers controller) {
    return Column(
      children: [
        CustomTextFormWidget(
          textController: controller.bankNameController,
          labelText: S.of(context).assetPageBankName,
          validator: (String? value) {
            if ((controller.accNumController.text.isNotEmpty ||
                    controller.accOwnerController.text.isEmpty) &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.accNumController,
          labelText: S.of(context).assetPageBankAccNumber,
          validator: (String? value) {
            if ((controller.bankNameController.text.isNotEmpty ||
                    controller.accOwnerController.text.isEmpty) &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.accOwnerController,
          labelText: S.of(context).assetPageBankAccOwner,
          validator: (String? value) {
            if ((controller.bankNameController.text.isNotEmpty ||
                    controller.accNumController.text.isEmpty) &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
        ),
      ],
    );
  }

  Widget insuranceWidget(List<AssetInsuranceControllers> controllers) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _insuranceKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).assetPageInsurance,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ...controllers
                  .map((AssetInsuranceControllers c) =>
                      insuranceWidgetRepeatable(c))
                  .toList(),
              TextButton(
                child: Text(S.of(context).assetPageAddNewButton),
                onPressed: () {
                  setState(() {
                    _assetinsuranceControllers.add(AssetInsuranceControllers());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget insuranceWidgetRepeatable(AssetInsuranceControllers controller) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              S.of(context).assetPageTypeDropDownField,
            ),
            SizedBox(width: 8),
            Expanded(
              child: DropdownButton<String>(
                isExpanded: true,
                value: controller.dropDownInsurance,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  log('Changed!');
                  setState(() {
                    controller.dropDownInsurance = newValue;
                  });
                },
                items: Constants.assetsInsuranceTypes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        CustomTextFormWidget(
          textController: controller.insuranceAgencyController,
          labelText: S.of(context).assetPageInsuranceAgency,
          validator: (String? value) {
            if (controller.insuranceNumController.text.isNotEmpty &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.insuranceNumController,
          labelText: S.of(context).assetPageInsuranceNumber,
          validator: (String? value) {
            if (controller.insuranceAgencyController.text.isNotEmpty &&
                (value?.isEmpty ?? true)) {
              return "error";
            }
          },
        ),
      ],
    );
  }

  Widget othersWidget(List<AssetOtherControllers> controllers) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _otherKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).assetPageOther,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ...controllers
                  .map((AssetOtherControllers c) => othersWidgetRepeatable(c))
                  .toList(),
              TextButton(
                child: Text(S.of(context).assetPageAddNewButton),
                onPressed: () {
                  setState(() {
                    _assetotherControllers.add(AssetOtherControllers());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget othersWidgetRepeatable(AssetOtherControllers controllers) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              S.of(context).assetPageTypeDropDownField,
            ),
            SizedBox(width: 8),
            DropdownButton<String>(
              value: controllers.dropDownOthers,
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                log('Changed!');
                setState(() {
                  controllers.dropDownOthers = newValue;
                });
              },
              items: Constants.assetsOthersTypes
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        CustomTextFormWidget(
          textController: controllers.otherRegNumController,
          labelText: S.of(context).assetPageOtherOtherRegNum,
        ),
        CustomTextFormWidget(
          textController: controllers.businessLicenseController,
          labelText: S.of(context).assetPageOtherBusinessLicense,
        ),
        CustomTextFormWidget(
          textController: controllers.districtOfficeController,
          labelText: S.of(context).assetPageOtherDistrictOffice,
        ),
        CustomTextFormWidget(
          textController: controllers.itemAddressController,
          labelText: S.of(context).assetPageOtherItemAddress,
        ),
      ],
    );
  }
}
