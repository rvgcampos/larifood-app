import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/widgets/input_field_dropdown.dart';

class AddIngredientComponent extends StatelessWidget {
  final TextEditingController ingredientName;
  final TextEditingController ingredientQtd;
  final Rxn<String>? ingredientUnit;
  final List<String> ingredientUnits;

  const AddIngredientComponent({
    required this.ingredientName,
    required this.ingredientQtd,
    this.ingredientUnit,
    required this.ingredientUnits,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          hintText: 'Nome do ingrediente',
          validationBuilder: ValidationBuilder().minLength(3),
          controller: ingredientName,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: InputField(
                hintText: 'Quantidade',
                validationBuilder: ValidationBuilder().required(),
                controller: ingredientQtd,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: InputFieldDropdown(
                hintText: 'Unidade de medida',
                validationBuilder: ValidationBuilder().required(),
                value: ingredientUnit,
                values: ingredientUnits,
                hasBorder: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
