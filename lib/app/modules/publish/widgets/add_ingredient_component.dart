import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/widgets/input_field_dropdown.dart';

class AddIngredientComponent extends StatelessWidget {
  final TextEditingController ingredientName;
  final TextEditingController ingredientQtd;
  final Rxn<String>? ingredientUnit;
  final List<String> ingredientUnits;
  final bool isNotEmptyList;

  const AddIngredientComponent({
    super.key,
    required this.ingredientName,
    required this.ingredientQtd,
    required this.ingredientUnits,
    this.ingredientUnit,
    this.isNotEmptyList = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          hintText: 'Nome do ingrediente',
          validationBuilder:
              isNotEmptyList ? null : ValidationBuilder().minLength(3),
          controller: ingredientName,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: InputField(
                hintText: 'Quantidade',
                validationBuilder:
                    isNotEmptyList ? null : ValidationBuilder().required(),
                controller: ingredientQtd,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: InputFieldDropdown(
                hintText: 'Unidade de medida',
                validationBuilder:
                    isNotEmptyList ? null : ValidationBuilder().required(),
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
