import 'package:larifood_app/app/data/models/User.dart';
import 'package:larifood_app/app/data/providers/api.dart';

class RecipeApi extends Api {
  Future<dynamic> storeRecipe(Map<String,dynamic> map) async {
    var response = errorHandler(await post('/recipes', map));

    return response.body;
  }
}
