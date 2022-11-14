import 'package:flutter/cupertino.dart';
import 'package:larifood_app/app/data/models/ingredient.dart';
import 'package:larifood_app/app/widgets/input_field_add.dart';
import 'package:larifood_app/app/widgets/input_field_dropdown_add.dart';

class IngredientComponent extends StatelessWidget {
  Ingredient ingredient;
  List<String> ingredientUnits;
  Map<String, int> ingredientsUnitsMap;

  IngredientComponent({
    required this.ingredient,
    required this.ingredientUnits,
    required this.ingredientsUnitsMap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFieldAdd(
          hintText: 'Ingrediente 1',
          initialValue: ingredient.name,
          onChanged: (value) {
            ingredient.name = value;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: InputFieldAdd(
                hintText: 'Qtd',
                textInputType: TextInputType.number,
                initialValue: ingredient.qtd.toString(),
                onChanged: (value) {
                  ingredient.qtd = int.parse(value);
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: InputFieldDropdownAdd(
                hasBorder: false,
                value: ingredientsUnitsMap.entries
                    .firstWhere(
                      (element) => element.value == ingredient.qtd_units_id,
                    )
                    .key,
                values: ingredientUnits,
                onChanged: (String? value) {
                  ingredient.qtd_units_id = ingredientsUnitsMap[value]!;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
