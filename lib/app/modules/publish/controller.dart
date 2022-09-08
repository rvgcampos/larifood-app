import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/ingredient.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/models/prepare_mode.dart';
import 'package:larifood_app/app/data/providers/recipe.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/providers/utils.dart';

class PublishController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    loggedUserUser = Get.find<LoggedUser>();

    var responseCategories = await utilsApi.getCategories();
    for (var category in (responseCategories as List)) {
      categories.add(category['name']);
      categoriesMap[category['name']] = category['id'];
    }

    var responsePrepareTimeUnit = await utilsApi.getPrepareTimeUnit();
    for (var prepareTimeUnit in (responsePrepareTimeUnit as List)) {
      timeUnits.add(prepareTimeUnit['name']);
      timeUnitsMap[prepareTimeUnit['name']] = prepareTimeUnit['id'];
    }

    var responseQtdUnit = await utilsApi.getQtdUnit();
    for (var qtdUnit in (responseQtdUnit as List)) {
      ingredientsUnits.add(qtdUnit['name']);
      ingredientsUnitsMap[qtdUnit['name']] = qtdUnit['id'];
    }
  }

  late LoggedUser loggedUserUser;

  var nameRecipe = TextEditingController().obs;

  var categories = <String>[].obs;
  var categoriesMap = {}.obs;
  var selectedCategory = Rxn<String>();

  var timeRecipe = TextEditingController().obs;
  var timeUnits = <String>[].obs;
  var timeUnitsMap = {}.obs;
  var selectedTimeUnit = Rxn<String>();

  var ingredientsList = <Ingredient>[].obs;
  var ingredient = TextEditingController().obs;
  var ingredientQtd = TextEditingController().obs;
  var ingredientsUnits = <String>[].obs;
  var ingredientsUnitsMap = <String, int>{}.obs;
  var selectedIngredientUnit = Rxn<String>();

  var isFilled = RxBool(false);

  final RecipeApi recipeApi;
  final UtilsApi utilsApi;

  PublishController(this.recipeApi, this.utilsApi);

  formIsFilled() {
    isFilled.value = nameRecipe.value.text.isNotEmpty &&
        selectedCategory.value != null &&
        timeRecipe.value.text.isNotEmpty &&
        selectedTimeUnit.value != null;
  }

  printIngredientsList() {
    print('Categoria selecionada: ${selectedCategory.value}');
    print('Nome da receita: ${nameRecipe.value.text}');
    print(
        'Tempo de preparo: ${timeRecipe.value.text} ${selectedIngredientUnit.value}');

    var c = 1;
    ingredientsList.forEach((element) {
      print(
          'INGREDIENTE ${c} - ${element.name} | ${element.qtd} | ${element.qtd_units_id}');
      c++;
    });

    c = 1;
    prepareModesList.forEach((element) {
      print('MODO DE PREPARO ${c} - ${element.description}');
      c++;
    });
  }

  printRecipe() async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = nameRecipe.value.text;
    data['prepareTime'] = int.parse(timeRecipe.value.text);
    data['userId'] = loggedUserUser.id;
    data['prepareTimeUnitId'] = timeUnitsMap[selectedTimeUnit.value];
    data['isPrivate'] = false;
    data['categoryId'] = categoriesMap[selectedCategory.value];
    List ingredientsToSend = [];
    ingredientsList.forEach((element) {
      ingredientsToSend.add(element.toJson());
    });
    data['ingredients'] = ingredientsToSend;
    List prepareModeToSend = [];
    prepareModesList.forEach((element) {
      prepareModeToSend.add(element.toJson());
    });
    data['prepareModes'] = prepareModeToSend;
    print(data);
    await recipeApi.storeRecipe(data);
  }

  var prepareModesList = <PrepareMode>[].obs;
  var prepareMode = TextEditingController().obs;
}
