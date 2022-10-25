import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class InputFieldAdd extends StatelessWidget {
  final String hintText;
  String initialValue;
  final ValidationBuilder? validationBuilder;
  final bool autofocus;
  final bool obscureText;
  final Widget? icon;
  final Function(String)? onChanged;

  InputFieldAdd({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.initialValue,
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
          onChanged: onChanged,
          initialValue: initialValue,
          autofocus: autofocus,
          obscureText: obscureText,
          style: const TextStyle(fontSize: 16),
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
