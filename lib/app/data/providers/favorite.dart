import 'package:larifood_app/app/data/providers/api.dart';

class FavoriteApi extends Api {
  Future<dynamic> favorite(String id) async {
    var response = errorHandler(await post('/favorite/$id', {}));

    return response.body;
  }

  Future<dynamic> unFavorite(String id) async {
    var response = errorHandler(await post('/unfavorite/$id', {}));

    return response.body;
  }

  Future<dynamic> getFavorites() async {
    var response = errorHandler(await get('/favorites'));

    return response.body;
  }
}
