import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/modules/search/controller.dart';
import 'package:larifood_app/app/modules/search/widgets/recipe_component.dart';
import 'package:larifood_app/app/modules/search/widgets/user_component.dart';
import 'package:larifood_app/app/widgets/input_field.dart';
import 'package:larifood_app/app/widgets/input_field_dropdown.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputField(
                  hintText: 'Pesquisar',
                  controller: controller.search.value,
                  icon: GestureDetector(
                    onTap: () {
                      controller.makeSearch();
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                  ),
                ),
                Obx(
                  () => InputFieldDropdown(
                    value: controller.selectedSearchType,
                    values: controller.searchTypes.value,
                    hintText: 'Escolha o tipo de pesquisa',
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     print(controller.selectedSearchType);
                //     print(controller.search.value.text);
                //   },
                //   child: Text('teste'),
                // ),
                Obx(
                  () {
                    if (controller.selectedSearchType.value == 'Usuários') {
                      return ListView.builder(
                        itemCount: controller.users.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          var user = controller.users[index];
                          return UserComponent(user: user);
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: controller.recipes.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          var recipe = controller.recipes[index];
                          return RecipeComponent(recipe: recipe);
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
