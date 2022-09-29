import 'package:larifood_app/app/data/providers/api.dart';

class LikeApi extends Api {
  Future<dynamic> like(int id) async {
    var response = errorHandler(await post('/recipes/$id/like', {}));

    return response.body;
  }
}
