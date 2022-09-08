import 'package:get/get.dart';
import 'package:larifood_app/app/modules/search/controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchController>(SearchController());
  }
}
