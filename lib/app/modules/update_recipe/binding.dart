import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/recipe.dart';
import 'package:larifood_app/app/data/providers/utils.dart';
import 'package:larifood_app/app/modules/update_recipe/controller.dart';

class UpdateRecipeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RecipeApi());
    Get.put(UtilsApi());
    Get.put<UpdateRecipeController>(
      UpdateRecipeController(
        Get.find<RecipeApi>(),
        Get.find<UtilsApi>(),
      ),
    );
  }
}
