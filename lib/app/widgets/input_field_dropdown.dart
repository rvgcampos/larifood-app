import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class InputFieldDropdown extends StatelessWidget {
  final ValidationBuilder? validationBuilder;
  Rxn<String>? value;
  List<String> values;
  bool hasBorder;
  String hintText;

  InputFieldDropdown({
    super.key,
    required this.values,
    required this.hintText,
    this.validationBuilder,
    this.value,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: DropdownButtonFormField<String>(
          onChanged: (String? newValue) {
            value!.value = newValue!;
          },
          value: value!.value == null ? null : value!.value,
          isExpanded: true,
          hint: FittedBox(
            child: Text(
              hintText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          style: const TextStyle(color: Colors.grey, fontSize: 16),
          iconEnabledColor: Colors.red,
          decoration: InputDecoration(
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
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: values.map(
            (String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          ).toList(),
          validator:
              validationBuilder != null ? validationBuilder!.build() : null,
        ),
      ),
    );
  }
}
