import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:http/http.dart' as http;
import 'package:larifood_app/app/data/providers/recipe.dart';
import 'package:larifood_app/app/modules/recipe/models/ingredient.dart';
import 'package:larifood_app/app/modules/recipe/models/prepare_mode.dart';
import 'package:larifood_app/app/modules/recipe/models/recipe.dart';

import 'package:larifood_app/app/data/providers/utils.dart';

class UpdateRecipeController extends GetxController {
  @override
  void onInit() async {
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

    var id = Get.arguments[0]['id'];
    recipe.value = Recipe.fromJson(await recipeApi.getRecipe(id.toString()));

    idRecipe.value = recipe.value!.id.toString();
    nameRecipe.value.text = recipe.value!.name;

    selectedCategory.value = categoriesMap.entries
        .where((element) => element.value == recipe.value!.categoryId)
        .toList()[0]
        .key;

    timeRecipe.value.text = recipe.value!.prepareTime.toString();

    selectedTimeUnit.value = timeUnitsMap.entries
        .where((element) => element.value == recipe.value!.prepareTimeUnitId)
        .toList()[0]
        .key;

    isPrivate.value = recipe.value!.isPrivate == 1 ? true : false;

    for (var ingredient in recipe.value!.ingredients) {
      ingredientsList.add(ingredient);
    }

    for (var prepareMode in recipe.value!.preparemodes) {
      prepareModesList.add(prepareMode);
    }

    avatar.value = recipe.value!.avatar ?? '';
    debugPrint(avatar.value);

    super.onInit();
  }

  formIsFilled() {
    isFilled.value = nameRecipe.value.text.isNotEmpty &&
        selectedCategory.value != null &&
        timeRecipe.value.text.isNotEmpty &&
        selectedTimeUnit.value != null;
  }

  void togglePrivacy(bool? newValue) {
    isPrivate.value = newValue!;
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
    } catch (e) {
      debugPrint(e.toString());
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

  var prepareModesList = <PrepareMode>[].obs;
  var prepareMode = TextEditingController().obs;

  var image = File('').obs;

  var isFilled = RxBool(false);
  var isPrivate = RxBool(true);

  var avatar = ''.obs;
  var recipe = Rxn<Recipe>();
  var idRecipe = ''.obs;

  final RecipeApi recipeApi;
  final UtilsApi utilsApi;

  UpdateRecipeController(this.recipeApi, this.utilsApi);

  printRecipe() async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = nameRecipe.value.text;
    data['prepareTime'] = int.parse(timeRecipe.value.text);
    data['userId'] = loggedUserUser.id;
    data['prepareTimeUnitId'] = timeUnitsMap[selectedTimeUnit.value];
    data['isPrivate'] = isPrivate.value;
    data['categoryId'] = categoriesMap[selectedCategory.value];
    List ingredientsToSend = [];
    ingredientsList.forEach((element) {
      ingredientsToSend.add(
        element.toJson(
            true,
            ingredientsUnitsMap.entries
                .firstWhere(
                  (elementMap) => elementMap.key == element.qtd_unit,
                )
                .value),
      );
    });
    data['ingredients'] = ingredientsToSend;
    List prepareModeToSend = [];
    prepareModesList.forEach((element) {
      prepareModeToSend.add(element.toJson());
    });
    data['prepareModes'] = prepareModeToSend;
    var response = await recipeApi.updateRecipe(idRecipe.value, data);

    if (avatar != '' && !avatar.startsWith('http')) {
      int index = image.value.path.indexOf('/cache/');
      debugPrint(image.value.path.substring(index + 7));

      var recipeId = response['recipe']['id'];

      var request = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.1.106:3333/photo/recipe'));
      request.files
          .add(await http.MultipartFile.fromPath('file', image.value.path));

      request.fields['idRecipe'] = recipeId.toString();
      var res = await request.send();
      debugPrint(res.reasonPhrase);
    }
    // Get.offNamed(Routes.PROFILE,preventDuplicates: true);
    Get.back();
  }
}
