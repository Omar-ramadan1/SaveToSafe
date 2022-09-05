import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  CustomTextFormWidget({
    Key? key,
    required this.textController,
    required this.labelText,
    this.textInputType,
    this.validator,
    this.obscureText = false,
    this.hintText,
    this.icon,
    this.isEnabled = true,
  }) : super(key: key);

  final TextEditingController textController;
  final TextInputType? textInputType;
  final String labelText;
  final String? hintText;
  final Icon? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: textController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: isEnabled,
        validator: validator,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          icon: icon,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(4),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
