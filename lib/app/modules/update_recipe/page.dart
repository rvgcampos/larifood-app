import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/recipe/models/ingredient.dart';

import 'package:larifood_app/app/modules/recipe/models/prepare_mode.dart';
import 'package:larifood_app/app/modules/publish/widgets/add_ingredient_component.dart';
import 'package:larifood_app/app/modules/publish/widgets/ingredient_component.dart';
import 'package:larifood_app/app/modules/publish/widgets/label_recipe.dart';
import 'package:larifood_app/app/modules/update_recipe/controller.dart';
import 'package:larifood_app/app/modules/update_recipe/widgets/ingredient_component_update_recipe.dart';
import 'package:larifood_app/app/modules/update_recipe/widgets/input_field_dropdown_update_recipe.dart';
import 'package:larifood_app/app/widgets/action_button.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/widgets/input_field_add.dart';
import 'package:larifood_app/app/widgets/input_field_dropdown.dart';

class UpdateRecipePage extends GetView<UpdateRecipeController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Atualizar Receita',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              // onChanged: () {
              //   controller.formIsFilled();
              // },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelRecipe(label: 'Foto'),
                  GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      // child: controller.image.value.path != ''
                      //     ? Image.file(controller.image.value)
                      //     : const Center(
                      //         child: Icon(
                      //           Icons.photo,
                      //           color: Colors.red,
                      //           size: 36,
                      //         ),
                      //       ),
                      child: Obx(
                        () => controller.avatar.value != ''
                            ? controller.image.value.path == ''
                                ? Image.network(
                                    controller.avatar.value,
                                    height: 100,
                                  )
                                : Image.file(
                                    controller.image.value,
                                    height: 100,
                                  )
                            : const Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.red,
                                  size: 100,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const LabelRecipe(label: 'Nome'),
                  Obx(
                    () => InputField(
                      hintText: 'Escolha um nome',
                      controller: controller.nameRecipe.value,
                    ),
                  ),
                  const LabelRecipe(label: 'Categoria'),
                  Obx(
                    () => InputFieldDropdownUpdateRecipe(
                      hintText: 'Escolha uma categoria',
                      value: controller.selectedCategory.value,
                      values: controller.categories.value,
                      hasBorder: false,
                    ),
                  ),
                  const LabelRecipe(label: 'Tempo de preparo'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Obx(
                          () => InputField(
                              hintText: 'Tempo',
                              controller: controller.timeRecipe.value),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: Obx(
                          () => InputFieldDropdownUpdateRecipe(
                            hintText: 'h | min',
                            value: controller.selectedTimeUnit.value,
                            values: controller.timeUnits.value,
                            hasBorder: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const LabelRecipe(label: 'Visibilidade da receita'),
                  Obx(
                    () => CheckboxListTile(
                      value: controller.isPrivate.value,
                      contentPadding: EdgeInsets.zero,
                      onChanged: controller.togglePrivacy,
                      checkColor: Colors.white,
                      activeColor: Colors.red,
                      title: Text('Pública'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  const LabelRecipe(label: 'Ingredientes'),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.ingredientsList.length + 1,
                      itemBuilder: (context, index) {
                        if (index == controller.ingredientsList.length) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Obx(
                                () => AddIngredientComponent(
                                  ingredientName: controller.ingredient.value,
                                  ingredientQtd: controller.ingredientQtd.value,
                                  ingredientUnit:
                                      controller.selectedIngredientUnit,
                                  ingredientUnits:
                                      controller.ingredientsUnits.value,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.ingredientsList.add(
                                      Ingredient(
                                        name: controller.ingredient.value.text,
                                        qtd: int.parse(controller
                                            .ingredientQtd.value.text),
                                        // qtd_unit: controller
                                        //     .ingredientsUnitsMap[controller
                                        //         .selectedIngredientUnit.value]!
                                        //     .toString(),
                                        qtd_unit: controller
                                            .selectedIngredientUnit.value!,
                                      ),
                                    );
                                    controller.ingredient.value.clear();
                                    controller.ingredientQtd.value.clear();
                                    controller.selectedIngredientUnit.value =
                                        null;
                                  }
                                },
                                child: const Text('+ Adicionar ingrediente'),
                              ),
                            ],
                          );
                        } else if (index < controller.ingredientsList.length) {
                          var ingredient = controller.ingredientsList[index];
                          print(ingredient.name);
                          return IngredientComponentUpdateRecipe(
                            ingredient: ingredient,
                            ingredientUnits: controller.ingredientsUnits,
                            ingredientsUnitsMap: controller.ingredientsUnitsMap,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  const LabelRecipe(label: 'Modo de Preparo'),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.prepareModesList.length + 1,
                      itemBuilder: (context, index) {
                        if (controller.prepareModesList.isEmpty ||
                            index == controller.prepareModesList.length) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InputField(
                                hintText: 'Informe o passo da receita',
                                controller: controller.prepareMode.value,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.prepareModesList.add(
                                    PrepareMode(
                                      description:
                                          controller.prepareMode.value.text,
                                      order: index,
                                    ),
                                  );
                                  controller.prepareMode.value.clear();
                                },
                                child: const Text('+ Adicionar passo'),
                              ),
                            ],
                          );
                        } else if (index < controller.prepareModesList.length) {
                          var prepareMode = controller.prepareModesList[index];
                          return InputFieldAdd(
                            hintText: 'Passo 1',
                            initialValue: prepareMode.description,
                            onChanged: (value) {
                              prepareMode.description = value;
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ActionButton(
                        isFilled: true,
                        onPressed: controller.printRecipe,
                        formKey: _formKey,
                        label: 'Atualizar',
                        conditionalValidate:
                            controller.ingredientsList.isNotEmpty,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
