import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/recipe.dart';
import 'package:larifood_app/app/data/models/user.dart';
import 'package:larifood_app/app/data/providers/search.dart';
import 'package:larifood_app/app/modules/search/models/user_search.dart';

class SearchController extends GetxController {
  @override
  void onInit() {
    selectedSearchType.value = 'Receitas pelo nome';
    super.onInit();
  }

  var search = TextEditingController().obs;

  var searchTypes = <String>[
    'Usuários',
    'Receitas pelo nome',
    'Receitas por ingredientes'
  ].obs;

  var selectedSearchType = Rxn<String>();

  var recipes = <Recipe>[].obs;
  var users = <UserSearch>[].obs;
  final SearchApi searchApi;

  SearchController(this.searchApi);

  makeSearch() async {
    recipes.clear();
    users.clear();

    if (selectedSearchType.value == 'Usuários') {
      print('usuarios');
      var response = await searchApi.searchUsers(search.value.text);
      for (var user in (response as List)) {
        users.add(UserSearch.fromJson(user));
      }
    }

    if (selectedSearchType.value == 'Receitas pelo nome') {
      print('Receitas pelo nome');

      var response = await searchApi.searchRecipe(search.value.text);
      for (var recipe in (response as List)) {
        recipes.add(Recipe.fromJson(recipe));
      }
    }

    if (selectedSearchType.value == 'Receitas por ingredientes') {
      print('Receitas por ingredientes');

      var stringSearch = search.value.text;
      var listSearch = search.value.text.split(',');
      var response = await searchApi.searchRecipeByIngredients(listSearch);
      for (var recipe in response['recipes']) {
        recipes.add(Recipe.fromJson(recipe));
      }
    }

    print(recipes.length);
  }
}
