import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:larifood_app/app/data/models/ingredient.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/models/prepare_mode.dart';
import 'package:larifood_app/app/data/providers/recipe.dart';
import 'package:larifood_app/app/data/providers/utils.dart';
import 'package:http/http.dart' as http;
import 'package:larifood_app/app/routes/routes.dart';

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

  var image = File('').obs;

  var isFilled = RxBool(false);
  var isPrivate = RxBool(false);

  final RecipeApi recipeApi;
  final UtilsApi utilsApi;

  PublishController(this.recipeApi, this.utilsApi);

  formIsFilled() {
    isFilled.value = nameRecipe.value.text.isNotEmpty &&
        selectedCategory.value != null &&
        timeRecipe.value.text.isNotEmpty &&
        selectedTimeUnit.value != null;
  }

  void togglePrivacy(bool? newValue) {
    isPrivate.value = newValue!;
  }

  printIngredientsList() {
    debugPrint('Categoria selecionada: ${selectedCategory.value}');
    debugPrint('Nome da receita: ${nameRecipe.value.text}');
    debugPrint(
        'Tempo de preparo: ${timeRecipe.value.text} ${selectedIngredientUnit.value}');

    var c = 1;
    ingredientsList.forEach((element) {
      debugPrint(
          'INGREDIENTE ${c} - ${element.name} | ${element.qtd} | ${element.qtd_units_id}');
      c++;
    });

    c = 1;
    prepareModesList.forEach((element) {
      debugPrint('MODO DE PREPARO ${c} - ${element.description}');
      c++;
    });
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
      ingredientsToSend.add(element.toJson());
    });
    data['ingredients'] = ingredientsToSend;
    List prepareModeToSend = [];
    prepareModesList.forEach((element) {
      prepareModeToSend.add(element.toJson());
    });
    data['prepareModes'] = prepareModeToSend;
    // print(data);
    var response = await recipeApi.storeRecipe(data);
    print(response);

    // int index = image.value.path.indexOf('/cache/');
    // print(image.value.path.substring(index + 7));

    var idRecipe = response['recipe']['id'];

    // MultipartFile file = MultipartFile(
    //   await image.value.readAsBytes(),
    //   filename: image.value.path.substring(index + 7),
    // );

    // FormData form = FormData({});
    // form.fields.add(MapEntry('recipeId', idRecipe.toString()));
    // form.files.add(MapEntry('file', file));
    // var responsePhoto = await recipeApi.addPhoto(form);
    // print(responsePhoto);

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.106:3333/photo/recipe'));
    request.files
        .add(await http.MultipartFile.fromPath('file', image.value.path));

    request.fields['idRecipe'] = idRecipe.toString();
    var res = await request.send();
    print(res.reasonPhrase);
    Get.toNamed(Routes.DASHBOARD);
  }

  var prepareModesList = <PrepareMode>[].obs;
  var prepareMode = TextEditingController().obs;
}
