import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class InputFieldDropdownAdd extends StatelessWidget {
  final ValidationBuilder? validationBuilder;
  String? value;
  List<String> values;
  bool hasBorder;

  final Function(String?)? onChanged;

  InputFieldDropdownAdd({
    super.key,
    required this.values,
    this.validationBuilder,
    this.value,
    this.onChanged,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: hasBorder ? Border.all(color: Colors.red, width: 2) : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<String>(
            onChanged: onChanged,
            value: value == null ? null : value!,
            isExpanded: true,
            hint: const Text('Escolha uma categoria'),
            style: const TextStyle(color: Colors.grey, fontSize: 16),
            iconEnabledColor: Colors.red,
            decoration: const InputDecoration(
              border: InputBorder.none,
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
          ),
        ),
      ),
    );
  }
}
