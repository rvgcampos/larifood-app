import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/favorite.dart';
import 'package:larifood_app/app/data/providers/feed.dart';
import 'package:larifood_app/app/data/providers/like.dart';
import 'package:larifood_app/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeedApi());
    Get.put(LikeApi());
    Get.put(FavoriteApi());
    Get.put<HomeController>(
      HomeController(
        Get.find<FeedApi>(),
        Get.find<LikeApi>(),
        Get.find<FavoriteApi>(),
      ),
    );
  }
}
