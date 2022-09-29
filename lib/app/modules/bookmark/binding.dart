import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/favorite.dart';
import 'package:larifood_app/app/modules/bookmark/controller.dart';

class BookmarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteApi());

    Get.lazyPut<BookmarkController>(
      () => BookmarkController(
        Get.find<FavoriteApi>(),
      ),
    );
  }
}
