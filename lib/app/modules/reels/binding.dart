import 'package:get/get.dart';
import 'package:larifood_app/app/modules/reels/controller.dart';

class ReelsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReelsController>(() => ReelsController());
  }
}
