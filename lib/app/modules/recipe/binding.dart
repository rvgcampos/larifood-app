import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/comment.dart';
import 'package:larifood_app/app/data/providers/recipe.dart';
import 'package:larifood_app/app/modules/recipe/controller.dart';

class RecipeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RecipeApi());
    Get.put(CommentApi());
    Get.lazyPut<RecipeController>(
      () => RecipeController(
        Get.find<RecipeApi>(),
        Get.find<CommentApi>(),
      ),
    );
  }
}
