import 'dart:convert';

import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/User.dart';
import 'package:larifood_app/app/data/providers/api.dart';

class RecipeApi extends Api {
  Future<dynamic> storeRecipe(Map<String, dynamic> map) async {
    var response = errorHandler(await post('/recipes', map));

    return response.body;
  }

  Future<dynamic> getRecipe(String id) async {
    var response = errorHandler(await get('/recipes/$id'));

    return response.body;
  }

  Future<dynamic> addPhoto(FormData form) async {
    var response = errorHandler(await post(
      '/photo/recipe',
      form,
      contentType: 'multipart/form-data',
    ));

    return response.body;
  }

  Future<dynamic> deleteRecipe(String id) async {
    var response = errorHandler(await delete(
      '/recipes/$id',
    ));

    return response.body;
  }

  Future<dynamic> getSimilarities(String id) async {
    var response = errorHandler(await get(
      '/similarity/$id',
    ));

    return response.body;
  }

  Future<dynamic> updateRecipe(String id, Map<String, dynamic> map) async {
    var response = errorHandler(await put('/recipes/$id', map));

    return response.body;
  }
}
