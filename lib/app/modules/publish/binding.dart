import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/recipe.dart';
import 'package:larifood_app/app/data/providers/utils.dart';
import 'package:larifood_app/app/modules/publish/controller.dart';

class PublishBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RecipeApi>(RecipeApi());
    Get.put<UtilsApi>(UtilsApi());
    Get.put<PublishController>(
      PublishController(
        Get.find<RecipeApi>(),
        Get.find<UtilsApi>(),
      ),
    );
  }
}
