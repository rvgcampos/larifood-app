import 'package:larifood_app/app/data/providers/api.dart';

class UtilsApi extends Api {
  Future<dynamic> getPrepareTimeUnit() async {
    var response = errorHandler(await get(
      '/prepare-time-unit',
    ));

    return response.body;
  }

  Future<dynamic> getCategories() async {
    var response = errorHandler(await get(
      '/categories',
    ));

    return response.body;
  }

  Future<dynamic> getQtdUnit() async {
    var response = errorHandler(await get(
      '/qtd-unit',
    ));

    return response.body;
  }
}
