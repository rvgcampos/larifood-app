import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class PrepareModeComponent extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValidationBuilder? validationBuilder;
  final bool autofocus;
  final bool obscureText;
  final Widget? icon;

  const PrepareModeComponent({
    super.key,
    required this.hintText,
    required this.controller,
    this.validationBuilder,
    this.autofocus = false,
    this.obscureText = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: TextFormField(
          controller: controller,
          autofocus: autofocus,
          obscureText: obscureText,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.grey[300],
            errorStyle: const TextStyle(),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            suffixIcon: icon,
          ),
          validator:
              validationBuilder != null ? validationBuilder!.build() : null,
        ),
      ),
    );
  }
}
