import 'package:larifood_app/app/data/providers/utils.dart';

class UtilsRepository {
  final UtilsApi api;

  UtilsRepository(this.api);

  Future<dynamic> getPrepareTimeUnit() async {
    await api.getPrepareTimeUnit();
  }

  Future<dynamic> getCategories() async {
    await api.getCategories();
  }

  Future<dynamic> getQtdUnit() async {
    await api.getQtdUnit();
  }
}
