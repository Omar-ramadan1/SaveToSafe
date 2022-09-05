import 'package:flutter/material.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/widgets/custom_text_form_widget.dart';

class AddAuthorityPerson extends StatefulWidget {
  const AddAuthorityPerson({Key? key}) : super(key: key);
  static const String route = 'add_authority';

  @override
  _AddAuthorityPersonState createState() => _AddAuthorityPersonState();
}

class _AddAuthorityPersonState extends State<AddAuthorityPerson> {
  List<AuthorityPersonControllers> authorityPersonControllers = [];

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    authorityPersonControllers.add(AuthorityPersonControllers());
    authorityPersonControllers.add(AuthorityPersonControllers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).authorityPageTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _key,
            child: Column(children: [
              ...authorityPersonControllers
                  .asMap()
                  .entries
                  .map((entry) =>
                      authorityPersonRepeatable(entry.key, entry.value))
                  .toList(),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Text(S.of(context).authorityPageAddPersonButton),
                  onPressed: () {
                    print('Add authorized person!');
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget authorityPersonRepeatable(
      int index, AuthorityPersonControllers controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              S.of(context).authorityPageHeading(index + 1),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        CustomTextFormWidget(
          textController: controller.fullNameController,
          labelText: S.of(context).authorityPageFullnameLabel,
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).authorityPageFullnameError;
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.relationshipController,
          labelText: S.of(context).authorityPageRelationshipLabel,
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).authorityPageRelationshipError;
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.mobileNoController,
          labelText: S.of(context).authorityPageMobileLabel,
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).authorityPageMobileError;
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.emailController,
          labelText: S.of(context).authorityPageEmailLabel,
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).authorityPageEmailError;
            }
          },
        ),
        CustomTextFormWidget(
          textController: controller.addressController,
          labelText: S.of(context).authorityPageAddressLabel,
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return S.of(context).authorityPageAddressError;
            }
          },
        ),
      ],
    );
  }
}

class AuthorityPersonControllers {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
}
