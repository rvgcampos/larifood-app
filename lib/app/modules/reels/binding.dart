import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/feed.dart';
import 'package:larifood_app/app/data/providers/like.dart';
import 'package:larifood_app/app/modules/reels/controller.dart';

class ReelsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeedApi());
    Get.put(LikeApi());
    Get.put<ReelsController>(
      ReelsController(
        Get.find<FeedApi>(),
        Get.find<LikeApi>(),
      ),
    );
  }
}
