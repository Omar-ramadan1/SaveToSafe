import 'package:flutter/material.dart';
import 'package:savetosafe/core/model/debt.dart';
import 'package:savetosafe/core/service/debt_api_service.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/widgets/custom_text_form_widget.dart';

class AddDebtsPage extends StatefulWidget {
  const AddDebtsPage({Key? key}) : super(key: key);

  static const String route = 'add_debts';

  @override
  _AddDebtsPageState createState() => _AddDebtsPageState();
}

class _AddDebtsPageState extends State<AddDebtsPage> {
  List<DebtControllers> debtControllers = [];
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await DebtAPIService(context).get().then((allDebts) {
      allDebts.forEach((debt) {
        debtControllers.insertAll(0, [DebtControllers.fromDebt(debt)]);
      });
      if (allDebts.isEmpty) {
        debtControllers = [DebtControllers()];
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).debtsPageTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: S.of(context).assetPageAddNewButton,
            onPressed: () {
              setState(() {
                debtControllers.insertAll(0, [DebtControllers()]);
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 12, bottom: 0, left: 12, right: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).debtsPageDesc,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      ...debtControllers
                          .asMap()
                          .entries
                          .map((MapEntry e) =>
                              debtRepeatable(controller: e.value, index: e.key))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget debtRepeatable({
    required DebtControllers controller,
    required int index,
  }) {
    bool isNewEntry = controller.debtId == null;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isNewEntry
                ? Text(S.of(context).debtsPageNewDebt)
                : Text(S.of(context).debtsPageDebt + " ${controller.debtId}"),
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  icon: Icon(controller.isEditable ? Icons.check : Icons.edit),
                  onPressed: () async {
                    if (!controller.isEditable) {
                      setState(() {
                        controller.isEditable = !controller.isEditable;
                      });
                    } else if (_key.currentState!.validate()) {
                      if (isNewEntry) {
                        controller.debt = await DebtAPIService(context)
                            .create(controller.debt);
                      } else if (!isNewEntry) {
                        controller.debt = await DebtAPIService(context)
                            .update(controller.debt);
                      }
                      setState(() {
                        controller.isEditable = !controller.isEditable;
                      });
                    }
                  },
                ),
                IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    if (isNewEntry) {
                      setState(() {
                        debtControllers.removeAt(index);
                      });
                    } else {
                      bool wasSuccess = await DebtAPIService(context)
                          .delete(controller.debtId!);
                      if (wasSuccess) {
                        setState(() {
                          debtControllers.removeAt(index);
                        });
                      }
                    }
                    if (debtControllers.isEmpty) {
                      debtControllers.insertAll(0, [DebtControllers()]);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        CustomTextFormWidget(
          textController: controller.nameController,
          textInputType: TextInputType.name,
          labelText: S.of(context).debtsPageName,
          isEnabled: controller.isEditable,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).debtsPageNameError;
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.addressController,
          textInputType: TextInputType.streetAddress,
          labelText: S.of(context).debtsPageAddress,
          isEnabled: controller.isEditable,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).debtsPageAddressError;
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.phoneController,
          textInputType: TextInputType.phone,
          labelText: S.of(context).debtsPagePhone,
          isEnabled: controller.isEditable,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).debtsPagePhoneError;
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.valueController,
          textInputType: TextInputType.number,
          labelText: S.of(context).debtsPageValue,
          isEnabled: controller.isEditable,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).debtsPageValueError;
            }
          },
        ),
      ],
    );
  }
}

class DebtControllers {
  bool isEditable = false;
  int? debtId;
  DateTime? createdAt;
  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneController;
  late final TextEditingController valueController;

  DebtControllers.fromDebt(Debt debt) {
    this.debtId = debt.id;
    this.createdAt = debt.createdAt;
    this.nameController = TextEditingController(text: debt.name);
    this.addressController = TextEditingController(text: debt.address);
    this.phoneController = TextEditingController(text: debt.phone);
    this.valueController = TextEditingController(text: debt.amount.toString());
    this.isEditable = false;
  }

  DebtControllers() {
    this.nameController = TextEditingController();
    this.addressController = TextEditingController();
    this.phoneController = TextEditingController();
    this.valueController = TextEditingController();
    this.isEditable = true;
  }

  Debt get debt => Debt(
        id: debtId,
        name: nameController.text,
        phone: phoneController.text,
        address: addressController.text,
        amount: double.parse(
            valueController.text == '' ? "0" : valueController.text),
        createdAt: createdAt,
      );

  set debt(Debt debt) {
    this.debtId = debt.id;
    this.createdAt = debt.createdAt;
    this.nameController.text = debt.name;
    this.addressController.text = debt.address;
    this.phoneController.text = debt.phone;
    this.valueController.text = debt.amount.toString();
  }
}
