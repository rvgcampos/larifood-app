
import 'package:larifood_app/app/data/providers/api.dart';

class SearchApi extends Api {
  Future<dynamic> searchRecipe(String search) async {
    var response = errorHandler(await get('/search-recipe/$search'));

    return response.body;
  }

  Future<dynamic> searchUsers(String search) async {
    var response = errorHandler(await get('/search-user/$search'));

    return response.body;
  }

  Future<dynamic> searchRecipeByIngredients(List<String> searchList) async {
    var response = errorHandler(
      await post(
        '/search-recipe',
        {
          'ingredients': searchList,
        },
      ),
    );

    return response.body;
  }
}
