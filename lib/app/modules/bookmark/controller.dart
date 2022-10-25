import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/recipe.dart';
import 'package:larifood_app/app/data/providers/favorite.dart';

class BookmarkController extends GetxController {
  @override
  void onInit() async {
    var response = await favoriteApi.getFavorites();
    print(response);
    for (var recipe in (response as List)) {
      recipes.add(Recipe.fromJson(recipe['recipe']));
    }
    super.onInit();
  }

  var recipes = <Recipe>[].obs;

  final FavoriteApi favoriteApi;
  BookmarkController(this.favoriteApi);

  favorite(int id) async {
    recipes.removeWhere((element) => element.id == id);
    await favoriteApi.unFavorite(id.toString());
  }
}
