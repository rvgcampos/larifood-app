import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/providers/comment.dart';
import 'package:larifood_app/app/data/providers/recipe.dart';
import 'package:larifood_app/app/modules/recipe/models/recipe.dart';
import 'package:larifood_app/app/modules/recipe/models/recipe_similar.dart';

class RecipeController extends GetxController {
  @override
  void onInit() async {
    loggedUserUser = Get.find<LoggedUser>();
    var id = Get.arguments[0]['id'];
    idRecipe.value = id.toString();
    recipe.value = Recipe.fromJson(await recipeApi.getRecipe(id.toString()));
    isAuthor.value = recipe.value!.user!.id == loggedUserUser.id;
    super.onInit();

    var response = await recipeApi.getSimilarities(id.toString());
    for (var recipe in response) {
      similarRecipes.add(RecipeSimilar.fromJson(recipe['recipeTo']));
    }

    debugPrint(similarRecipes.length.toString());
  }

  late LoggedUser loggedUserUser;

  var idRecipe = ''.obs;
  var isAuthor = false.obs;
  var recipe = Rxn<Recipe>();
  var similarRecipes = <RecipeSimilar>[].obs;

  final RecipeApi recipeApi;
  final CommentApi commentApi;
  RecipeController(this.recipeApi, this.commentApi);

  var comment = TextEditingController().obs;
  var isLoading = false.obs;

  deleteRecipe() {
    recipeApi.deleteRecipe(idRecipe.value);
    Get.back();
  }

  addComment() async {
    await commentApi.addComment(idRecipe.value, {
      "content": comment.value.text,
      "userId": loggedUserUser.id,
      "recipeId": idRecipe.value,
    });
    comment.value.clear();
    recipe.value =
        Recipe.fromJson(await recipeApi.getRecipe(idRecipe.value.toString()));
  }

  deleteComment(String commentId) async {
    await commentApi.deleteComment(idRecipe.value, commentId);
    recipe.value =
        Recipe.fromJson(await recipeApi.getRecipe(idRecipe.value.toString()));
    // recipe.value!.comments
    //     .removeWhere((element) => element.id.toString() == commentId);
  }
}
